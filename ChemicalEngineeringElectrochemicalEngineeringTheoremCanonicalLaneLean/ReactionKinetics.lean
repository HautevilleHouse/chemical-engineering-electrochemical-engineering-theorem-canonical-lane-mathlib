import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ReactionKineticsPackage where
  rateLaw : String
  activationEnergy : ℝ
  preExponentialFactor : ℝ
  rateConstant : ℝ
  reactionOrder : List ℕ
  mechanism : String

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  rateLawClosed : R.rateLaw = "butlerVolmer" ∨ R.rateLaw = "arrhenius"
  activationEnergyPositive : R.activationEnergy > 0
  preExponentialFactorPositive : R.preExponentialFactor > 0
  rateConstantPositive : R.rateConstant > 0
  reactionOrderNonempty : R.reactionOrder ≠ []

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  (R.rateLaw = "butlerVolmer" ∨ R.rateLaw = "arrhenius") ∧
  R.activationEnergy > 0 ∧ R.preExponentialFactor > 0 ∧ R.rateConstant > 0 ∧ R.reactionOrder ≠ []

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.rateLawClosed
    (And.intro E.activationEnergyPositive
      (And.intro E.preExponentialFactorPositive
        (And.intro E.rateConstantPositive E.reactionOrderNonempty)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse