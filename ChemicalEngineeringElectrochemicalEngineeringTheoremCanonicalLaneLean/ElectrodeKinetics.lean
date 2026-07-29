import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure ElectrodeKineticsPackage where
  butlerVolmerEquation : Prop
  chargeTransferCoefficient : Prop
  exchangeCurrentDensity : Prop
  overpotentialRelation : Prop
  massTransportLimitation : Prop

structure ElectrodeKineticsEvidence (E : ElectrodeKineticsPackage) where
  butlerVolmerEquationClosed : E.butlerVolmerEquation
  chargeTransferCoefficientClosed : E.chargeTransferCoefficient
  exchangeCurrentDensityClosed : E.exchangeCurrentDensity
  overpotentialRelationClosed : E.overpotentialRelation
  massTransportLimitationClosed : E.massTransportLimitation

def ElectrodeKineticsClosed (E : ElectrodeKineticsPackage) : Prop :=
  E.butlerVolmerEquation ∧ E.chargeTransferCoefficient ∧
  E.exchangeCurrentDensity ∧ E.overpotentialRelation ∧ E.massTransportLimitation

theorem electrode_kinetics_closed_from_evidence (E : ElectrodeKineticsPackage)
    (Ev : ElectrodeKineticsEvidence E) : ElectrodeKineticsClosed E := by
  exact And.intro Ev.butlerVolmerEquationClosed
    (And.intro Ev.chargeTransferCoefficientClosed
      (And.intro Ev.exchangeCurrentDensityClosed
        (And.intro Ev.overpotentialRelationClosed Ev.massTransportLimitationClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
