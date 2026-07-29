import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ElectrolyteTransportPackage where
  nernstPlanckEquation : Prop
  ionicConductivity : Prop
  diffusionCoefficient : Prop
  migrationDrift : Prop
  convectionTerm : Prop

structure ElectrolyteTransportEvidence (T : ElectrolyteTransportPackage) where
  nernstPlanckEquationClosed : T.nernstPlanckEquation
  ionicConductivityClosed : T.ionicConductivity
  diffusionCoefficientClosed : T.diffusionCoefficient
  migrationDriftClosed : T.migrationDrift
  convectionTermClosed : T.convectionTerm

def ElectrolyteTransportClosed (T : ElectrolyteTransportPackage) : Prop :=
  T.nernstPlanckEquation ∧ T.ionicConductivity ∧
  T.diffusionCoefficient ∧ T.migrationDrift ∧ T.convectionTerm

theorem electrolyte_transport_closed_from_evidence (T : ElectrolyteTransportPackage)
    (Ev : ElectrolyteTransportEvidence T) : ElectrolyteTransportClosed T := by
  exact And.intro Ev.nernstPlanckEquationClosed
    (And.intro Ev.ionicConductivityClosed
      (And.intro Ev.diffusionCoefficientClosed
        (And.intro Ev.migrationDriftClosed Ev.convectionTermClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
