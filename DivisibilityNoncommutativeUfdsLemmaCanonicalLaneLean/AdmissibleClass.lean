import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : UfdAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  UfdWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse