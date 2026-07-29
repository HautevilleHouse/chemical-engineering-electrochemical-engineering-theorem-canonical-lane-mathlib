import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure DoubleLayerStructurePackage where
  sternModel : Prop
  gouyChapmanTheory : Prop
  differentialCapacitance : Prop
  potentialDistribution : Prop
  ionicConcentrationProfile : Prop

structure DoubleLayerStructureEvidence (D : DoubleLayerStructurePackage) where
  sternModelClosed : D.sternModel
  gouyChapmanTheoryClosed : D.gouyChapmanTheory
  differentialCapacitanceClosed : D.differentialCapacitance
  potentialDistributionClosed : D.potentialDistribution
  ionicConcentrationProfileClosed : D.ionicConcentrationProfile

def DoubleLayerStructureClosed (D : DoubleLayerStructurePackage) : Prop :=
  D.sternModel ∧ D.gouyChapmanTheory ∧
  D.differentialCapacitance ∧ D.potentialDistribution ∧
  D.ionicConcentrationProfile

theorem double_layer_structure_closed_from_evidence (D : DoubleLayerStructurePackage)
    (Ev : DoubleLayerStructureEvidence D) : DoubleLayerStructureClosed D := by
  exact And.intro Ev.sternModelClosed
    (And.intro Ev.gouyChapmanTheoryClosed
      (And.intro Ev.differentialCapacitanceClosed
        (And.intro Ev.potentialDistributionClosed
          Ev.ionicConcentrationProfileClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse