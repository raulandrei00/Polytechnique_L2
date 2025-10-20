(* -------------------------------------------------------------------- *)
Require Import ssreflect.

(* Predicates                                                           *)
(* ==================================================================== *)

Lemma p1 (P : nat -> Prop) (n : nat) : P n ->  P n.
Proof. (*Admitted.*)
  move => Pn.
  exact Pn.
Qed.


(* Quantifiers                                                          *)
(* ==================================================================== *)

Parameter P : nat -> Prop.
Parameter Q : nat -> Prop.

Axiom PQ : forall n, P n -> Q n.

Lemma q1 : (P 3) -> exists x, Q x.
Proof. (*Admitted.*)
  move => p3.  
  exists 3.
  apply PQ.
  apply p3.
Qed.

Lemma q1' : (exists x, P x) -> exists x, Q x.
Proof. (*Admitted.*)
  move => [x y].
  exists x.
  apply PQ.
  apply y.
Qed.

Lemma q2 : ~(exists x, P x) -> forall x, ~P x.
Proof. (*Admitted.*)
  move => X.
  move => y.
  move => P.
  apply X.
  exists y.
  apply P.
Qed.
(* Here you may want to use the tactic  apply ... with ... *)
Lemma q3 : (forall x, ~P x) -> ~(exists x, P x).
Proof. (*Admitted.*)
  move => X.
  move => [Y].
  apply X.
Qed.
Lemma q4 (R : nat -> nat -> Prop) :
  (exists x, forall y, R x y) -> (forall y, exists x, R x y).
Proof. (*Admitted. *)
  move => [x RY].
  exists x.
  apply RY.
Qed.

(* Leibniz equality                                                     *)
(* ==================================================================== *)

Definition Leibniz (T:Type) (x : T) :=
  fun y => forall P : T->Prop, (P y) -> (P x).


Lemma Lte : forall T x y, Leibniz T x y -> x = y.
Proof. (*Admitted.*)
  move => x.
  move => y.
  move => p.
  move => t.
  apply t.
  trivial.
Qed.
Lemma etL : forall T x y, x = y -> Leibniz T x y.
Proof. (*Admitted. *)
  move => T x y -> p py.
  apply py.
Qed.
(* Do the following ones without using the two previous lemmas          *)
Lemma L_sym : forall T x y, Leibniz T x y -> Leibniz T y x.
Proof. (*Admitted.*)
  move => t x y L.
  apply L.
  move => LL.
  trivial.
Qed.

Lemma L_trans : forall T x y z,
  Leibniz  T x y -> Leibniz T y z ->  Leibniz T x z.
Proof. (*Admitted.*)
  move => T x y z Lxy lyz.
  move => lxz.
  move => lzzz.
  apply Lxy.
  apply lyz.
  apply lzzz.
Qed.
(* Using negation                                                       *)
(* ==================================================================== *)
Lemma ex_neg :forall A B : Prop, A -> ~A -> B.
Proof.
move => A B a na.

(* The following command eliminates the False in 'na' and then asks to  *)
(* prove the assumption A left of the -> in ~A                          *)
case na.

assumption.
Qed.


(* Classical reasonning                                                 *)
(* ==================================================================== *)

(* By default, in Coq, one does not have the principle that any         *)
(* proposition is either true or false (the excluded middle).  We will  *)
(* come back to the reason behind this surprising fact in later         *)
(* lessons. But it is possible to assume the excluded middle as an      *)
(* axiom.                                                               *)

(* Here we start by assuming another classical axiom                    *)
Axiom DNE : forall A : Prop, ~(~A) -> A.

(* Show this axiom entails the excluded middle:                         *)
(* Difficulty: HARD                                                     *)
Lemma excluded_middle : forall A:Prop, A \/ ~A.
Proof. (*Admitted.*)
  move => A.
  unfold not.
  apply DNE.
  move => H.
  apply H.
  right.
    move => a.
    apply H.
  left. apply a.
Qed.
Lemma cl1 : exists x, (exists y, P y) -> P x.
Proof.
(* See here how one can use the excluded_middle "lemma" by              *)
(* instantiating the universally quantified variable A                  *)
move: (excluded_middle (exists x, P x)).
move => p.
apply DNE.
move => X.
apply X.
move: (excluded_middle (exists x : nat, (exists y : nat, P y) -> P x)).
move => a.
destruct p as[Hex | Hnex].
destruct Hex as [x px].
exists x.
trivial.

exists 0.
move => [W E].
case: Hnex.
exists W.
apply E.
Qed.

(*
exists 0.
move =>PP.


apply DNE.
move => Q.

apply Q.
unfold not.
*)

(* now finish the proof                                                 *)

(*Admitted.*)

(* The following lemma is known as the "drinker's paradox": In any      *)
(*pub, there is one person x such that, if that person drinks, the      *)
(*everybody in the pub also drinks                                      *)

(* Formally, it is a slightly more complicated variant of the previous  *)
(* lemma.                                                               *)
(* Difficulty: HARD                                                     *)
Lemma drinker_paradox (P : nat -> Prop) :
  exists x : nat, forall y : nat, P x -> P y.
Proof.
  apply DNE. 
  unfold not; intro H.

  destruct (excluded_middle (exists x, ~ P x)) as [[x Hx] | Hnone].
    apply H.
    exists x. intros y Px. contradiction.
    apply H.
    exists 0. intros y Px.
    apply DNE. intro nPy. apply Hnone. exists y. exact nPy.
Qed.
    
















