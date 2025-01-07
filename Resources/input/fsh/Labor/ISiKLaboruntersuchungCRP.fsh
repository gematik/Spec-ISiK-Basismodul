Profile: ISiKLaboruntersuchungCRP
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungCRP
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung CRP eines Patienten in ISiK Szenarien."
* insert Meta
* code.coding[loinc] from ObservationCodesCRP 
* code.coding[snomed] = $sct#55235003
* valueQuantity from ObservationUnitsCRP 
* referenceRange MS
  * low from ObservationUnitsCRP 
  * high from ObservationUnitsCRP

ValueSet: ObservationCodesCRP
Id: ObservationCodesCRP
Description: "Enthält LOINC-Codes für die Observation CRP"
* insert Meta
* $cs-loinc#71426-1 "C-reaktives Protein [Masse/Volumen] in Blut mittels Hochsensitivitätsmethode"
* $cs-loinc#30522-7 "C-reaktives Protein [Masse/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
* $cs-loinc#78486-0 "C-reaktives Protein [Mol/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
* $cs-loinc#45062-7 "C-reaktives Protein [Masse/Volumen] in Liquor"
* $cs-loinc#48421-2 "C-reaktives Protein [Masse/Volumen] in Kapillarblut"
* $cs-loinc#11039-5 "C-reaktives Protein [Nachweis] in Serum oder Plasma"
* $cs-loinc#76485-2 "C-reaktives Protein [Mol/Volumen] in Serum oder Plasma"
* $cs-loinc#16503-5 "C-reaktives Protein [Masse/Volumen] in Körperflüssigkeit"
* $cs-loinc#1988-5 "C-reaktives Protein [Masse/Volumen] in Serum oder Plasma"
* $cs-loinc#14634-0 "C-reaktives Protein [Titer] in Serum oder Plasma"

ValueSet: ObservationUnitsCRP
Id: ObservationUnitsCRP
Description: "Enthält UCUM-Einheiten für die Observation CRP"
* insert Meta
* $cs-ucum#mg/L "milligram per liter"
* $cs-ucum#nmol/L "nanomol per liter"

Instance: ExampleISiKLaboruntersuchungCRP1
InstanceOf: ISiKLaboruntersuchungCRP
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* code.coding[loinc] = $cs-loinc#1988-5 "C-reaktives Protein [Masse/Volumen] in Serum oder Plasma"
* code.coding[snomed] = $sct#55235003 "C-reactive protein measurement"
* valueQuantity = 7.4 $cs-ucum#mg/L
* referenceRange
  * high = 5 $cs-ucum#mg/L
