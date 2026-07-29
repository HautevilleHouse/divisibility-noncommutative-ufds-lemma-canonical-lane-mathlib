import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure NoncommutativeUFDPackage where
  ring : Type u
  ringOps : Ring ring
  isNoncommutative : Prop
  isDomain : Prop
  factorizationExistence : Prop
  factorizationUniqueness : Prop
  irreducibleFactorConditions : Prop

structure NoncommutativeUFDEvidence (P : NoncommutativeUFDPackage) where
  isNoncommutativeClosed : P.isNoncommutative
  isDomainClosed : P.isDomain
  factorizationExistenceClosed : P.factorizationExistence
  factorizationUniquenessClosed : P.factorizationUniqueness
  irreducibleFactorConditionsClosed : P.irreducibleFactorConditions

def NoncommutativeUFDClosed (P : NoncommutativeUFDPackage) : Prop :=
  P.isNoncommutative ∧ P.isDomain ∧
  P.factorizationExistence ∧ P.factorizationUniqueness ∧
  P.irreducibleFactorConditions

theorem noncommutative_ufd_closed_from_evidence (P : NoncommutativeUFDPackage)
    (E : NoncommutativeUFDEvidence P) : NoncommutativeUFDClosed P := by
  exact And.intro E.isNoncommutativeClosed
    (And.intro E.isDomainClosed
      (And.intro E.factorizationExistenceClosed
        (And.intro E.factorizationUniquenessClosed
          E.irreducibleFactorConditionsClosed)))

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse