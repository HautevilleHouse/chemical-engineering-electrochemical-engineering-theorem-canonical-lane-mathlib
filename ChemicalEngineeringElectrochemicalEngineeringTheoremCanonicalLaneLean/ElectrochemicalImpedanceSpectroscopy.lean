import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ElectrochemicalImpedanceSpectroscopyPackage where
  impedanceReal : Prop
  impedanceImaginary : Prop
  solutionResistance : Prop
  chargeTransferResistance : Prop
  warburgImpedance : Prop

structure ElectrochemicalImpedanceSpectroscopyEvidence (E : ElectrochemicalImpedanceSpectroscopyPackage) where
  impedanceRealClosed : E.impedanceReal
  impedanceImaginaryClosed : E.impedanceImaginary
  solutionResistanceClosed : E.solutionResistance
  chargeTransferResistanceClosed : E.chargeTransferResistance
  warburgImpedanceClosed : E.warburgImpedance

def ElectrochemicalImpedanceSpectroscopyClosed (E : ElectrochemicalImpedanceSpectroscopyPackage) : Prop :=
  E.impedanceReal ∧ E.impedanceImaginary ∧ E.solutionResistance ∧
  E.chargeTransferResistance ∧ E.warburgImpedance

theorem electrochemical_impedance_spectroscopy_closed_from_evidence
    (E : ElectrochemicalImpedanceSpectroscopyPackage)
    (Ev : ElectrochemicalImpedanceSpectroscopyEvidence E) : ElectrochemicalImpedanceSpectroscopyClosed E := by
  exact And.intro Ev.impedanceRealClosed
    (And.intro Ev.impedanceImaginaryClosed
      (And.intro Ev.solutionResistanceClosed
        (And.intro Ev.chargeTransferResistanceClosed Ev.warburgImpedanceClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
