import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

structure FaradayLawElectrolysisPackage where
  chargePassed : Prop
  molesOfElectrons : Prop
  faradayConstant : Prop
  massDeposited : Prop
  currentEfficiency : Prop

structure FaradayLawElectrolysisEvidence (F : FaradayLawElectrolysisPackage) where
  chargePassedClosed : F.chargePassed
  molesOfElectronsClosed : F.molesOfElectrons
  faradayConstantClosed : F.faradayConstant
  massDepositedClosed : F.massDeposited
  currentEfficiencyClosed : F.currentEfficiency

def FaradayLawElectrolysisClosed (F : FaradayLawElectrolysisPackage) : Prop :=
  F.chargePassed ∧ F.molesOfElectrons ∧ F.faradayConstant ∧
  F.massDeposited ∧ F.currentEfficiency

theorem faraday_law_electrolysis_closed_from_evidence (F : FaradayLawElectrolysisPackage)
    (E : FaradayLawElectrolysisEvidence F) : FaradayLawElectrolysisClosed F := by
  exact And.intro E.chargePassedClosed
    (And.intro E.molesOfElectronsClosed
      (And.intro E.faradayConstantClosed
        (And.intro E.massDepositedClosed E.currentEfficiencyClosed)))

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
