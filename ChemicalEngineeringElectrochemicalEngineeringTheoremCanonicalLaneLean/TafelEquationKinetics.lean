import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure TafelEquationKineticsPackage where
  tafelSlope : Prop
  overpotential : Prop
  currentDensity : Prop
  exchangeCurrentDensity : Prop
  linearRegion : Prop

structure TafelEquationKineticsEvidence (T : TafelEquationKineticsPackage) where
  tafelSlopeClosed : T.tafelSlope
  overpotentialClosed : T.overpotential
  currentDensityClosed : T.currentDensity
  exchangeCurrentDensityClosed : T.exchangeCurrentDensity
  linearRegionClosed : T.linearRegion

def TafelEquationKineticsClosed (T : TafelEquationKineticsPackage) : Prop :=
  T.tafelSlope ∧ T.overpotential ∧ T.currentDensity ∧
  T.exchangeCurrentDensity ∧ T.linearRegion

theorem tafel_equation_kinetics_closed_from_evidence (T : TafelEquationKineticsPackage)
    (E : TafelEquationKineticsEvidence T) : TafelEquationKineticsClosed T := by
  exact And.intro E.tafelSlopeClosed
    (And.intro E.overpotentialClosed
      (And.intro E.currentDensityClosed
        (And.intro E.exchangeCurrentDensityClosed E.linearRegionClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
