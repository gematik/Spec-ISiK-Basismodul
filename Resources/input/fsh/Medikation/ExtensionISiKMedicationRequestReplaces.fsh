Extension: ExtensionISiKMedicationRequestReplaces
Id: ExtensionISiKMedicationRequestReplaces
Title: "ISiK MedicationRequestReplaces"
Description: "Extension zur Verlinkung der Medikationsverordnung die ersetzt wurde"
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* value[x] 1..
* value[x] only Reference(MedicationRequest)
* valueReference
  * reference 1..
