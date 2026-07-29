import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure NoncommutativeGCDLCMpackage where
  ring : Type u
  ringOps : Ring ring
  isNoncommutativeUFD : Prop
  gcd : ring → ring → ring
  lcm : ring → ring → ring
  gcdProperty : ∀ (a b : ring),
    (gcd a b) ∣ a ∧ (gcd a b) ∣ b ∧
    ∀ (d : ring), (d ∣ a) → (d ∣ b) → (d ∣ gcd a b)
  lcmProperty : ∀ (a b : ring),
    a ∣ (lcm a b) ∧ b ∣ (lcm a b) ∧
    ∀ (m : ring), (a ∣ m) → (b ∣ m) → (lcm a b) ∣ m
  productRelation : ∀ (a b : ring),
    gcd a b * lcm a b = a * b ∨ gcd a b * lcm a b = b * a

structure NoncommutativeGCDLCMEvidence (G : NoncommutativeGCDLCMpackage) where
  isNoncommutativeUFDClosed : G.isNoncommutativeUFD
  gcdPropertyClosed : G.gcdProperty
  lcmPropertyClosed : G.lcmProperty
  productRelationClosed : G.productRelation

def NoncommutativeGCDLCMClosed (G : NoncommutativeGCDLCMpackage) : Prop :=
  G.isNoncommutativeUFD ∧ G.gcdProperty ∧ G.lcmProperty ∧ G.productRelation

theorem noncommutative_gcd_lcm_closed_from_evidence
    (G : NoncommutativeGCDLCMpackage)
    (E : NoncommutativeGCDLCMEvidence G) : NoncommutativeGCDLCMClosed G := by
  exact And.intro E.isNoncommutativeUFDClosed
    (And.intro E.gcdPropertyClosed
      (And.intro E.lcmPropertyClosed E.productRelationClosed))

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse