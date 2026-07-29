import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure NoncommutativeUfdPackage where
  ring : Type u
  noncommutativeRing : Ring ring
  domain : Prop
  accCondition : Prop
  factorisationExistence : Prop
  factorisationUniqueness : Prop

structure NoncommutativeUfdEvidence (P : NoncommutativeUfdPackage) where
  domainClosed : P.domain
  accConditionClosed : P.accCondition
  factorisationExistenceClosed : P.factorisationExistence
  factorisationUniquenessClosed : P.factorisationUniqueness

def NoncommutativeUfdClosed (P : NoncommutativeUfdPackage) : Prop :=
  P.domain ∧ P.accCondition ∧ P.factorisationExistence ∧ P.factorisationUniqueness

theorem noncommutative_ufd_closed_from_evidence (P : NoncommutativeUfdPackage) (E : NoncommutativeUfdEvidence P) :
    NoncommutativeUfdClosed P := by
  exact And.intro E.domainClosed (And.intro E.accConditionClosed (And.intro E.factorisationExistenceClosed E.factorisationUniquenessClosed))

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
