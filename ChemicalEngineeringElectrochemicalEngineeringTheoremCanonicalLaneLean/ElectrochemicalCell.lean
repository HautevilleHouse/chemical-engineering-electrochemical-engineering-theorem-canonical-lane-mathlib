import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ElectrochemicalCellPackage where
  anodeReaction : String
  cathodeReaction : String
  cellPotential : ℝ
  currentDensity : ℝ
  electrolyteConductivity : ℝ
  overpotential : ℝ

structure ElectrochemicalCellEvidence (C : ElectrochemicalCellPackage) where
  anodeReactionClosed : C.anodeReaction ≠ ""
  cathodeReactionClosed : C.cathodeReaction ≠ ""
  cellPotentialFinite : C.cellPotential ≠ 0
  currentDensityNonnegative : C.currentDensity ≥ 0
  electrolyteConductivityPositive : C.electrolyteConductivity > 0
  overpotentialFinite : C.overpotential ≠ 0

def ElectrochemicalCellClosed (C : ElectrochemicalCellPackage) : Prop :=
  C.anodeReaction ≠ "" ∧ C.cathodeReaction ≠ "" ∧ C.cellPotential ≠ 0 ∧ C.currentDensity ≥ 0 ∧ C.electrolyteConductivity > 0 ∧ C.overpotential ≠ 0

theorem electrochemical_cell_closed_from_evidence (C : ElectrochemicalCellPackage) (E : ElectrochemicalCellEvidence C) :
    ElectrochemicalCellClosed C := by
  exact And.intro E.anodeReactionClosed
    (And.intro E.cathodeReactionClosed
      (And.intro E.cellPotentialFinite
        (And.intro E.currentDensityNonnegative
          (And.intro E.electrolyteConductivityPositive E.overpotentialFinite))))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse