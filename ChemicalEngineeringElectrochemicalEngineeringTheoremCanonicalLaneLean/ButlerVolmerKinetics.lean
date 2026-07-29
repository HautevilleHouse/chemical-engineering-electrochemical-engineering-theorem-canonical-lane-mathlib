import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ButlerVolmerKineticsPackage where
  reactionRate : Prop
  exchangeCurrentDensity : Prop
  transferCoefficients : Prop
  activationOverpotential : Prop
  temperatureDependence : Prop

structure ButlerVolmerKineticsEvidence (B : ButlerVolmerKineticsPackage) where
  reactionRateClosed : B.reactionRate
  exchangeCurrentDensityClosed : B.exchangeCurrentDensity
  transferCoefficientsClosed : B.transferCoefficients
  activationOverpotentialClosed : B.activationOverpotential
  temperatureDependenceClosed : B.temperatureDependence

def ButlerVolmerKineticsClosed (B : ButlerVolmerKineticsPackage) : Prop :=
  B.reactionRate ∧ B.exchangeCurrentDensity ∧ B.transferCoefficients ∧
  B.activationOverpotential ∧ B.temperatureDependence

theorem butler_volmer_kinetics_closed_from_evidence (B : ButlerVolmerKineticsPackage)
    (E : ButlerVolmerKineticsEvidence B) : ButlerVolmerKineticsClosed B := by
  exact And.intro E.reactionRateClosed
    (And.intro E.exchangeCurrentDensityClosed
      (And.intro E.transferCoefficientsClosed
        (And.intro E.activationOverpotentialClosed E.temperatureDependenceClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
