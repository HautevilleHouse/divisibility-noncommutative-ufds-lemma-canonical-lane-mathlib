import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure AssociateClassPackage where
  ring : Type u
  ringOps : Ring ring
  associateRelation : ring → ring → Prop
  isEquivalence : Equivalence associateRelation
  classStructure : Set (Set ring)
  classPartition : ∀ (a : ring), ∃ (C : Set ring),
    a ∈ C ∧ C ∈ classStructure ∧ ∀ (b : ring), b ∈ C ↔ associateRelation a b
  uniquenessUnderMultiplication : ∀ (a b : ring),
    associateRelation a b → (IsIrreducible a ↔ IsIrreducible b)

structure AssociateClassEvidence (A : AssociateClassPackage) where
  isEquivalenceClosed : A.isEquivalence
  classPartitionClosed : A.classPartition
  uniquenessUnderMultiplicationClosed : A.uniquenessUnderMultiplication

def AssociateClassClosed (A : AssociateClassPackage) : Prop :=
  A.isEquivalence ∧ A.classPartition ∧ A.uniquenessUnderMultiplication

theorem associate_class_closed_from_evidence (A : AssociateClassPackage)
    (E : AssociateClassEvidence A) : AssociateClassClosed A := by
  exact And.intro E.isEquivalenceClosed
    (And.intro E.classPartitionClosed E.uniquenessUnderMultiplicationClosed)

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse