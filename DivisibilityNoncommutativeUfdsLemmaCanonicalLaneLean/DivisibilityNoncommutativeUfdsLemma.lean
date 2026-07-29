import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

def ConstrainedDivisibilityNoncommutativeUfdsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_divisibility_noncommutative_ufds_endgame (A : AdmissibleClass) :
    ConstrainedDivisibilityNoncommutativeUfdsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
