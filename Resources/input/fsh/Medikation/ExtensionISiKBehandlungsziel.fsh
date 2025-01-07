Extension: ExtensionISiKBehandlungsziel
Id: ExtensionISiKBehandlungsziel
Title: "ISiK Behandlungsziel"
Description: "Extension zur freitextlichen Angabe des Behandlungsziels."
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* value[x] 1..
* value[x] only string
