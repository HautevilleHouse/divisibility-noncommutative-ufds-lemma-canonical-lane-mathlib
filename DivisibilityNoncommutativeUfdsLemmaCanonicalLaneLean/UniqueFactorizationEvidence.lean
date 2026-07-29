import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.NoncommutativeUFDDefinitions

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure UniqueFactorizationEvidence (U : NoncommutativeUFD) where
  uniqueFactorizationClosed : U.uniqueFactorization
  irreducibleFactorExistsClosed : U.irreducibleFactorExists
  factorizationUniqueUpToUnitsClosed : U.factorizationUniqueUpToUnits

def UniqueFactorizationClosed (U : NoncommutativeUFD) : Prop :=
  U.uniqueFactorization ∧ U.irreducibleFactorExists ∧ U.factorizationUniqueUpToUnits

theorem unique_factorization_closed_from_evidence (U : NoncommutativeUFD)
    (E : UniqueFactorizationEvidence U) : UniqueFactorizationClosed U :=
  And.intro E.uniqueFactorizationClosed
    (And.intro E.irreducibleFactorExistsClosed E.factorizationUniqueUpToUnitsClosed)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
