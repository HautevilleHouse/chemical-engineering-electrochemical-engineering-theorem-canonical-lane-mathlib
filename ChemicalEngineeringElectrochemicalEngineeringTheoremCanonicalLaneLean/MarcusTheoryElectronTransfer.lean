import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure MarcusTheoryElectronTransferPackage where
  reorganizationEnergy : Prop
  drivingForce : Prop
  activationFreeEnergy : Prop
  rateConstant : Prop
  invertedRegion : Prop

structure MarcusTheoryElectronTransferEvidence (M : MarcusTheoryElectronTransferPackage) where
  reorganizationEnergyClosed : M.reorganizationEnergy
  drivingForceClosed : M.drivingForce
  activationFreeEnergyClosed : M.activationFreeEnergy
  rateConstantClosed : M.rateConstant
  invertedRegionClosed : M.invertedRegion

def MarcusTheoryElectronTransferClosed (M : MarcusTheoryElectronTransferPackage) : Prop :=
  M.reorganizationEnergy ∧ M.drivingForce ∧ M.activationFreeEnergy ∧
  M.rateConstant ∧ M.invertedRegion

theorem marcus_theory_electron_transfer_closed_from_evidence
    (M : MarcusTheoryElectronTransferPackage)
    (E : MarcusTheoryElectronTransferEvidence M) : MarcusTheoryElectronTransferClosed M := by
  exact And.intro E.reorganizationEnergyClosed
    (And.intro E.drivingForceClosed
      (And.intro E.activationFreeEnergyClosed
        (And.intro E.rateConstantClosed E.invertedRegionClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
