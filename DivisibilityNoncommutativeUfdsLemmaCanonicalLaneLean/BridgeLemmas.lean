import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.DivisibilityNoncommutativeUfd

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let P : DivisibilityNoncommutativeUfdPackage := A.object
  P.divisibilityProperties

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  let P : DivisibilityNoncommutativeUfdPackage := A.object
  exact P.divisibilityClosed

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
