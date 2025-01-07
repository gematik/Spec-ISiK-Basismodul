Extension: ExtensionISiKMedikationsart
Id: ExtensionISiKMedikationsart
Title: "ISiK Medikationsart"
Description: "Extension zur Dokumentation der Therapieart einer Medikation (Akut- oder Dauermedikation)."
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* value[x] 1..
* value[x] only Coding
* valueCoding from ISiKMedikationsartVS
  * system 1..
  * code 1..
