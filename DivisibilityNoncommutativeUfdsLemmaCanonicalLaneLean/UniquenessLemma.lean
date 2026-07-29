import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure UniquenessPackage {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} (I : IrreducibilityPackage D) where
  factorizationEquality : ∀ a : U.ring, ∀ (f g : List U.ring), (∀ i, I.irreducible (f.get i)) → (∀ j, I.irreducible (g.get j)) → (a = f.foldr (· * ·) 1) → (a = g.foldr (· * ·) 1) → (List.length f = List.length g) ∧ (∃ (σ : Equiv (Fin (List.length f)) (Fin (List.length g))), ∀ k : Fin (List.length f), D.leftDivisibility (f.get k) (g.get (σ k)) ∧ D.leftDivisibility (g.get (σ k)) (f.get k))
  uniquenessUpToUnitsAndOrder : ∀ a : U.ring, ∀ (f g : List U.ring), (∀ i, I.irreducible (f.get i)) → (∀ j, I.irreducible (g.get j)) → (a = f.foldr (· * ·) 1) → (a = g.foldr (· * ·) 1) → (List.length f = List.length g) ∧ (∃ (σ : Equiv (Fin (List.length f)) (Fin (List.length g))) (units : Fin (List.length f) → U.ring), (∀ i, (units i) * (g.get (σ i)) = (f.get i) * (units i)) ∧ (∀ i, I.irreducible (units i)) ∧ (∀ i, ∀ x : U.ring, D.leftDivisibility (units i) x → D.leftDivisibility x (units i)))

structure UniquenessEvidence {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} {I : IrreducibilityPackage D} (Uq : UniquenessPackage I) where
  factorizationEqualityClosed : Uq.factorizationEquality
  uniquenessUpToUnitsAndOrderClosed : Uq.uniquenessUpToUnitsAndOrder

def UniquenessClosed {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} {I : IrreducibilityPackage D} (Uq : UniquenessPackage I) : Prop :=
  Uq.factorizationEquality ∧ Uq.uniquenessUpToUnitsAndOrder

theorem uniqueness_closed_from_evidence {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} {I : IrreducibilityPackage D} (Uq : UniquenessPackage I) (E : UniquenessEvidence Uq) : UniquenessClosed Uq := by
  exact And.intro E.factorizationEqualityClosed E.uniquenessUpToUnitsAndOrderClosed

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse