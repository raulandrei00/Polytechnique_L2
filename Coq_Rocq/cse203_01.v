(* ====================================================================
 * We start by loading a few libraries and declaring some
 * propositional variables.
 * ==================================================================== *)

Require Import ssreflect.

Parameter A B C D : Prop.


(* ====================================================================
 * Introducing the "move" tactic
 * ==================================================================== *)

(* `move` allows giving a name to the first (top) assumption of
 * the current goal. For example: *)

Lemma move_ex : A -> B -> A.
Proof.
move=> hA hB.
Abort.

(* ====================================================================
 * Introducing the "assumption" tactic
 * ==================================================================== *)

(* `assumption` closes a goal when it can be discharged from an
 * assumption. For example: *)

Lemma assumption_ex : A -> B -> A.
Proof.
(* Introduce the assumptions `A` & `B` with respective
 * names `hA` and `hB`. *)
move=> hA hB.
(* The goal can be solved by `hA` *)
assumption.
Qed.

(* It is also possible to close the goal by explicitly giving the name
 * of the assumption, using `apply`: *)

Lemma apply_ex : A -> B -> A.
Proof.
(* Introduce the assumptions `A` & `B` with respective names
 * `hA` and `hB`. *)
move=> hA hB.
(* The goal can be solved by `hA` *)
apply hA.
Qed.

(* ====================================================================
 * Some basic propositional reasonning
 * ==================================================================== *)

Lemma ex0 : A -> A.
Proof.
Admitted.

Lemma ex1 : forall A : Prop, A -> A.
Proof.
Admitted.
  
Lemma ex2 : (A -> B) -> (B -> C) -> A -> C.
Proof.
Admitted.

Lemma ex3 : (A -> B -> C) -> (B -> A) -> B -> C.
Proof.
Admitted.

(* ====================================================================
 * With conjunctions
 * ==================================================================== *)

(* examples *)

Lemma demo_conj1 : (A /\ B) -> A.
Proof.
  move => [a b].
  exact a.
Qed.


Lemma demo_conj2 : A -> B -> A /\ B.
Proof.
  move => a b.
  split.
    exact a.
  exact b.
Qed.

(* your turn *)

Lemma conj_ex1: A /\ B <-> B /\ A.
Proof.
  split.
    move => [a b].
    split.
      exact b.
    exact a.
  move => [b a].
  split.
    exact a.
  exact b.
Qed.
(* Admitted. *)

(* ====================================================================
 * With disjunctions
 * ==================================================================== *)

(* examples *)

Lemma demo_disj1 : A -> A \/ B.
Proof.
move=> a.
 left.
 trivial.
Qed.

Lemma demo_disj2 : B -> A \/ B.
Proof.
move=> a. right. trivial.
Qed.

Lemma demo_disj3 : A \/ B -> C.
move=> h. case: h => [a | b].    (* gives two subgoals *)
Abort.

(* Your turn *)

Lemma disj_ex1 :  A \/ B <-> B \/ A.
Proof.
  split.
    move => ab.
    case: ab.
      right.
      trivial.
    left. trivial.
  move => ba.
  case ba.
    right. trivial.
  left.
  trivial.
Qed.
(* Admitted. *)

Lemma disj_ex2 : A /\ B -> A \/ B.
Proof.
  move => [a b].
  left. trivial.
Qed.
(* Admitted. *)

(* ====================================================================
 * For negations
 * ==================================================================== *)

Print not.  (* not A (or ~A) is a shorthand for (A -> False) *)

(* examples *)

Lemma demo_not1 : False -> A.
Proof.
(* We can prove any goal from False *)
move=> h. case: h.
Qed.

(* Your turn *)

Lemma not_ex1 : A -> ~(~A).
Proof.
  move => a na.
  apply na.
  apply a.
Qed.
  (* Admitted. *)

Lemma not_ex2 :  (A -> B) -> ~B -> ~A.
Proof.
  move => ab.
  move => nb a.
  apply nb.
  apply ab.
  apply a.
Qed.
(*Admitted.*)

Lemma not_ex3 : ~ ~(A \/ ~A).
Proof.
  move => a_na.
  apply a_na.
  right.
    move => a.
  apply a_na.
  left.
  apply a.
Qed.
(*Admitted.*)

Lemma not_ex4 :  (A \/ B) /\ C <-> (A /\ C) \/ (B /\ C).
Proof. (*Admitted.*)
  split.
  move => [ab c].
  case: ab.
  move => a.
  left. split. 
    apply a.
    apply c.
  move => b.
  right. split.
    apply b. apply c.
  move => x.
  split.
  case: x.
  move => ac.
  case: ac. move => a.
  move => c.
  left. apply a.
  move => bc.
  case: bc.
  move => b. move => c.
  right. apply b.
  case: x.
  move => ac. case: ac.
  move => a. move=>c.
  apply c.
  move => bc. case: bc.
  move => b. move => c.
  apply c.
Qed.

Lemma not_ex5 : (A /\ B) \/ C <-> (A \/ C) /\ (B \/ C).
Proof. (*Admitted. *)
  split.
  move => x.
  case: x.
  move => ab.
  case: ab.
  move => a. move => b.
  split.
  left. apply a.
  left. apply b.
  move => c.
  split.
  right. apply c.
  right. apply c.
  move => x.
  case: x.
  move =>ac. move => bc.
  case: ac.
  move => a.
  case: bc.
  move => b.
  left. split.
    apply a. apply b.
  move => c.
  right. apply c.
  move => c.
  right. apply c.
Qed.





