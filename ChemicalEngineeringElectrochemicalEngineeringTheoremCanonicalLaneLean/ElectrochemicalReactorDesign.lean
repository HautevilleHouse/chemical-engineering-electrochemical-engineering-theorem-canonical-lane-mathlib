import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ElectrochemicalReactorDesignPackage where
  reactorConfiguration : Prop
  currentDistribution : Prop
  potentialDistribution : Prop
  energyEfficiency : Prop
  massBalance : Prop
  heatBalance : Prop

structure ElectrochemicalReactorDesignEvidence (R : ElectrochemicalReactorDesignPackage) where
  reactorConfigurationClosed : R.reactorConfiguration
  currentDistributionClosed : R.currentDistribution
  potentialDistributionClosed : R.potentialDistribution
  energyEfficiencyClosed : R.energyEfficiency
  massBalanceClosed : R.massBalance
  heatBalanceClosed : R.heatBalance

def ElectrochemicalReactorDesignClosed (R : ElectrochemicalReactorDesignPackage) : Prop :=
  R.reactorConfiguration ∧ R.currentDistribution ∧
  R.potentialDistribution ∧ R.energyEfficiency ∧
  R.massBalance ∧ R.heatBalance

theorem electrochemical_reactor_design_closed_from_evidence
    (R : ElectrochemicalReactorDesignPackage)
    (Ev : ElectrochemicalReactorDesignEvidence R) : ElectrochemicalReactorDesignClosed R := by
  exact And.intro Ev.reactorConfigurationClosed
    (And.intro Ev.currentDistributionClosed
      (And.intro Ev.potentialDistributionClosed
        (And.intro Ev.energyEfficiencyClosed
          (And.intro Ev.massBalanceClosed
            Ev.heatBalanceClosed))))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse