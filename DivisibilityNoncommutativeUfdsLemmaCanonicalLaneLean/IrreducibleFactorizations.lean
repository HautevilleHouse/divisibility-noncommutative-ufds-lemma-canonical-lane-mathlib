import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean.DivisibilityNoncommutativeUfd

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure IrreducibleFactorizationsPackage {P : DivisibilityNoncommutativeUfdPackage} where
  irreducibleElementsCharacterized : Prop
  factorizationIntoIrreduciblesExists : Prop
  factorizationLengthInvariant : Prop

structure IrreducibleFactorizationsEvidence {P : DivisibilityNoncommutativeUfdPackage}
    (F : IrreducibleFactorizationsPackage P) where
  irreducibleElementsCharacterizedClosed : F.irreducibleElementsCharacterized
  factorizationIntoIrreduciblesExistsClosed : F.factorizationIntoIrreduciblesExists
  factorizationLengthInvariantClosed : F.factorizationLengthInvariant

def IrreducibleFactorizationsClosed {P : DivisibilityNoncommutativeUfdPackage}
    (F : IrreducibleFactorizationsPackage P) : Prop :=
  F.irreducibleElementsCharacterized ∧ F.factorizationIntoIrreduciblesExists ∧ F.factorizationLengthInvariant

theorem irreducible_factorizations_closed_from_evidence
    {P : DivisibilityNoncommutativeUfdPackage} (F : IrreducibleFactorizationsPackage P)
    (E : IrreducibleFactorizationsEvidence F) : IrreducibleFactorizationsClosed F := by
  exact And.intro E.irreducibleElementsCharacterizedClosed
    (And.intro E.factorizationIntoIrreduciblesExistsClosed E.factorizationLengthInvariantClosed)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
