Extension: ExtensionISiKMedicationStatementReplaces
Id: ExtensionISiKMedicationStatementReplaces
Title: "ISiK MedicationStatementReplaces"
Description: "Extension zur Verlinkung der Medikationsinformation die ersetzt wurde"
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* value[x] 1..
* value[x] only Reference(MedicationStatement)
* valueReference
  * reference 1..
