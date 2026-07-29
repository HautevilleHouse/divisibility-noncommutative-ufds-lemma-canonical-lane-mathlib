import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure IrreducibilityPackage {U : NoncommutativeUFDPackage} (D : DivisibilityPackage U) where
  irreducible : U.ring → Prop
  prime : U.ring → Prop
  irreducibleImpliesPrime : ∀ a : U.ring, irreducible a → prime a
  primeImpliesIrreducible : ∀ a : U.ring, prime a → irreducible a
  existenceOfIrreducibleFactorization : ∀ a : U.ring, a ≠ 0 → ¬ (∃ u : U.ring, (∀ x : U.ring, D.leftDivisibility a x → D.leftDivisibility x a) ∧ (∀ b : U.ring, D.leftDivisibility (a * b) a → D.leftDivisibility b a)) → (∃ (f : List U.ring), (∀ i, irreducible (f.get i)) ∧ (a = (f.foldr (· * ·) 1)))

structure IrreducibilityEvidence {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} (I : IrreducibilityPackage D) where
  irreducibleImpliesPrimeClosed : I.irreducibleImpliesPrime
  primeImpliesIrreducibleClosed : I.primeImpliesIrreducible
  existenceOfIrreducibleFactorizationClosed : I.existenceOfIrreducibleFactorization

def IrreducibilityClosed {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} (I : IrreducibilityPackage D) : Prop :=
  I.irreducibleImpliesPrime ∧ I.primeImpliesIrreducible ∧ I.existenceOfIrreducibleFactorization

theorem irreducibility_closed_from_evidence {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} (I : IrreducibilityPackage D) (E : IrreducibilityEvidence I) : IrreducibilityClosed I := by
  exact And.intro E.irreducibleImpliesPrimeClosed (And.intro E.primeImpliesIrreducibleClosed E.existenceOfIrreducibleFactorizationClosed)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse