import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure MolecularOrbitalTheoryPackage where
  hamiltonian : String
  basisSet : String
  homoLevel : ℝ
  lumoLevel : ℝ
  bandGap : ℝ
  symmetryGroup : String

structure MolecularOrbitalTheoryEvidence (M : MolecularOrbitalTheoryPackage) where
  hamiltonianClosed : M.hamiltonian = "hartreeFock" ∨ M.hamiltonian = "dft"
  basisSetClosed : M.basisSet ≠ ""
  homoLumoOrdered : M.homoLevel ≤ M.lumoLevel
  bandGapNonnegative : M.bandGap ≥ 0
  symmetryGroupClosed : M.symmetryGroup ≠ ""

def MolecularOrbitalTheoryClosed (M : MolecularOrbitalTheoryPackage) : Prop :=
  (M.hamiltonian = "hartreeFock" ∨ M.hamiltonian = "dft") ∧
  M.basisSet ≠ "" ∧ M.homoLevel ≤ M.lumoLevel ∧ M.bandGap ≥ 0 ∧ M.symmetryGroup ≠ ""

theorem molecular_orbital_theory_closed_from_evidence (M : MolecularOrbitalTheoryPackage) (E : MolecularOrbitalTheoryEvidence M) :
    MolecularOrbitalTheoryClosed M := by
  exact And.intro E.hamiltonianClosed
    (And.intro E.basisSetClosed
      (And.intro E.homoLumoOrdered
        (And.intro E.bandGapNonnegative E.symmetryGroupClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse