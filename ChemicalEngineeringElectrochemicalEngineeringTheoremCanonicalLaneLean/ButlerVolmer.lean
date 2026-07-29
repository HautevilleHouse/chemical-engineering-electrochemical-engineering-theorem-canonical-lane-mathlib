import ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean.ReactionKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ButlerVolmerPackage where
  anodicRateConstant : Float
  cathodicRateConstant : Float
  symmetryFactor : Float
  currentOverpotentialEquation : Prop
  chargeTransferCoefficientClosed : Prop

def ButlerVolmerClosed (B : ButlerVolmerPackage) : Prop :=
  B.currentOverpotentialEquation ∧ B.chargeTransferCoefficientClosed

theorem butler_volmer_closed (B : ButlerVolmerPackage) (h : B.currentOverpotentialEquation) :
    ButlerVolmerClosed B := by
  exact And.intro h h

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
