import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.NoncommutativeUFDDefinitions

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | { carrier := _, topology := _ } => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    unfold bridgeClosed
    trivial

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
