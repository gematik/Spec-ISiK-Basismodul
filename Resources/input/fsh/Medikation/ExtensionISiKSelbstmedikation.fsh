Extension: ExtensionISiKSelbstmedikation
Id: ExtensionISiKSelbstmedikation
Title: "ISiK Selbstmedikation"
Description: "Extension zur Angabe, ob es sich bei der Medikation um eine Selbstmedikation handelt."
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* value[x] 1..
* value[x] only boolean
