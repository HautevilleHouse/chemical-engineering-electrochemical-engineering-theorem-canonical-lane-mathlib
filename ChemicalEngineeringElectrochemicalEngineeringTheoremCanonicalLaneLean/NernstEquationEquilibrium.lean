import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure NernstEquationEquilibriumPackage where
  standardPotential : Prop
  temperature : Prop
  numberElectrons : Prop
  reactionQuotient : Prop
  equilibriumPotential : Prop

structure NernstEquationEquilibriumEvidence (N : NernstEquationEquilibriumPackage) where
  standardPotentialClosed : N.standardPotential
  temperatureClosed : N.temperature
  numberElectronsClosed : N.numberElectrons
  reactionQuotientClosed : N.reactionQuotient
  equilibriumPotentialClosed : N.equilibriumPotential

def NernstEquationEquilibriumClosed (N : NernstEquationEquilibriumPackage) : Prop :=
  N.standardPotential ∧ N.temperature ∧ N.numberElectrons ∧
  N.reactionQuotient ∧ N.equilibriumPotential

theorem nernst_equation_equilibrium_closed_from_evidence
    (N : NernstEquationEquilibriumPackage)
    (E : NernstEquationEquilibriumEvidence N) : NernstEquationEquilibriumClosed N := by
  exact And.intro E.standardPotentialClosed
    (And.intro E.temperatureClosed
      (And.intro E.numberElectronsClosed
        (And.intro E.reactionQuotientClosed E.equilibriumPotentialClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
