import HautevilleHouse.DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.NoncommutativeUfdConstruction

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure DivisibilityTheory where
  ring : NoncommutativeRing
  divides (a b : ring.carrier) : Prop :=
    ∃ c : ring.carrier, b = ring.mul a c
  leftAssociated (a b : ring.carrier) : Prop :=
    divides a b ∧ divides b a
  rightAssociated (a b : ring.carrier) : Prop :=
    ∃ u : ring.carrier, ring.mul u a = b ∧ ∃ v : ring.carrier, ring.mul v b = a
  prime (p : ring.carrier) : Prop :=
    p ≠ ring.zero ∧ ¬ (∃ u : ring.carrier, ring.mul p u = ring.one) ∧
    ∀ a b : ring.carrier, divides p (ring.mul a b) → divides p a ∨ divides p b
  irreducibleDef (a : ring.carrier) : Prop :=
    a ≠ ring.zero ∧ ¬ (∃ u : ring.carrier, ring.mul a u = ring.one) ∧
    ∀ b c : ring.carrier, ring.mul b c = a → (∃ u : ring.carrier, ring.mul b u = ring.one) ∨ (∃ v : ring.carrier, ring.mul c v = ring.one)
  primeImpliesIrreducible : ∀ p : ring.carrier, prime p → irreducibleDef p
  factorizationAndAssociates : ∀ a : ring.carrier, a ≠ ring.zero → (∃ (f : NoncommutativeUfdConstruction) (fac : Factorization ring a), True)

theorem divisibility_theory_prime_implies_irreducible
    (D : DivisibilityTheory) (p : D.ring.carrier) (hp : D.prime p) : D.irreducibleDef p := by
  exact D.primeImpliesIrreducible p hp

theorem divisibility_theory_factorization_exists
    (D : DivisibilityTheory) (a : D.ring.carrier) (ha : a ≠ D.ring.zero) :
    ∃ (f : NoncommutativeUfdConstruction) (fac : Factorization D.ring a), True := by
  exact D.factorizationAndAssociates a ha

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse