import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ButlerVolmerEquationPackage where
  anodicTransferCoefficient : ℝ
  cathodicTransferCoefficient : ℝ
  exchangeCurrentDensity : ℝ
  overpotential : ℝ
  temperature : ℝ
  faradayConstant : ℝ
  gasConstant : ℝ
  currentDensity : ℝ

structure ButlerVolmerEquationEvidence (B : ButlerVolmerEquationPackage) where
  transferCoefficientsPositive : B.anodicTransferCoefficient > 0 ∧ B.cathodicTransferCoefficient > 0
  exchangeCurrentDensityPositive : B.exchangeCurrentDensity > 0
  overpotentialFinite : B.overpotential ≠ 0
  temperaturePositive : B.temperature > 0
  constantsPositive : B.faradayConstant > 0 ∧ B.gasConstant > 0
  currentDensityDefined : B.currentDensity ≠ 0

def ButlerVolmerEquationClosed (B : ButlerVolmerEquationPackage) : Prop :=
  (B.anodicTransferCoefficient > 0 ∧ B.cathodicTransferCoefficient > 0) ∧
  B.exchangeCurrentDensity > 0 ∧ B.overpotential ≠ 0 ∧ B.temperature > 0 ∧
  (B.faradayConstant > 0 ∧ B.gasConstant > 0) ∧ B.currentDensity ≠ 0

theorem butler_volmer_equation_closed_from_evidence (B : ButlerVolmerEquationPackage) (E : ButlerVolmerEquationEvidence B) :
    ButlerVolmerEquationClosed B := by
  exact And.intro E.transferCoefficientsPositive
    (And.intro E.exchangeCurrentDensityPositive
      (And.intro E.overpotentialFinite
        (And.intro E.temperaturePositive
          (And.intro E.constantsPositive E.currentDensityDefined))))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse