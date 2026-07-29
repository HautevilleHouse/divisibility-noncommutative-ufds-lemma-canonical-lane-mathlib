import canonicalLaneMathlib.AdmissibleClass
import Mathlib.RingTheory.UniqueFactorizationDomain

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean

structure NoncommutativeRing where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  addComm : ∀ a b : carrier, add a b = add b a
  addLeftNeg : ∀ a : carrier, ∃ b, add a b = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  mulOne : ∀ a : carrier, mul a one = a
  oneMul : ∀ a : carrier, mul one a = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)

structure UfdAdmittedObject where
  ring : NoncommutativeRing
  isUfd : Prop
  irreducibleFactorization : Prop
  uniquenessUpToUnits : Prop
  conclusion : isUfd ∧ irreducibleFactorization ∧ uniquenessUpToUnits

def UfdWitnessClosed (O : UfdAdmittedObject) : Prop :=
  O.isUfd ∧ O.irreducibleFactorization ∧ O.uniquenessUpToUnits

end DivisibilityNoncommutativeUfdsLemmaCanonicalLaneLean
end HautevilleHouse