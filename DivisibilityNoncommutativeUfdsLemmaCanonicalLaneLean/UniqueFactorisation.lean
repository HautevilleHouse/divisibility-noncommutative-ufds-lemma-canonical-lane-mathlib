import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure UniqueFactorisationPackage where
  ring : Type u
  noncommutativeRing : Ring ring
  leftFactorisationUnique : Prop
  rightFactorisationUnique : Prop
  leftAndRightCompatible : Prop

structure UniqueFactorisationEvidence (U : UniqueFactorisationPackage) where
  leftFactorisationUniqueClosed : U.leftFactorisationUnique
  rightFactorisationUniqueClosed : U.rightFactorisationUnique
  leftAndRightCompatibleClosed : U.leftAndRightCompatible

def UniqueFactorisationClosed (U : UniqueFactorisationPackage) : Prop :=
  U.leftFactorisationUnique ∧ U.rightFactorisationUnique ∧ U.leftAndRightCompatible

theorem unique_factorisation_closed_from_evidence (U : UniqueFactorisationPackage) (E : UniqueFactorisationEvidence U) :
    UniqueFactorisationClosed U := by
  exact And.intro E.leftFactorisationUniqueClosed (And.intro E.rightFactorisationUniqueClosed E.leftAndRightCompatibleClosed)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
