import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure NoncommutativeDomain where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  isDomain : Prop
  isNoncommutative : Prop
  zeroNeqOne : zero ≠ one
  addComm : ∀ a b : carrier, add a b = add b a
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  negExists : ∀ a : carrier, ∃ b : carrier, add a b = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : carrier, mul one a = a
  mulOne : ∀ a : carrier, mul a one = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)

structure NoncommutativeUFD where
  domain : NoncommutativeDomain
  uniqueFactorization : Prop
  irreducibleFactorExists : Prop
  factorizationUniqueUpToUnits : Prop
  irreducibleDefined : (a : domain.carrier) → Prop
  existsIrreducibleFactorization : ∀ a : domain.carrier, a ≠ domain.zero →
    ∃ (n : ℕ) (factors : Fin n → domain.carrier),
      (∀ i, irreducibleDefined (factors i)) ∧
      factors 0 = a ∧
      (∀ i, factors i ≠ domain.zero)
  uniquenessUpToUnits : Prop

structure AdmissibleNoncommutativeUFDPackage where
  ufd : NoncommutativeUFD
  closureCondition : Prop
  factorizationStable : Prop
  irreduciblePreserved : Prop

def noncommutativeUFDAdmittedClass (A : AdmissibleNoncommutativeUFDPackage) : AdmissibleClass :=
  { object := { carrier := A.ufd.domain.carrier, topology := inferInstance }
    endpointSatisfied := A.closureCondition
    remainderRecorded := A.factorizationStable
    gateWitness := Or.inl A.closureCondition
  }

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse
