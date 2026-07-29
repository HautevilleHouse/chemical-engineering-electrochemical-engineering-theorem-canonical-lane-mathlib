import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ElectrochemicalImpedancePackage where
  faradaicImpedance : Prop
  warburgElement : Prop
  chargeTransferResistance : Prop
  constantPhaseElement : Prop
  equivalentCircuitModel : Prop

structure ElectrochemicalImpedanceEvidence (I : ElectrochemicalImpedancePackage) where
  faradaicImpedanceClosed : I.faradaicImpedance
  warburgElementClosed : I.warburgElement
  chargeTransferResistanceClosed : I.chargeTransferResistance
  constantPhaseElementClosed : I.constantPhaseElement
  equivalentCircuitModelClosed : I.equivalentCircuitModel

def ElectrochemicalImpedanceClosed (I : ElectrochemicalImpedancePackage) : Prop :=
  I.faradaicImpedance ∧ I.warburgElement ∧
  I.chargeTransferResistance ∧ I.constantPhaseElement ∧ I.equivalentCircuitModel

theorem electrochemical_impedance_closed_from_evidence (I : ElectrochemicalImpedancePackage)
    (Ev : ElectrochemicalImpedanceEvidence I) : ElectrochemicalImpedanceClosed I := by
  exact And.intro Ev.faradaicImpedanceClosed
    (And.intro Ev.warburgElementClosed
      (And.intro Ev.chargeTransferResistanceClosed
        (And.intro Ev.constantPhaseElementClosed Ev.equivalentCircuitModelClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
