Extension: ExtensionISiKAcceptedRisk
Id: ExtensionISiKAcceptedRisk
Title: "ISiK Accepted Risk"
Description: "Extension zur Dokumentation eines im Rahmen der AMTS bewusst eingegangenen Risikos. In diesem Freitext kann die Begründung und ggf. zu treffende besondere Maßnahmen dokumentiert werden."
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "RiskAssessment"
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* value[x] 1..
* value[x] only string
