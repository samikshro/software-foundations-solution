Set Warnings "-notation-overridden,-parsing".
From Coq Require Export String.
From VFA Require Import Perm.
Parameter MISSING: Type. 

Module Check. 

Ltac check_type A B := 
match type of A with 
| context[MISSING] => idtac "Missing:" A  
| ?T => first [unify T B; idtac "Type: ok" | idtac "Type: wrong - should be (" B ")"] 
end. 

Ltac print_manual_grade A := 
match eval compute in A with 
| Some (pair ?S ?C) => 
idtac "Score:"  S; 
match eval compute in C with  
| ""%string => idtac "Comment: None"  
| _ => idtac "Comment:" C 
end 
| None => 
idtac "Score: Ungraded"; 
idtac "Comment: None" 
end. 

End Check.

From VFA Require Import Perm.
Import Check.

Goal True.

idtac "-------------------  Permutation_properties  --------------------".
idtac " ".

idtac "#> Manually graded: Exploration1.Permutation_properties".
idtac "Possible points: 2".
print_manual_grade Exploration1.manual_grade_for_Permutation_properties.
idtac " ".

idtac "-------------------  permut_example  --------------------".
idtac " ".

idtac "#> Exploration1.permut_example".
idtac "Possible points: 3".
check_type @Exploration1.permut_example (
(forall a b : list nat,
 @Permutation nat (5 :: 6 :: a ++ b) ((5 :: b) ++ 6 :: a ++ []))).
idtac "Assumptions:".
Abort.
Print Assumptions Exploration1.permut_example.
Goal True.
idtac " ".

idtac "-------------------  not_a_permutation  --------------------".
idtac " ".

idtac "#> Exploration1.not_a_permutation".
idtac "Possible points: 1".
check_type @Exploration1.not_a_permutation ((~ @Permutation nat [1; 1] [1; 2])).
idtac "Assumptions:".
Abort.
Print Assumptions Exploration1.not_a_permutation.
Goal True.
idtac " ".

idtac "-------------------  Forall_perm  --------------------".
idtac " ".

idtac "#> Forall_perm".
idtac "Possible points: 2".
check_type @Forall_perm (
(forall (A : Type) (f : A -> Prop) (al bl : list A),
 @Permutation A al bl -> @Forall A f al -> @Forall A f bl)).
idtac "Assumptions:".
Abort.
Print Assumptions Forall_perm.
Goal True.
idtac " ".

idtac " ".

idtac "Max points - standard: 8".
idtac "Max points - advanced: 8".
Abort.
