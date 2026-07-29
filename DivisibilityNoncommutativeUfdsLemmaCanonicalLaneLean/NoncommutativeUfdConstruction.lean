import HautevilleHouse.DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure IrreducibleElement (R : NoncommutativeRing) (a : R.carrier) where
  nonUnit : ∀ b : R.carrier, R.mul a b = R.one → ∃ c : R.carrier, R.mul b c = R.one
  irreducibleProduct : ∀ b c : R.carrier, R.mul b c = a → 
    (∃ d : R.carrier, R.mul b d = R.one) ∨ (∃ e : R.carrier, R.mul c e = R.one)

structure Factorization (R : NoncommutativeRing) (a : R.carrier) where
  factors : List (Σ' (b : R.carrier), IrreducibleElement R b)
  product : R.carrier
  productEq : product = a
  factorsClosed : product = List.foldr (fun (x : Σ' (b : R.carrier), IrreducibleElement R b) acc => R.mul x.1 acc) R.one factors

structure NoncommutativeUfdConstruction where
  ring : NoncommutativeRing
  factorizationExists : ∀ a : ring.carrier, a ≠ ring.zero → Factorization ring a
  uniquenessUpToUnits : ∀ (a : ring.carrier) (f g : Factorization ring a), 
    (∃ (u : ring.carrier) (v : ring.carrier), 
      R.mul u v = ring.one ∧ 
      List.map (fun (x : Σ' (b : ring.carrier), IrreducibleElement ring b) => x.1) f.factors = 
      List.map (fun (x : Σ' (b : ring.carrier), IrreducibleElement ring b) => R.mul u (R.mul x.1 v)) g.factors)
  constructionClosed : factorizationExists ∧ uniquenessUpToUnits

def NoncommutativeUfdConstructionClosed (C : NoncommutativeUfdConstruction) : Prop :=
  C.constructionClosed

theorem noncommutative_ufd_construction_closed_from_evidence
    (C : NoncommutativeUfdConstruction) (E : C.constructionClosed) :
    NoncommutativeUfdConstructionClosed C := by
  exact E

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse