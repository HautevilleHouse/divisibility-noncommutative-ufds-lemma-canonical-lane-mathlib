import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.UFDBridgeLemmas
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.UFDGateLemmas

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

def ConstrainedNoncommutativeUFDClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_noncommutative_ufd_endgame (A : AdmissibleClass) :
    ConstrainedNoncommutativeUFDClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
