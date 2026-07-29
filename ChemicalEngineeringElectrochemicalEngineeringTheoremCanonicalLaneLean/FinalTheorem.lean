import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

def ConstrainedElectrochemicalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_electrochemical_endgame (A : AdmissibleClass) :
    ConstrainedElectrochemicalClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse