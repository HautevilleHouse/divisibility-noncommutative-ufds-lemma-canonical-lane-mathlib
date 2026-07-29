import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure AtomicDomainPackage {U : NoncommutativeUFDPackage} (D : DivisibilityPackage U) where
  atomic : Prop
  accLeftDivisibility : WellFounded D.leftDivisibility
  accRightDivisibility : WellFounded D.rightDivisibility
  atomsGenerate : ∀ a : U.ring, a ≠ 0 → (∃ (f : List U.ring), (∀ i, D.leftDivisibility (f.get i) a) ∧ (∀ i, ∀ x : U.ring, D.leftDivisibility x (f.get i) → D.leftDivisibility x a → (∃ u : U.ring, (∀ y : U.ring, D.leftDivisibility y x → D.leftDivisibility y u) ∧ (∀ y : U.ring, D.leftDivisibility y u → D.leftDivisibility y x))))

structure AtomicDomainEvidence {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} (A : AtomicDomainPackage D) where
  atomicClosed : A.atomic
  accLeftDivisibilityClosed : A.accLeftDivisibility
  accRightDivisibilityClosed : A.accRightDivisibility
  atomsGenerateClosed : A.atomsGenerate

def AtomicDomainClosed {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} (A : AtomicDomainPackage D) : Prop :=
  A.atomic ∧ A.accLeftDivisibility ∧ A.accRightDivisibility ∧ A.atomsGenerate

theorem atomic_domain_closed_from_evidence {U : NoncommutativeUFDPackage} {D : DivisibilityPackage U} (A : AtomicDomainPackage D) (E : AtomicDomainEvidence A) : AtomicDomainClosed A := by
  exact And.intro E.atomicClosed (And.intro E.accLeftDivisibilityClosed (And.intro E.accRightDivisibilityClosed E.atomsGenerateClosed))

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse