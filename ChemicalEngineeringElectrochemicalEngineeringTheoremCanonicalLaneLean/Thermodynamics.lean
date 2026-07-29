import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ThermodynamicsPackage where
  gibbsFreeEnergy : ℝ
  enthalpy : ℝ
  entropy : ℝ
  temperature : ℝ
  equilibriumConstant : ℝ
  reactionQuotient : ℝ

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  gibbsFreeEnergyFinite : T.gibbsFreeEnergy ≠ 0
  enthalpyFinite : T.enthalpy ≠ 0
  entropyFinite : T.entropy ≠ 0
  temperaturePositive : T.temperature > 0
  equilibriumConstantPositive : T.equilibriumConstant > 0
  reactionQuotientPositive : T.reactionQuotient > 0

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.gibbsFreeEnergy ≠ 0 ∧ T.enthalpy ≠ 0 ∧ T.entropy ≠ 0 ∧ T.temperature > 0 ∧ T.equilibriumConstant > 0 ∧ T.reactionQuotient > 0

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.gibbsFreeEnergyFinite
    (And.intro E.enthalpyFinite
      (And.intro E.entropyFinite
        (And.intro E.temperaturePositive
          (And.intro E.equilibriumConstantPositive E.reactionQuotientPositive))))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse