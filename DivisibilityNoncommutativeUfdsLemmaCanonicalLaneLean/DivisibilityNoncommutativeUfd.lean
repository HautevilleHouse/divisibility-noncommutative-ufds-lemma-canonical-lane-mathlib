import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure DivisibilityNoncommutativeUfdPackage where
  noncommutativeDomain : Type u
  irreducibleFactorizations : Prop
  uniqueFactorizationUpToOrder : Prop
  divisibilityProperties : Prop
  irreducibleFactorizationExistence : irreducibleFactorizations
  factorizationUniqueness : uniqueFactorizationUpToOrder
  divisibilityClosed : divisibilityProperties

structure DivisibilityNoncommutativeUfdEvidence (P : DivisibilityNoncommutativeUfdPackage) where
  irreducibleFactorizationExistenceClosed : P.irreducibleFactorizations
  factorizationUniquenessClosed : P.uniqueFactorizationUpToOrder
  divisibilityPropertiesClosed : P.divisibilityProperties

def DivisibilityNoncommutativeUfdClosed (P : DivisibilityNoncommutativeUfdPackage) : Prop :=
  P.irreducibleFactorizations ∧ P.uniqueFactorizationUpToOrder ∧ P.divisibilityProperties

theorem divisibility_noncommutative_ufd_closed_from_evidence
    (P : DivisibilityNoncommutativeUfdPackage) (E : DivisibilityNoncommutativeUfdEvidence P) :
    DivisibilityNoncommutativeUfdClosed P := by
  exact And.intro E.irreducibleFactorizationExistenceClosed
    (And.intro E.factorizationUniquenessClosed E.divisibilityPropertiesClosed)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
