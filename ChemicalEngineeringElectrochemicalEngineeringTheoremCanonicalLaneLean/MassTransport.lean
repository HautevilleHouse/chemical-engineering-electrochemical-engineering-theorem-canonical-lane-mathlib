import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure MassTransportPackage where
  diffusionCoefficient : ℝ
  convectionVelocity : ℝ
  concentrationGradient : ℝ
  flux : ℝ
  nernstPlanckValid : Prop
  stefanMaxwellValid : Prop

structure MassTransportEvidence (M : MassTransportPackage) where
  diffusionCoefficientPositive : M.diffusionCoefficient > 0
  convectionVelocityFinite : M.convectionVelocity ≠ 0
  concentrationGradientNonzero : M.concentrationGradient ≠ 0
  fluxNonzero : M.flux ≠ 0
  nernstPlanckValidClosed : M.nernstPlanckValid
  stefanMaxwellValidClosed : M.stefanMaxwellValid

def MassTransportClosed (M : MassTransportPackage) : Prop :=
  M.diffusionCoefficient > 0 ∧ M.convectionVelocity ≠ 0 ∧ M.concentrationGradient ≠ 0 ∧ M.flux ≠ 0 ∧ M.nernstPlanckValid ∧ M.stefanMaxwellValid

theorem mass_transport_closed_from_evidence (M : MassTransportPackage) (E : MassTransportEvidence M) :
    MassTransportClosed M := by
  exact And.intro E.diffusionCoefficientPositive
    (And.intro E.convectionVelocityFinite
      (And.intro E.concentrationGradientNonzero
        (And.intro E.fluxNonzero
          (And.intro E.nernstPlanckValidClosed E.stefanMaxwellValidClosed))))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse