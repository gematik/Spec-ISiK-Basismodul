Profile: ISiKLaboruntersuchungPCT
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungPCT
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung PCT eines Patienten in ISiK Szenarien."
* insert Meta
* code.coding[loinc] from ObservationCodesPCT (required)
* code.coding[snomed] = $sct#418752001
* valueQuantity from ObservationUnitsPCT (required)
* referenceRange MS
  * low from ObservationUnitsPCT (required)
  * high from ObservationUnitsPCT (required)

ValueSet: ObservationCodesPCT
Id: ObservationCodesPCT
Description: "Enthält LOINC-Codes für die Observation PCT"
* insert Meta
* $cs-loinc#33959-8 "Procalcitonin [Masse/Volumen] in Serum oder Plasma"
* $cs-loinc#75241-0 "Procalcitonin [Masse/Volumen] in Serum oder Plasma mittels Immunoassay"
* $cs-loinc#51637-7 "Thrombokrit [Volumenfraktion] in Blut"

ValueSet: ObservationUnitsPCT
Id: ObservationUnitsPCT
Description: "Enthält UCUM-Einheiten für die Observation PCT"
* insert Meta
* $cs-ucum#ng/mL "nanogram per milliliter"
* $cs-ucum#% "percent"

Instance: ExampleISiKLaboruntersuchungPCT1
InstanceOf: ISiKLaboruntersuchungPCT
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* code.coding[loinc] = $cs-loinc#33959-8
* code.coding[snomed] = $sct#418752001 "Procalcitonin" 
* valueQuantity = 0.2 $cs-ucum#ng/mL
* referenceRange
  * high = 0.5 $cs-ucum#ng/mL
