(* -------------------------------------------------------------------- *)
Require Import ssreflect ssrbool.
(*Require Import Coq.Arith.Arith.*)


(*Remove Hints plus_n_Sm plus_n_O : core.*)

(* Counting points at Belote *)

(* Belote is a 32-card (A, K, Q, J, 10, 9, 8, 7), trick-taking,
 * Ace-Ten game. We won't explain the rules here, but only give the
 * scoring basics.
 *
 * In Belote, each card rank has a specific scoring value; for Jacks and
 * Nines the value depends on whether the suit is trump or not.
 *
 * We give below the scoring for each card:
 *
 *
 *    |  Trump | Normal |  
 * ============|========|
 *  A |     11 |    11  |  
 *  7 |      0 |     0  |  
 *  8 |      0 |     0  |  
 *  9 |     14 |     0  |  
 * 10 |     10 |    10  |  
 *  J |     20 |     2  |  
 *  Q |      3 |     3  |  
 *  K |      4 |     4  |  
 *)

(* We first define an inductive type for representing cards *)

Inductive card := A | K | Q | J | F10 | F9 | F8 | F7.

(* Define a function [score (c : card) (trump : bool) : nat]
 * that computes the score of card [c] and the Trump Suite flag
 * [trump]. *)

Definition score (c : card) (trump : bool) :=
  match c, trump with
  | A  , _     => 11
  | F7 , _     => 0
  | F8 , _     => 0
  | F9 , true  => 14
  | F9 , false => 0
  | F10, _     => 10
  | J  , true  => 20
  | J  , false => 2
  | Q  , _     => 3
  | K  , _     => 4
  end.

(* Prove the following lemmas *)

(* In these proofs, the tactics discriminate and contradiction
 * will allow you to take care of hypotheses of the form
 *  true <> true, resp.  true = false   *)

Lemma L1 : forall (c : card),
  c <> J -> c <> F9 -> score c true = score c false.
Proof. (*Admitted.*)
move => c.
case c.
trivial.
trivial.
trivial.
move => x.
move => y.
contradiction.
trivial. 
move => x.
contradiction.
trivial. trivial.
Qed.

Lemma L2 : forall (b : bool), score F9 b <> 0 -> b = true.
Proof. (*Admitted.*)

move => b.
case b.
trivial.
simpl.
trivial.
move => ts.
contradiction.


Qed.
(*
Lemma init n : n <= n.
Proof. by apply: le_n. Qed.
Lemma less_succ n : n <= S n.
Proof. by apply: le_S; apply: le_n. Qed.

Lemma false_bound : forall (c: card), score c false <= 11.
Proof.
move => c.
case c.
simpl.
trivial.
simpl.
auto with arith.
simpl.
auto with arith.
simpl.
auto with arith.
simpl.
auto with arith.
simpl.
auto with arith.
simpl.
auto with arith.
simpl.
auto with arith.
Qed.

Lemma less_is_dif : forall (n m: nat), n <= m -> n <> S m.

intros n m Hle Heq.
subst n.
apply (le_Sn_n m).
exact Hle.
Qed.
*)
Lemma L3 : forall (c1 c2 : card) (b : bool),
  score c1 b + score c2 b = 25 -> b = true.
Proof. (*Admitted.*)
move => c1 c2.

move => b.
case b.
trivial.
simpl.
case: c1; case: c2; simpl; discriminate.


Qed.

(* ==================================================================== *)
(* Let's have a look on the definition of addition *)
Print Nat.add.

(* We can use Coq for computing closed formula *)
Eval compute in 2+2.

Parameter x : nat.

(* And let's try to computer with open terms *)
Eval compute in 0+x.
Eval compute in x+0.

(* A proof by reflexivity *)
Lemma calc : 200 + 200 = 400.
Proof.
(* 200 + 200 computes to 400 *)
reflexivity.
Qed.

(* Easy... and should be done by computation *)
Lemma add0n : forall n:nat, 0 + n = n.
Proof. move => n.
simpl.
trivial.
Qed.

(* This one needs an induction *)
Lemma addn0 : forall n, n + 0 = n.
Proof.
move => n.
induction n.
trivial.
simpl.
rewrite IHn.
trivial.
Qed.

(* More lemmas on natural numbers... *)
Lemma addSn : forall n m, S n + m = S(n + m).
Proof. 
move => n m.
simpl.
trivial.
Qed.

Lemma addn1 : forall n, n + 1 = S n.
Proof.
  induction n.
  - simpl. reflexivity.          (* 0 + 1 = 1 = S 0 *)
  - simpl. rewrite IHn. reflexivity.  (* S n + 1 = S (n + 1) = S (S n) *)
Qed.


Lemma addnS : forall n m, n + S m = S (n + m).
Proof.
move => n m.
induction n.
reflexivity.
trivial.
simpl.
rewrite IHn.
trivial.
Qed.


Lemma addnC : forall n m, n + m = m + n.
Proof.
induction n.
simpl.
move => m.
rewrite addn0.
trivial.
simpl.
move => m.
rewrite addnS.
rewrite IHn.
trivial.
Qed.


Lemma addnA : forall n m p, n + (m + p) = (n + m) + p.
Proof.
move => n m p.
induction n.
rewrite add0n.
reflexivity.
rewrite addSn.
rewrite IHn.
reflexivity.
Qed.

(* ==================================================================== *)
(* We know want to compare natural numbers with the following predicate *)
Fixpoint le (x y : nat) :=
  match x, y with
  | 0  , _   => true
  | S _, 0   => false
  | S x, S y => le x y
  end.

(* Note that booleans are projected to propositions :
 * if b is a boolean, the proposition b stands for b = true  *)

(* Check this with :  *)

Lemma b1 : true.
Proof.
reflexivity.
Qed.

Lemma b2 : false -> False.
Proof.
move => h.
discriminate.
Qed.


(* Let's first prove that [comp] is defining an proper order *)
Lemma le_refl : forall n, le n n.
Proof.
move => n.
induction n.
trivial.
apply IHn.
Qed.

Lemma le_trans : forall n m p, le n m -> le m p -> le n p.
Proof.
induction n as [|n IH]; intros [|m] [|p]; simpl; try trivial.
trivial.
discriminate.
apply IH.
Qed.
(*
destruct p.
move => nm m0.
destruct n.
trivial.
simpl.
destruct m.
trivial. trivial.
(*move => nm msp.*)
destruct n.
trivial.
simpl.
destruct m.
destruct n.
trivial. 
simpl.
destruct p.
trivial.
destruct p.
destruct n.
trivial.
simpl.
trivial.
destruct n.
trivial.
simpl.


exfalso.


induction p.
move => nm m0.
destruct n.
trivial.
destruct m.
rewrite nm.
trivial.
simpl.
apply m0.
(*move => nm msp.*)
destruct n.
trivial.
destruct n.
destruct p.
trivial.
destruct m.
trivial.
move => usm smssp.
trivial.
destruct m.
simpl.
destruct p.
trivial.
case p.
case n.
trivial.
simpl. trivial.
induction n.
trivial.
simpl.
rewrite IHn.

 
case n.
trivial.
induction n0.
simpl.
case p.
trivial. trivial.
case p.
trivial.
simpl.
(*move => unm msp.*)




simpl.
destruct n.
trivial.
case n.


induction n.
simpl.
reflexivity.
move => m p.
induction m.
simpl.
move => h1 h2.
by rewrite h1.
rewrite IHm.
simpl.
destruct m.



move => a b.
induction p.
trivial.
simpl.


*)

Lemma le_antisym : forall n m, le n m -> le m n -> n = m.
Proof.   

induction n as [|n IH]; intros [|m]; simpl; intros Hnm Hmn.
trivial. 
discriminate Hmn.
discriminate Hnm.
f_equal.
apply IH.
trivial. trivial.
Qed. (*
induction n.
induction m.
trivial.
simpl.
destruct m.
discriminate.
discriminate.
(*move => m.*)
simpl.
destruct m.
simpl.
discriminate.
simpl.
destruct m.
simpl.
destruct n.
trivial.
discriminate.
simpl.
destruct n.
simpl.
destruct m.
discriminate.
*)

(* 0 is the bottom element of this order *)
Lemma le0n : forall n, le 0 n.
Proof.
move=>n.
destruct n.
trivial.
simpl.
trivial.
Qed.

(* Let's give a specification for le *)
Lemma leP: forall n m, le n m -> exists p, m = n + p.
Proof.

  induction n as [|n IH]; intros [|m] Hle; simpl in *.

  exists 0. trivial.
  exists (S m).
  trivial.
  discriminate Hle.
  destruct (IH m Hle) as [p HP].
  exists p.
  f_equal.
  trivial.
Qed.

(* ==================================================================== *)
(* THIS PART IS NOT MANDATORY *)

(* We define the type for list over natural numbers *)

Inductive list : Type :=
| nil  : list
| cons : nat -> list -> list.

(* We define a function for concatenating lists *)
Fixpoint cat (l1 l2 : list) : list :=
  match l1 with
  | nil       => l2
  | cons x tl => cons x (cat tl l2)
  end.

(* Prove the following properties: *)

Lemma cat0s : forall (l : list), cat nil l = l.
Proof. Admitted.

Lemma cats0 : forall (l : list), cat l nil = l.
Proof. Admitted.

(* Define a function for computing the length of a list... *)
Fixpoint size (s : list) : nat := 0. (* FIXME *)

(* ...and prove the following property *)
Lemma length_cat : forall (s1 s2 : list), size (cat s1 s2) = size s1 + size s2.
Proof. Admitted.
