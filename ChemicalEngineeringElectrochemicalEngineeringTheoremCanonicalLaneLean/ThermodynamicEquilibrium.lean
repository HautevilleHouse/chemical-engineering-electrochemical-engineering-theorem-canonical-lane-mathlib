import conservativeLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ThermodynamicEquilibriumPackage where
  equilibriumConstant : Prop
  gibbsFreeEnergy : Prop
  temperaturePressureComposition : Prop
  phaseStability : Prop
  reactionEquilibrium : Prop

structure ThermodynamicEquilibriumEvidence (T : ThermodynamicEquilibriumPackage) where
  equilibriumConstantClosed : T.equilibriumConstant
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  temperaturePressureCompositionClosed : T.temperaturePressureComposition
  phaseStabilityClosed : T.phaseStability
  reactionEquilibriumClosed : T.reactionEquilibrium

def ThermodynamicEquilibriumClosed (T : ThermodynamicEquilibriumPackage) : Prop :=
  T.equilibriumConstant ∧ T.gibbsFreeEnergy ∧ T.temperaturePressureComposition ∧ T.phaseStability ∧ T.reactionEquilibrium

theorem thermodynamic_equilibrium_closed_from_evidence (T : ThermodynamicEquilibriumPackage) (E : ThermodynamicEquilibriumEvidence T) :
    ThermodynamicEquilibriumClosed T := by
  exact And.intro E.equilibriumConstantClosed
    (And.intro E.gibbsFreeEnergyClosed
      (And.intro E.temperaturePressureCompositionClosed
        (And.intro E.phaseStabilityClosed E.reactionEquilibriumClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse