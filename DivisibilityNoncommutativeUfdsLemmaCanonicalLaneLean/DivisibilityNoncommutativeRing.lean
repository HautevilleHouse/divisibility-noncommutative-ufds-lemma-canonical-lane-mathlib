import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure DivisibilityNoncommutativeRingPackage where
  ring : Type u
  ringOps : Ring ring
  isNoncommutative : Prop
  divisibilityRelation : ring → ring → Prop
  divisibilityReflexive : Prop
  divisibilityTransitive : Prop
  divisibilityAntisymmetric : Prop

structure DivisibilityNoncommutativeRingEvidence (D : DivisibilityNoncommutativeRingPackage) where
  isNoncommutativeClosed : D.isNoncommutative
  divisibilityReflexiveClosed : D.divisibilityReflexive
  divisibilityTransitiveClosed : D.divisibilityTransitive
  divisibilityAntisymmetricClosed : D.divisibilityAntisymmetric

def DivisibilityNoncommutativeRingClosed (D : DivisibilityNoncommutativeRingPackage) : Prop :=
  D.isNoncommutative ∧ D.divisibilityReflexive ∧
  D.divisibilityTransitive ∧ D.divisibilityAntisymmetric

theorem divisibility_noncommutative_ring_closed_from_evidence
    (D : DivisibilityNoncommutativeRingPackage)
    (E : DivisibilityNoncommutativeRingEvidence D) : DivisibilityNoncommutativeRingClosed D := by
  exact And.intro E.isNoncommutativeClosed
    (And.intro E.divisibilityReflexiveClosed
      (And.intro E.divisibilityTransitiveClosed
        E.divisibilityAntisymmetricClosed))

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse