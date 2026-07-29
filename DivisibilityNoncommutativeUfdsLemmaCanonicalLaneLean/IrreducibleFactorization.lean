import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure IrreducibleFactorizationPackage where
  ring : Type u
  ringOps : Ring ring
  irreducibleElements : Set ring
  factorizationMapping : ring → List (ring × ℕ)
  existence : ∀ (a : ring), a ≠ 0 → ¬ IsUnit a →
    factorizationMapping a ≠ []
  uniqueness : ∀ (a : ring), ∀ (f1 f2 : List (ring × ℕ)),
    (∀ (p : ring), (p ∈ f1.map Prod.fst) → p ∈ irreducibleElements) →
    (∀ (p : ring), (p ∈ f2.map Prod.fst) → p ∈ irreducibleElements) →
    productOfPairs f1 = a → productOfPairs f2 = a → Multiset.ofList f1 = Multiset.ofList f2
  where
    productOfPairs : List (ring × ℕ) → ring := λ l =>
      l.foldr (λ (p,n) r => p ^ n * r) 1

structure IrreducibleFactorizationEvidence (I : IrreducibleFactorizationPackage) where
  existenceClosed : I.existence
  uniquenessClosed : I.uniqueness

def IrreducibleFactorizationClosed (I : IrreducibleFactorizationPackage) : Prop :=
  I.existence ∧ I.uniqueness

theorem irreducible_factorization_closed_from_evidence
    (I : IrreducibleFactorizationPackage)
    (E : IrreducibleFactorizationEvidence I) : IrreducibleFactorizationClosed I := by
  exact And.intro E.existenceClosed E.uniquenessClosed

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse