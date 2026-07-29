import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.DivisibilityNoncommutativeUfd

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure DivisibilityPropertiesPackage {P : DivisibilityNoncommutativeUfdPackage} where
  leftDivisibilityPartialOrder : Prop
  rightDivisibilityPartialOrder : Prop
  irreduciblePrimeEquivalence : Prop
  accOnLeftDivisibility : Prop
  accOnRightDivisibility : Prop

structure DivisibilityPropertiesEvidence {P : DivisibilityNoncommutativeUfdPackage}
    (D : DivisibilityPropertiesPackage P) where
  leftDivisibilityPartialOrderClosed : D.leftDivisibilityPartialOrder
  rightDivisibilityPartialOrderClosed : D.rightDivisibilityPartialOrder
  irreduciblePrimeEquivalenceClosed : D.irreduciblePrimeEquivalence
  accOnLeftDivisibilityClosed : D.accOnLeftDivisibility
  accOnRightDivisibilityClosed : D.accOnRightDivisibility

def DivisibilityPropertiesClosed {P : DivisibilityNoncommutativeUfdPackage}
    (D : DivisibilityPropertiesPackage P) : Prop :=
  D.leftDivisibilityPartialOrder ∧ D.rightDivisibilityPartialOrder ∧
  D.irreduciblePrimeEquivalence ∧ D.accOnLeftDivisibility ∧ D.accOnRightDivisibility

theorem divisibility_properties_closed_from_evidence
    {P : DivisibilityNoncommutativeUfdPackage} (D : DivisibilityPropertiesPackage P)
    (E : DivisibilityPropertiesEvidence D) : DivisibilityPropertiesClosed D := by
  exact And.intro E.leftDivisibilityPartialOrderClosed
    (And.intro E.rightDivisibilityPartialOrderClosed
      (And.intro E.irreduciblePrimeEquivalenceClosed
        (And.intro E.accOnLeftDivisibilityClosed E.accOnRightDivisibilityClosed)))

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
