import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ElectricalDoubleLayerPackage where
  sternModel : Prop
  gouyChapmanLayer : Prop
  helmholtzCapacity : Prop
  diffuseLayerPotential : Prop
  surfaceChargeDensity : Prop

structure ElectricalDoubleLayerEvidence (D : ElectricalDoubleLayerPackage) where
  sternModelClosed : D.sternModel
  gouyChapmanLayerClosed : D.gouyChapmanLayer
  helmholtzCapacityClosed : D.helmholtzCapacity
  diffuseLayerPotentialClosed : D.diffuseLayerPotential
  surfaceChargeDensityClosed : D.surfaceChargeDensity

def ElectricalDoubleLayerClosed (D : ElectricalDoubleLayerPackage) : Prop :=
  D.sternModel ∧ D.gouyChapmanLayer ∧
  D.helmholtzCapacity ∧ D.diffuseLayerPotential ∧ D.surfaceChargeDensity

theorem electrical_double_layer_closed_from_evidence (D : ElectricalDoubleLayerPackage)
    (Ev : ElectricalDoubleLayerEvidence D) : ElectricalDoubleLayerClosed D := by
  exact And.intro Ev.sternModelClosed
    (And.intro Ev.gouyChapmanLayerClosed
      (And.intro Ev.helmholtzCapacityClosed
        (And.intro Ev.diffuseLayerPotentialClosed Ev.surfaceChargeDensityClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
