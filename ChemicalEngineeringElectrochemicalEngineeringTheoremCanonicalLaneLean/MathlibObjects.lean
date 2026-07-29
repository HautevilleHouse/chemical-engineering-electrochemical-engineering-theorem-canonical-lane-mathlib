import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ElectrochemicalSystem where
  carrier : Type
  components : List String
  reactions : List String
  electrodePotential : Float
  currentDensity : Float

default ElectrochemicalSystem

structure ElectrochemicalAdmittedObject where
  system : ElectrochemicalSystem
  diffusionLimited : Prop
  kineticsModeled : Prop
  chargeTransferClosed : Prop
  conclusion : chargeTransferClosed

structure ElectrochemicalEndgameState where
  object : ElectrochemicalAdmittedObject

def ElectrochemicalWitnessClosed (O : ElectrochemicalAdmittedObject) : Prop :=
  O.chargeTransferClosed

end ChemicalEngineeringElectrochemicalEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
