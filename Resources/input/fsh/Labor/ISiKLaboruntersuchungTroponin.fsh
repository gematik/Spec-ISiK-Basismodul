Profile: ISiKLaboruntersuchungTroponin
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungTroponin
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Troponin eines Patienten in ISiK Szenarien."
* insert Meta
* code.coding[loinc] from ObservationCodesTroponin
* code.coding[snomed] = $sct#105000003
* valueQuantity from ObservationUnitsTroponin
* referenceRange MS
  * low from ObservationUnitsTroponin
  * high from ObservationUnitsTroponin

ValueSet: ObservationCodesTroponin
Id: ObservationCodesTroponin
Description: "Enthält LOINC-Codes für die Observation Troponin"
* insert Meta
* $cs-loinc#48425-3 "Troponin T.kardial [Masse/Volumen] in Blut"
* $cs-loinc#42757-5 "Troponin I.kardial [Masse/Volumen] in Blut"
* $cs-loinc#6597-9 "Troponin T.kardial [Masse/Volumen] in venösem Blut"
* $cs-loinc#10839-9 "Troponin I.kardial [Masse/Volumen] in Serum oder Plasma"
* $cs-loinc#6598-7 "Troponin T.kardial [Masse/Volumen] in Serum oder Plasma"
* $cs-loinc#89579-7 "Troponin I.kardial [Masse/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
* $cs-loinc#67151-1 "Troponin T.kardial [Masse/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
* $cs-loinc#49563-0 "Troponin I.kardial [Masse/Volumen] in Serum oder Plasma mittels Nachweisgrenze <= 0,01 ng/mL"

ValueSet: ObservationUnitsTroponin
Id: ObservationUnitsTroponin
Description: "Enthält UCUM-Einheiten für die Observation Troponin"
* insert Meta
* $cs-ucum#ng/mL "nanogram per milliliter"
* $cs-ucum#ug/L "microgram per liter"

Instance: ExampleISiKLaboruntersuchungTroponin1
InstanceOf: ISiKLaboruntersuchungTroponin
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* code.coding[loinc] = $cs-loinc#42757-5
* code.coding[snomed] = $sct#105000003 "Troponin measurement"
* valueQuantity = 0.1 $cs-ucum#ug/L
* referenceRange
  * high = 0.4 $cs-ucum#ug/L
