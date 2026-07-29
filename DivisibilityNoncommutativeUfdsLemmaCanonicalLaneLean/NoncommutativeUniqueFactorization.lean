import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.DivisibilityNoncommutativeUfd

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure NoncommutativeUniqueFactorizationPackage {P : DivisibilityNoncommutativeUfdPackage} where
  productOrderIndependence : Prop
  exchangeLemma : Prop
  uniquenessOfFactorizationUpToOrder : Prop

structure NoncommutativeUniqueFactorizationEvidence {P : DivisibilityNoncommutativeUfdPackage}
    (U : NoncommutativeUniqueFactorizationPackage P) where
  productOrderIndependenceClosed : U.productOrderIndependence
  exchangeLemmaClosed : U.exchangeLemma
  uniquenessOfFactorizationUpToOrderClosed : U.uniquenessOfFactorizationUpToOrder

def NoncommutativeUniqueFactorizationClosed {P : DivisibilityNoncommutativeUfdPackage}
    (U : NoncommutativeUniqueFactorizationPackage P) : Prop :=
  U.productOrderIndependence ∧ U.exchangeLemma ∧ U.uniquenessOfFactorizationUpToOrder

theorem noncommutative_unique_factorization_closed_from_evidence
    {P : DivisibilityNoncommutativeUfdPackage} (U : NoncommutativeUniqueFactorizationPackage P)
    (E : NoncommutativeUniqueFactorizationEvidence U) : NoncommutativeUniqueFactorizationClosed U := by
  exact And.intro E.productOrderIndependenceClosed
    (And.intro E.exchangeLemmaClosed E.uniquenessOfFactorizationUpToOrderClosed)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
