import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure AtomicConditionPackage where
  ring : Type u
  noncommutativeRing : Ring ring
  leftAtomic : Prop
  rightAtomic : Prop
  leftAcc : Prop
  rightAcc : Prop

structure AtomicConditionEvidence (A : AtomicConditionPackage) where
  leftAtomicClosed : A.leftAtomic
  rightAtomicClosed : A.rightAtomic
  leftAccClosed : A.leftAcc
  rightAccClosed : A.rightAcc

def AtomicConditionClosed (A : AtomicConditionPackage) : Prop :=
  A.leftAtomic ∧ A.rightAtomic ∧ A.leftAcc ∧ A.rightAcc

theorem atomic_condition_closed_from_evidence (A : AtomicConditionPackage) (E : AtomicConditionEvidence A) :
    AtomicConditionClosed A := by
  exact And.intro E.leftAtomicClosed (And.intro E.rightAtomicClosed (And.intro E.leftAccClosed E.rightAccClosed))

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
