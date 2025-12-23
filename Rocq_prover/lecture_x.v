From mathcomp Require Import ssreflect ssrbool ssrnat.
Require Import Coq.Arith.PeanoNat.


Fixpoint le (x y : nat) := 
  match x, y with 
  | 0 , _ => true
  | S _ , 0 => false
  | S x, S y => le x y
  end.

Lemma le_trans : forall n m p, le n m -> le m p -> le n p.
Proof.
 induction n; (* == elim => [ | n' IHn]; (you can choose induction step name*)
(*case => [ | m' ] [ | p']; simpl; try done.*)
case => [ | m' ] [ | p'] //=. (*does the same as above*)
apply IHn.
Qed.
(*------------------LISTS-----------------*)

Inductive list :=
  | nil : list
  | cons : nat -> list -> list.

Print nat.
Check (cons 4 (cons 5 nil)).

Fixpoint len l := 
  match l with
  | nil => 0
  | cons n l' => 1 + len(l')
  end.

Definition sample_list := cons 1 (cons 2 (cons 3 nil)).

Definition mountain_list := cons 1 (cons 3 (cons 2 nil)).


Eval compute in (len sample_list).

Eval compute in (len (cons 4 (cons 5 nil))).

Fixpoint sum l := 
  match l with 
  | nil => 0
  | cons n l' => n + sum(l')
  end.

Eval compute in (sum sample_list).

Fixpoint append l1 l2 := 
  match l1 with 
  | nil => l2
  | cons n l1' => cons n (append l1' l2)
  end.

Lemma app_nil1: forall l, append nil l = l.
Proof.
move => l.
simpl.
trivial.
Qed.

Lemma app_lnil: forall l, append l nil = l.
Proof.
move => l.
induction l. (* elim [| n l hl].*)
trivial.
simpl.
rewrite IHl.
trivial.
Qed.

Lemma sum_app: forall l1 l2, sum(append l1 l2) = (sum l1) + (sum l2).
Proof.

induction l1; simpl.
 - reflexivity.
 - simpl.
move => l2.
rewrite IHl1.
Search (_ = (_ + _ + _)).
rewrite addnA.
trivial.
Qed.


Fixpoint insert n l := 
  match l with
  | nil => cons n nil
  | cons n' l' => 
     if (n < n')
     then cons n (cons n' l')
     else cons n' (insert n l')
  end.

Eval compute in (insert 0 sample_list).
Eval compute in (insert 2 sample_list).
Eval compute in (insert 5 sample_list).

Fixpoint insertion_sort l := 
  match l with 
  | nil => nil
  | cons n l' => insert n (insertion_sort l')
  end.

Eval compute in insertion_sort (cons 5 (cons 1 (cons 3 (cons 2 nil)))).

Inductive tree : Type := 
  | Leaf : tree
  | Node : nat -> tree -> tree -> tree.

Check orb.

Fixpoint search_naive n t := 
  match t with 
  | Leaf => false
  | Node m t1 t2 => 
    orb (n =? m) (orb (search_naive n t1) (search_naive n t2))
  end.

Definition sample_tree := 
  (Node 4 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf)).


Eval compute in (search_naive 3 sample_tree).
Eval compute in (search_naive 6 sample_tree).

(* add in BST*)
Fixpoint add n t := 
  match t with 
  | Leaf => Node n Leaf Leaf
  | Node m t1 t2 =>
    if (n <? m)
    then Node m (add n t1) t2
    else Node m t1 (add n t2)
  end.

Eval compute in 
  (add 4 (add 2 (add 7 (add 5 Leaf)))).

Fixpoint search_BST n t := 
  match t with 
  | Leaf => false
  | Node m left_subtree right_subtree => 
    if (n =? m) 
    then true
    else 
      if (n <? m)
      then search_BST n left_subtree
      else search_BST n right_subtree
  end.

Eval compute in (search_BST 3 sample_tree).
Eval compute in (search_BST 6 sample_tree).

Lemma append_assoc : forall l1 l2 l3,
  append l1 (append l2 l3) = append (append l1 l2) l3.
Proof. induction l1.
simpl. reflexivity.
simpl.
move => l2 l3.
rewrite IHl1.
reflexivity.
Qed.



(*
Definition max: n1 n2 := 
  match (n1 < n2) with
  | true => n2
  | false => n1
  end.

Fixpoint max_l: l := 
  match l with:
  | nil => 0
  | n l' => max n (max_l l')
*)