Profile: ISiKLaboruntersuchungThrombozyten
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungThrombozyten
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Thrombozyten eines Patienten in ISiK Szenarien."
* insert Meta
* code.coding[loinc] from ObservationCodesThrombozyten
* code.coding[snomed] = $sct#365632008
* valueQuantity from ObservationUnitsThrombozyten
* referenceRange MS
  * low from ObservationUnitsThrombozyten
  * high from ObservationUnitsThrombozyten

ValueSet: ObservationCodesThrombozyten
Id: ObservationCodesThrombozyten
Description: "Enthält LOINC-Codes für die Observation Thrombozyten"
* insert Meta
* $cs-loinc#13057-5 "Thrombozyten [Einheiten/Volumen] in Dialysat"
* $cs-loinc#26515-7 "Thrombozyten [#/Volumen] in Blut"
* $cs-loinc#26516-5 "Thrombozyten [#/Volumen] in Plasma"
* $cs-loinc#49497-1 "Thrombozyten [#/Volumen] in Blut mittels Schätzung"
* $cs-loinc#778-1 "Thrombozyten [#/Volumen] in Blut mittels manueller Zählung"
* $cs-loinc#777-3 "Thrombozyten [#/Volumen] in Blut mittels automatisierter Zählung"
* $cs-loinc#13056-7 "Thrombozyten [#/Volumen] in Plasma mittels automatisierter Zählung"
* $cs-loinc#74775-8 "Thrombozyten [#/Volumen] in thrombozytenreichem Plasma mittels automatisierter Zählung"
* $cs-loinc#74464-9 "Thrombozyten [#/Volumen] in Kapillarblut mittels manueller Zählung"
* $cs-loinc#40574-6 "Thrombozyten [#/Volumen] in Körperflüssigkeit mittels automatisierter Zählung"

ValueSet: ObservationUnitsThrombozyten
Id: ObservationUnitsThrombozyten
Description: "Enthält UCUM-Einheiten für die Observation Thrombozyten"
* insert Meta
* $cs-ucum#10*3/uL "10^3 per microliter"

Instance: ExampleISiKLaboruntersuchungThrombozyten1
InstanceOf: ISiKLaboruntersuchungThrombozyten
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* code.coding[loinc] = $cs-loinc#26515-7
* code.coding[snomed] = $sct#365632008 "Platelet count - finding"
* valueQuantity = 178 $cs-ucum#10*3/uL
* referenceRange
  * low = 150 $cs-ucum#10*3/uL
  * high = 400 $cs-ucum#10*3/uL
