
Require Import ssreflect ssrbool Nat.

(* We start by going through material shown in the lecture and
meant to illustrate how inductively defined predicates work *)

(* example 1 : two definitions of equality over natural numbers *)


(* already pre-defined   eqb n m is pretty-printed  n =? m 
Fixpoint eqb n m :=
  match n, m with
  | 0, 0 => true
  | S n, S m => eqb n m
  | _, _ => false
  end.
*)

(* The inductively defined equality is the regular equality n = m *)

Lemma eqb_eq : forall n m, n =? m -> n = m.
Proof.
(* note the compact way to do an induction over n
   and a case analysis over m at the same time
   - three of the four soubgoals are solved by
      done (here written //=                   *)
elim => [|n hn][|m] //=.
  
move => e; rewrite (hn m).
  assumption.
reflexivity.
Qed.

Lemma eqb_refl : forall n, n =? n.
Proof.
(* here //= does simpl; assumption *)
elim => [| n hn]//=.
Qed.

Lemma eq_eqb : forall n m, n = m -> n =? m.
Proof.
move => n m ->.
apply eqb_refl.
Qed.
  
(* We can use these two results for proving the following *)
(* This lemma can be emulated by the tactic injection but
   here we prove it by hand     *)
Lemma eq_Snm_nm : forall n m, S n = S m -> n = m.
Proof.
move => n m e.
apply eqb_eq.
apply (eq_eqb _ _ e).
Qed.

(* example 2 : less or equal *)

(* 
Fixpoint leb n m := 
  match n, m with
 | 0, _ => true
 | S n, S m => leb n m
 | S _, 0 => false
 end.

Inductive le (n : nat) : nat -> Prop :=  
 | le_n : le n n 
 | le_S : forall m : nat, le n m -> le n (S m).

 *)
Lemma leb_refl : forall n, n <=? n.
Proof.
elim => [|n hn]//=.
Qed.

Lemma leb_S : forall n m, n <=? m -> n <=? S m.
Proof.
elim => [|n hn][|m]//=.
move => l; auto.  (* auto tries to apply hypotheses *)
Qed.

Lemma le_leb : forall n m, n <= m -> n <=? m.
Proof.
move => n m l.
induction l.
  apply leb_refl.
apply leb_S; auto.
Qed.

Lemma le_0 : forall n, 0 <= n.
Proof.
elim => [|n hn].
  apply le_n.
by apply le_S.
Qed.

Lemma le_SS : forall n m, n <= m -> S n <= S m.
Proof.
move => n m l.
induction l.
  apply le_n.
by apply le_S.
Qed.
    
Lemma leb_le : forall n m, n <=? m -> n <= m.
Proof.
elim => [|n hn][|m]//=.
  move => *; apply le_0.
move => l; apply le_SS.
auto.
Qed.


(* again we prove the following by going through the boolean 
   version of the lemma    *)
Lemma lep_Snm_nm : forall n m, S n <= S m -> n <= m.
Proof.
move => n m l.
apply leb_le.  
apply (le_leb _ _ l).
Qed.

(* example 3 : being even *)

Fixpoint evenb n :=
  match n with
  | O => true
  | S n => negb (evenb n)
  end.


Inductive even : nat -> Prop :=
| even_0 : even 0
| even_SS : forall n, even n -> even (S (S n)).

(* There is no possible constructor for proving even (S 0)  *)
(* Thus even 1 is false. The proof is obtained by the tactic 
   'inversion'  *)

Lemma even1 : ~even 1.
Proof.
move => e.
inversion e.
Qed.


Lemma negb_invol : forall b, ~~ ~~ b = b.
Proof.
  by case.
Qed.

(* one direction of the implication is easy *)
Lemma even_pb : forall n, even n -> evenb n.
Proof.
move => n e.
induction e.
trivial.
simpl.
rewrite negb_invol.
trivial.
Qed.

(* The other way around is more delicate because
we need to apply the induction hypothesis to n-2
and not n-1.
This is handeld by strengthening the induction hypothesis
and using <=   *)

Lemma even_bp_aux :
  forall n,
  forall m, m <= n ->
             evenb m -> even m.
Proof.
elim => [|n hn][|[|m]]//=; try by move => *; apply even_0.
 inversion 1.
rewrite negb_invol.
move => l e.
apply even_SS.
apply hn; trivial.
apply lep_Snm_nm.
apply le_S.
by apply lep_Snm_nm.
Qed.




(* Now the main exercise part*)


(* Here we mix some previously studied structures structure (lists) 
with an inductive definition of the permutation relation *)


(* Those first definitions are well-known to you now *)
Inductive list :=
  nil | cons : nat -> list -> list.

Fixpoint app l1 l2 :=
  match l1 with
  | nil => l2
  | cons n l => cons n (app l l2)
  end.

Fixpoint length l :=
  match l with
  | nil => 0
  | cons _ l => S (length l)
  end.

Lemma app_length : forall l1 l2,
    length (app l1 l2) = length l1 + length l2.
Proof.
  elim => [|n l1 Hl1] //=.
  move => l2.
  rewrite Hl1. trivial.
Qed.

(* Now the new component: we can define what it means for 
   two lists to be permutations of each other, as an 
   inductive predicate *)

(* It should be clear that all the constructors correspond 
   to cases of permutations. *)
Inductive perm : list  -> list -> Prop :=
  perm_refl : forall l, perm l l
| perm_ins : forall a l1 l2, perm (cons a (app l1 l2))(app l1 (cons a l2))
| perm_trans : forall l1 l2 l3, perm l1 l2 -> perm l2 l3 -> perm l1 l3.


(* this is another previous version which wuld involve other 
   technical lemmas - I leave it here to show one has
   the choice  
Inductive perm : list -> list -> Prop :=
  perm_refl : forall l, perm l l
| perm_cons : forall a l1 l2, perm l1 l2 -> perm (cons a l1)(cons a l2)
| perm_app : forall a l,  perm  (cons a l) (app l (cons a nil))
| perm_trans : forall l1 l2 l3, perm l1 l2 -> perm l2 l3 -> perm l1 l3.

 *)

(* What is less clear is whether the inductive predicate
   gives *all* the permutations *)
(* proving this will be the focus of most exercises *)

(* In case this was not loaded before *)
Lemma addnS : forall n m, n + S m = S (n + m).
Proof.  elim => [//=|n hn] m.
by rewrite /= hn.
Qed.


  (* This lemma is an instance of an induction over a permutation proof *)
Lemma perm_length : forall l1 l2,
         perm l1 l2 -> length l1 = length l2.
Proof.
move => l11 l12 p.
elim: p => [l|a l1 l2|l1 l2 l3 p12 IH12 p23 IH23].
- by [].
- (* permutation by insertion *)
  rewrite !app_length /=.
  rewrite addnS.
  rewrite app_length. auto.
  
- (* transitivity case *)
  by rewrite IH12 IH23.
Qed.

(* using the previous lemma you can prove this *)
(*  (no additional induction needed)   *)

Lemma perm_nil : forall l, perm nil l -> l = nil.
Proof. move => l p.
have H := perm_length _ _ p.   (* H : length nil = length l *)
simpl in H.                    (* simplifies length nil to 0 *)
(* Move p and H ABOVE l, so that we can case-analyze l freely *)
move: p H.
case: l => [|a l] /= p H.
- by [].          (* l = nil *)
- by inversion H. (* impossible: 0 = S _ *)
Qed.

(* These three following properties of concatenation are quite easily  proved  and are useful for later lemmas *)
Lemma app_nil : forall l, (app l nil) = l.
Proof.
move => l;
induction l.
trivial.

simpl.
by rewrite IHl.

Qed.


Lemma app_ass : forall l1 l2 l3, app l1 (app l2 l3) = app (app l1 l2) l3.
Proof.

elim => [|nat l1 IH1] //=.
move => l2 l3.
by rewrite IH1. 
Qed.

Lemma app_cons :
  forall l1 n l2,
    app l1 (cons n l2) = app (app l1 (cons n nil)) l2.
Proof.
elim => [|n l1 IH1] //=.
move => n0 l2.
by rewrite IH1. Qed.


(* This is the main technical lemma about permutations *)
(* The interesting case of the induction is the second one 
    where you need to prove something like :            *)
(* perm (cons a (cons a0 (app l1 l2))) 
        (cons a (app l1 (cons a0 l2))) *)
(* one possibility is to show you have a permutation path 
   between the two lists going through 
   (cons a0 (cons a (app l1 l2)))    *)


Lemma _perm_swap : forall a b l,
    perm (cons a (cons b l)) (cons b (cons a l)).
Proof.
move => a b l.

have H: cons b l = app (cons b nil) l.
  by simpl.

rewrite H.

apply: perm_trans.
  apply perm_ins.  

simpl.
apply perm_refl.
Qed.




Lemma perm_cons : forall a l1 l2,
                      perm l1 l2 -> perm (cons a l1) (cons a l2).
(*start with an induction over the permutation *)

Proof. 
move => a l1 l2 p.
elim: p => [l|b l1' l2'|l1' l2' l3' p12 IH12 p23 IH23].

- by apply perm_refl.
- 
  apply: perm_trans.
    apply _perm_swap.

  apply: perm_trans.
    apply: perm_trans.
      have H: cons a (app l1' l2') = app (cons a l1') l2'.
        by simpl.
      rewrite H.
      apply perm_ins. 
    simpl.
    apply perm_refl. apply perm_refl.

- by apply: perm_trans; [apply IH12 | apply IH23].
Qed.

Lemma perm_app_same_left : forall l l1 l2,
    perm l1 l2 -> perm (app l l1) (app l l2).
Proof.
move => l l1 l2 p.
elim: l => [|x l' IH] //=.
  apply perm_cons.
  exact IH.
Qed.

Lemma perm_rotate :
  forall n l1 l2,
    perm (cons n (app l1 l2)) (app l2 (cons n l1)).

Proof.
move => n l1 l2.
elim: l1 l2 => [|x l1' IH] l2 //=.
(* Case 1: l1 = nil *)
- simpl.
  have H: cons n l2 = cons n (app l2 nil) by rewrite app_nil.
  rewrite H.
  apply perm_ins.
(* Case 2: l1 = cons x l1' *)
- simpl.
  apply: perm_trans.
    apply _perm_swap.
  apply: perm_trans.
    apply perm_cons.
    apply: IH.
  apply: perm_trans.
    apply perm_ins.
  apply perm_app_same_left.
  apply _perm_swap.
Qed.

(* This can then be proved by induction over l1 using 
    the previous lemma   *)
Lemma perm_comapp : forall l1 l2, perm (app l1 l2)(app l2 l1).
Proof.

  elim => [| n l1' ihl1] //=.
  move => l2.
  rewrite app_nil. apply perm_refl.
  move => l2. apply perm_rotate. Qed.

(* With the previous property, we can prove permutation is
   symetric (and thus an equivalence relation). 
  The proof goes by induction over the fact (perm l1 l2)  *)
Lemma perm_sym :
  forall l1 l2,
    perm l1 l2 -> perm l2 l1.
Proof.
move => l1 l2 p.
elim: p => [l|a l1' l2'|l1' l2' l3' p12 IH12 p23 IH23].

- by apply perm_refl.

- elim: l1' => [|x l1'' IH].

  + simpl. apply perm_refl.
   
  + simpl.
    apply: perm_trans.
      apply perm_cons.
      apply IH.
    apply: perm_trans.
      apply _perm_swap.
    apply perm_refl.

- apply: perm_trans.
    apply IH23.
    apply IH12.
Qed.

(* This lemma is easy. It is a generalization of perm_cons.  
   Building on this last remark, you may see what the 
  induction is on. *)
Lemma perm_cons_iter : forall l1 l2 l3,
    perm l2 l3 -> perm (app l1 l2)(app l1 l3).
Proof.
move => l1 l2 l3 p.
elim: l1 => [|x l1' IH] //=.

- simpl. apply perm_cons. exact IH.
Qed.

(* This lemma is just for making sure we have all permutations *)
Lemma perm_swap : forall l1 l2 n m,
    perm (app l1 (cons n (cons m l2)))(app l1 (cons m (cons n l2))).
Proof.
move => l1 l2 n m.
apply perm_cons_iter. apply _perm_swap.
Qed.


(* We now have enough properties to show that insertion 
  sort preserves this notion of permutations. *)
Require Import Nat.

Fixpoint insert n l :=
  match l with
  | nil => cons n nil
  | cons m l' =>
    if n <=? m then cons n l
    else cons m (insert n l')
  end.

Lemma insert_perm : forall n l, perm (cons n l)(insert n l).
Proof.
move => n l.
elim: l => [|m l' IH] //=.
(* Case 1: l = nil *)
- apply perm_refl.
(* Case 2: l = cons m l' *)
- case: ifP => H.
  (* Case 2a: n <=? m is true *)
  + apply perm_refl.
  (* Case 2b: n <=? m is false *)
  + (* Goal: perm (cons n (cons m l')) (cons m (insert n l')) *)
    apply: perm_trans.
      (* First swap n and m *)
      apply _perm_swap.
    (* Now: cons m (cons n l') *)
    apply: perm_trans.
      apply perm_cons.
      apply IH.
    (* Now: cons m (insert n l') *)
    apply perm_refl.
Qed.

Fixpoint insertion_sort l :=
  match l with
  | nil => nil
  | cons n l => insert n (insertion_sort l)
  end.

Lemma sort_perm : forall l, perm l (insertion_sort l).
Proof.
elim => [|n l IH] //=.

- apply perm_refl.

- 
  apply: perm_trans.
    apply perm_cons.
    apply IH.
  apply insert_perm.
Qed.


















