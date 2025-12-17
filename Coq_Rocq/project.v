Require Import ssreflect ssrbool Coq.Numbers.BinNums NArith List.
Require Import Lia.


(* Note: the tactic lia allows to automate systems of equalities and inequalities
of natural numbers (over nat or N).

It may simplify some proofs later on.

for instance:
 *)

Lemma ex1 a b c d :
  a + b = c + d ->
  a = c ->
  d = b.
lia.
Abort.

Lemma ex1 a b c  :
  (a > b + c)%N ->
  (2 * a > 2 * c)%N.
  move => h.
  lia.
Abort.




(* The game *)
(* representing the four operations addition, substraction, 
multiplication, division *)

Inductive  op := A | Su | M | D .

(* This tree structure allows to keep track of how numbers 
   were obtained 

 (L a) corresponds to a card with number a given at the start *)

Inductive tree :=
 | L : N -> tree
 | Node : N ->  op ->  tree ->  tree -> tree.

Definition num t :=
  match t with
  | L (n) => n
  | Node n _ _ _  => n
  end.

(* performing an operation to obtain a new tree *)

Definition comb t1 t2 o := 
  let n1 := num t1 in
  let n2 := num t2 in
  let n :=
    (match o with
     | A =>  (n1 + n2)%N
     | Su => if (n1 <? n2)%N then  (n2 - n1)%N else  (n1 - n2)%N
     | M =>  (n1 * n2)%N
     | D => if (n2 <? n1)%N
            then
              if ((n1 mod n2) =? 0)%N
              then  (n1 / n2)%N
              else 0%N
            else
              if ((n2 mod n1) =? 0)%N
              then  (n2 / n1)%N
              else 0%N
     end)
  in (Node n o t1 t2).

(* Notice this is defined in such a way that you do not need 
  to consider both    comb a b o  and   comb b a o    
   the result will be the same.
 This is very important when defining the game, and solving it  *)

 

(*  The steps of the game will be viewed as lists of trees 
   (of numbers)

At each step, one picks two numbers in the list and combines 
 them with an operator o. *)


(* Here we state that the numbers a and b are elements of the list; 
   r is the list of the other elements  *)
Definition part a b r (l:list tree) :=
  exists l1 l2 l3, l = l1++a::l2++b::l3/\r =l1 ++ l2 ++ l3.



(* one move : one adds the result (comb a b o) to the list, 
  but removes  a and b from it *)
Inductive exstep : list tree ->  list tree -> Prop :=
  exstep_i : forall l a b r o,
      part a b r l ->
      exstep l ((comb a b o)::r).


(* sequence of moves : the reflexive transitive closure of exstep *)
Inductive path : list tree -> list tree -> Prop :=
| done : forall l , path l l
| choice : forall l1 l2 l3, exstep l1 l2 -> path l2 l3 -> path l1 l3.

(* In other words, path l1 l2 states that one can reach l2 starting
   from l1  *)


(* These little lemmas state that a path starts with a first step *)
(* they will be useful later for completeness *)
Lemma path_inv0 : forall l1 l2, path l1 l2 ->
                         l1 = l2 \/
                           exists l3, exstep l1 l3 /\ path l3 l2.

Proof.
induction 1; first auto.
right; exists l2; auto.
Qed.

Lemma path_inv1 l1 l2 :
    path l1 l2 ->
     l1 = l2 \/
       exists a b m1 m2 m3 o,
         l1 = m1++a::m2++b::m3 /\
           path ((comb a b o)::m1++m2++m3) l2.
Proof.
move => p.
move: (path_inv0 _ _ p) =>
       [->|[l3 [[l a b r o [m1 [m2 [m3 [h1 h2]]]]] h3]]].
   by left.
right.
exists a; exists b; exists m1; exists m2; exists m3; exists o.
rewrite -h2; auto.
Qed.



(* write a simple function which checks whether an element 
  is already equal to the goal  *)
Fixpoint check g l :=
  match l with
  | nil => None
  | c::l => if (num c =?g)%N
            then Some c
            else (check g l)
  end.

(* 1 - Prove the properties of check *)
Lemma check_correct1 g l :
  forall t, check g l = Some t -> In t l.
Proof.
  induction l as [|x xs IH]; simpl.
  - intros t H. discriminate H.  (* nil case: check returns None, can't be Some t *)
  - intros t H.
    destruct (num x =? g)%N eqn:H_eq.
    + (* Case where (num x =? g) is true *)
      injection H as H'. 
      left. apply H'.
    + (* Case where (num x =? g) is false *)
      right. apply IH. exact H.
Qed.

Lemma check_correct2 g l : forall t,
   check g l = Some t -> num t = g.
Proof.
  induction l as [|x xs IH]; simpl.
  - intros t H. discriminate H.  (* nil case: contradiction *)
  - intros t H.
    destruct (num x =? g)%N eqn:H_eq.
    + (* Case where (num x =? g) is true *)
      injection H as ->.  (* t = x *)
      apply N.eqb_eq in H_eq.  (* Convert from boolean equality to propositional equality *)
      exact H_eq.
    + (* Case where (num x =? g) is false *)
      apply IH. exact H.
Qed.
Lemma check_complete g l :
  forall t, In t l -> num t = g ->
            exists t', check g l = Some t'.
Proof.
  induction l as [|x xs IH]; simpl.
  - intros t H_in H_num. inversion H_in.  (* Empty list has no elements *)
  - intros t H_in H_num.
    destruct H_in as [H_eq | H_in].
    + (* Case 1: t = x (t is at the head) *)
      subst t.  (* Replace t with x everywhere *)
      rewrite H_num.  (* Now we have (num x =? g)%N with H_num: num x = g *)
      rewrite N.eqb_refl.  (* (g =? g)%N = true *)
      exists x. reflexivity.
    + (* Case 2: t is in xs *)
      destruct (num x =? g)%N eqn:H_eq.
      * (* If (num x =? g)%N is true, we already found a match *)
        exists x. reflexivity.
      * (* Otherwise, continue searching in xs *)
        apply IH with (t := t); auto.
Qed.

(* Now the aim will be to construct a function 
   find  : : N -> list tree -> option tree
 s.t. 
   - If find g l = Some t, then t can be reached and is a solution,
     that is:
     * num t = g
     * there exists l', s.t.   path l l'  and  t in  l'

   - if the problem is solvable, then a solution is found. 
     That is:
     If there exist l' and t such that:
      * path l l'
      * In t l'
      * num t = g

    then   find g l = Some t'  

    (this is the completenes property)

*)



(* You do not have to follow this path, but we suggest
an architecture for the find function.

The first step is, given l : list tree
to enumerate all the triples (a,b,r) such that   part a b r l  *)


(* Construct the function enumerating all (a,b,r) in l *)
(* this will be handy for defining  find  *)
Fixpoint aux_enum (a:tree) (l0: list tree) (l : list tree) :=
  match l with
  | nil => nil
  | cons b l' =>
      cons (a, b, ((rev l0)++l'))(aux_enum a (b::l0) l')
  end.


(* This function comes in handy to make tests *)
Definition tv := List.map L.

Eval compute in (aux_enum (L 0)(nil )(tv (1::2::3::4:: nil)%N)).


Fixpoint enum (l1 l2 : list tree) :=
  match l2 with
  | nil => nil
  | cons a l =>
      app (aux_enum a ( l1) l)
          (enum (cons a l1) l)
  end.

(* You can see how the enum function behaves :    *)
Eval compute in (enum nil (tv (1::2::3::4::nil)%N)).


(* It is easy to be confused when finding the properties of
   enum_aux  and  enum.  We state them for you and only ask
  you to prove some.    *)
Lemma enum_aux_comp1 a b : forall m1 m2 l1,
In (a,b,(rev l1)++m1++m2)(aux_enum a l1 (m1++b::m2)).
elim => [//=|c m1 hm1]m2 l1 /=; first by auto.   
right.
move: (hm1 m2 (c::l1)) => /=.
by rewrite -app_assoc /=.
Qed.

(*  2 - Prove the properties of enum_aux and enum  *)
Lemma enum_aux_corr1 a a' b l1 l2 r :
  In (a,b,r) (aux_enum a' l1 l2) -> a=a'.
Admitted.

Lemma enum_aux_corr2 a a' b l1 l2 r :
  In (a,b,r) (aux_enum a' l1 l2) ->
  (exists m1 m2, l2 = m1 ++ b :: m2/\
    r = (rev l1)++ m1++m2).
move: l2 l1.
Admitted.

 
Lemma enum_corr1 : forall l2 l1 a b r,
    In (a,b,r) (enum l1 l2) ->
    exists (m1 m2 m3 : list tree),
      l2 = m1 ++ a ::m2 ++ b :: m3 /\
        r = (rev l1)++m1++m2++m3.
Admitted.

Lemma enum_corr l a b r :
      In (a,b,r) (enum nil l) ->
      exists (m1 m2 m3 : list tree),
        l = m1 ++ a ::m2 ++ b :: m3 /\
          r =m1 ++ m2 ++ m3.
Admitted.


Lemma enum_compl1 a b : forall m1 m2 m3 l1, 
  In (a,b,(rev l1)++m1++m2++m3)
     (enum l1 (m1 ++ a ::m2 ++ b :: m3)).
elim => [//=|c m1 /= hm1] m2 m3 l1/=.
apply in_or_app; first left; apply  enum_aux_comp1.
apply in_or_app; right.
replace (rev l1 ++ c :: m1 ++ m2 ++ m3)
        with ((rev (c::l1))++m1++m2++m3); first apply hm1.
rewrite -app_assoc //=.
Qed.

(* The tree following lemmas are the essential properties of 
  enum.

(the proofs are short, using the previous properties)  *)
Lemma enum_compl a b m1 m2 m3:
  In (a,b,m1++m2++m3) (enum nil (m1++a::m2++b::m3)).
Admitted.

Lemma enum_part l a b r :
  In (a,b,r) (enum nil l) ->
  part a b r l.
move => h; move: (enum_corr _ _ _ _ h) => [m1 [m2 [m3 [e1 ->]]]].
Admitted.

Lemma part_enum l a b r :
   part a b r l ->
   In (a,b,r) (enum nil l).
Admitted.



(* SOLVING THE PROBLEM *)
(* Given a function search which solves the problem, write 
   a function which scans the enum and tries all solutions *)
(* 3 - complete the code of the function pfind *)
Fixpoint pfind
         (search : BinNums.N -> list tree -> option tree)
         g l {struct l} :=
      match l with
      | nil => None
      | cons (a, b, r) rl =>
          (* We start to check whether a+b is a solution *)
          let c := comb a b A in
          if ((num c) =? g)%N
          then Some c
          else
           (* then whether performing a+b leads to a solution *)
            match search g (c::r)
            with
            | (Some _) as x => x
            (* If a+b does not work, we do the same for a*b *)                     
            | _ =>
                 let c := comb a b M in
                 if (num c =? g)%N
                 then Some c
                 else
                   match search g (c::r) with
                   | (Some _) as x => x
                   | None =>   (* TODO 
                    complete the code here, in order 
                    to consider also a-b, a/b  *)

                       (* once a+b, a*b, a-b, a/b have
                          been considered, if none works, 
                          jump to the next possible moves in l *)
                   
                       pfind search g rl
                   end
            end  (* you will need to insert more 'end' here *)
      end.


(*  pfind allows to construct the function solving the problem
for lists of length up to an n:
- we check whether the problem is already solved
- if not, and if n is not 0, we enumerate all
  (a,b,r)  s.t.  l  is  a  m1++a::m2++b::m3
   and we check them with pfind
*)
Fixpoint search n g  l {struct n} :=
  match check g l with
  | Some t => Some t
  | None => 
      match n with
      | 0 => None
      | S nn =>
          pfind  (search nn) g  (enum nil l)
      end
  end.


(* The program which solves the problem *)
Definition find n l :=
  search (S (length l)) n l.

(* Here are some examples of use  
If your pfind definition is correct, solutions should be found *)
Definition mfind g l := find g (tv l).

Eval compute in mfind 32 (2:: 8:: 2:: nil)%N.

Eval compute in mfind 8 (4:: 32:: nil)%N.

Eval vm_compute in mfind 873 (6 :: 25 :: 3 :: 2 :: 6 :: 100 :: nil)%N.

Eval vm_compute in mfind   578  (25 :: 50 :: 75:: 4::6::5:: nil)%N.



(* Show already solved problems are detected *)
Lemma search_triv n g l t :
   In t l -> num t = g -> 
   exists t', search n g  l = t'.
move => i e.
move: (check_complete g l t i e) => [t' e'].
exists (Some t'); rewrite /search /=.
by case: n; rewrite e'.
Qed.


(* CORRECTNESS PROPERTIES *)

(* 4 - Show pfind only returns solutions ending in g - provided 
   search does *)
Lemma pfind_correct1 :  forall l search g t,
       (forall g l t, search g l = Some t -> num t = g) ->
       (pfind search g l = Some t) -> num t = g.
Admitted.

(* This one is by induction over n and then uses previous
lemmas, especially pfind_correct1. *)
Lemma search_correct1 : forall n g l r,
    search n g l = Some r -> num r = g.
Admitted.

Lemma find_correct1 l g t :
    (find g l) = Some t -> num t = g.
Admitted.


(* 5 - The more important correctness part : if a solution is 
   returned, then it actually can be obtained through a correct 
   path    *)

(* this proof is a little long, but subparts are similar 
   too each other *)
Lemma pfind_correct2 : forall l search g t,
    (forall g l0 t, search g l0 = Some t -> exists l',
          path l0 l' /\ In t l' ) ->
    (pfind search g l = Some t) ->
      exists a b r o lr,
        In (a,b,r) l
        /\ (path ((comb a b o)::r) lr
            /\ In t lr).
Admitted.

(* Again, by induction over n and using the previous lemma *)
Lemma search_correct2 : forall n g l t,
    search n g l = Some t ->
       exists lr,
         (path l lr
            /\ In t lr).
Admitted.


(* The property for find is a corollary *)
Lemma find_correct2 g l t :
  find g l = Some t ->
        exists lr,
         (path l lr
            /\ In t lr).
Admitted.


(* COMPLETENESS *)
(* i.e. we start that if  path l1 l2 and l2 contains a solution,
   then search finds a solution *)

(* A simple technical point which may come in handy:
   a path from l starts with a step in (enum nil l)   

  It is a consequence of  path_inv1    *)
Lemma path_inv2
    l lr : path l lr ->
                          l = lr \/
                     exists a b r o,
                       In (a,b,r) (enum nil l) /\
                         path ((comb a b o)::r) lr.
move => p .
move: (path_inv1 l lr p) =>
      [h|[a[b[m1[m2[m3[o [e1 e2]]]]]]]]; first by left.
right. 
exists a; exists b; exists (m1++m2++m3); exists o; split; auto.
rewrite e1; apply enum_compl.
Qed.


(* An important point is that for completeness, we have to take
   the length of the lists into account:

   (search n) will only solve problems with at most n cards.

   the following definition is just a little technical aid for 
   stating the length properties 

   (t_length (a, b, r))  is the length of  r    *)

Definition t_length (c:tree * tree * (list tree)) :=
   match c with
   |(_, _, r) => length r
   end.

(*  6 - We can state the crucial completeness lemma :
    if search solves all problems of length up to n,
    then so does (pfind search)     *)
Lemma pfind_complete :
  forall n search g,
    (forall l t
            lr,
        length l < n ->
        path l lr -> In t lr-> num t = g ->
        exists t', search g l = Some t') ->
    forall l t a b r o lr,
      (forall c, In c l ->
                 S (t_length c) < n)->
      path ((comb a b o)::r) lr ->
      In (a,b,r) l ->
      In t lr ->
      num t = g ->
      exists t', pfind search g l = Some t'.
Proof.
move => n search g hs.
elim => [//=|[[a b] r] l hl] t/=.
Admitted.

Lemma in_enum_length a b r l :
     In (a,b,r) (enum nil l) ->
     (S (length r)) < length l.
Admitted.

(*  Using the previous, one can show that (search n) solves
   all problems of length up to n    *)
Lemma search_complete g :
   forall n l t lr,
        length l < n ->
        path l lr -> In t lr-> num t = g ->
          exists t', search n g l = Some t'.
Admitted.

(* The corresponding  for find is mainly an instantiation of 
   the previous lemma    *)
Lemma find_complete g l :
  forall lr t, path l lr -> In t lr -> num t = g ->
            exists t', find g l = Some t'.
Admitted.

