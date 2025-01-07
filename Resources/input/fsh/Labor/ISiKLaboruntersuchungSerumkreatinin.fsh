Profile: ISiKLaboruntersuchungSerumkreatinin
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungSerumkreatinin
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien."
* insert Meta
* code.coding[loinc] from ObservationCodesSerumkreatinin
* code.coding[snomed] = $sct#70901006
* valueQuantity from ObservationUnitsSerumkreatinin
* referenceRange MS
  * low from ObservationUnitsSerumkreatinin
  * high from ObservationUnitsSerumkreatinin

ValueSet: ObservationCodesSerumkreatinin
Id: ObservationCodesSerumkreatinin
Description: "Enthält LOINC-Codes für die Observation Serumkreatinin"
* insert Meta
* $cs-loinc#39802-4 "Creatinin in Dialyseflüssigkeit/Creatinin in Serum oder Plasma"
* $cs-loinc#70266-2 "Creatinin in Peritonealflüssigkeit/Creatinin in Serum"
* $cs-loinc#70264-7 "Creatinin in Pleuraflüssigkeit/Creatinin in Serum"
* $cs-loinc#2160-0 "Creatinin [Masse/Volumen] in Serum oder Plasma"
* $cs-loinc#14682-9 "Creatinin [Mol/Volumen] in Serum oder Plasma"
* $cs-loinc#40248-7 "Creatinin [Masse/Volumen] in Serum oder Plasma --Basislinie"
* $cs-loinc#40264-4 "Creatinin [Mol/Volumen] in Serum oder Plasma --Basislinie"
* $cs-loinc#44784-7 "Creatinin [Masse/Volumen] (Maximalwert während der Untersuchung) in Serum oder Plasma"
* $cs-loinc#11042-9 "Creatinin [Masse/Volumen] in Serum oder Plasma --vor Dialyse"
* $cs-loinc#51619-5 "Creatinin [Mol/Volumen] in Serum oder Plasma --vor Dialyse"
* $cs-loinc#40112-5 "Creatinin [Mol/Volumen] in Serum oder Plasma --vor XXX Stimulation"
* $cs-loinc#11041-1 "Creatinin [Masse/Volumen] in Serum oder Plasma --nach Dialyse"
* $cs-loinc#72271-0 "Creatinin [Masse/Volumen] in Serum oder Plasma --vor Kontrastmittelgabe"
* $cs-loinc#77140-2 "Creatinin [Mol/Volumen] in Serum, Plasma oder Blut"
* $cs-loinc#40116-6 "Creatinin [Mol/Volumen] in Serum oder Plasma --30 Minuten vor XXX Stimulation"
* $cs-loinc#2164-2 "Creatinin-Clearance renal in 24-Stunden-Urin und Serum oder Plasma"
* $cs-loinc#40250-3 "Creatinin [Masse/Volumen] in Serum oder Plasma --1 Stunde nach XXX Stimulation"
* $cs-loinc#40254-5 "Creatinin [Masse/Volumen] in Serum oder Plasma --2,5 Stunden nach XXX Stimulation"
* $cs-loinc#40252-9 "Creatinin [Masse/Volumen] in Serum oder Plasma --2 Stunden nach XXX Stimulation"
* $cs-loinc#26752-6 "Creatinin-Clearance renal in 2-Stunden-Urin und Serum oder Plasma"
* $cs-loinc#40267-7 "Creatinin [Mol/Volumen] in Serum oder Plasma --1,5 Stunden nach XXX Stimulation"

ValueSet: ObservationUnitsSerumkreatinin
Id: ObservationUnitsSerumkreatinin
Description: "Enthält UCUM-Einheiten für die Observation Serumkreatinin"
* insert Meta
* $cs-ucum#mg/dL "milligram per deciliter"
* $cs-ucum#umol/L "micromol per liter"

Instance: ExampleISiKLaboruntersuchungSerumkreatinin1
InstanceOf: ISiKLaboruntersuchungSerumkreatinin
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* code.coding[loinc] = $cs-loinc#2160-0
* code.coding[snomed] = $sct#70901006 "Creatinine measurement"
* valueQuantity = 0.7 $cs-ucum#mg/dL
* referenceRange
  * low = 0.6 $cs-ucum#mg/dL
  * high = 1.2 $cs-ucum#mg/dL
  * appliesTo = $cs-sct#248152002 "female"
