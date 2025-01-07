Alias: $version = 4.0.1

RuleSet: Meta
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^version = $version
* ^date = "2024-12-12"

RuleSet: Meta-CapabilityStatementInformation
* status = #active
* experimental = false
* version = $version
* publisher = "gematik GmbH"
* date = "2024-12-12"
* implementationGuide = "https://gematik.de/fhir/Medikation/ImplementationGuide/ISiK-Medikation"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationInformation"

RuleSet: Meta-CapabilityStatementAMTS
* status = #active
* experimental = false
* version = $version
* publisher = "gematik GmbH"
* date = "2024-12-12"
* implementationGuide = "https://gematik.de/fhir/Medikation/ImplementationGuide/ISiK-Medikation"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationAMTS"

RuleSet: Meta-CapabilityStatementVerordnung
* status = #active
* experimental = false
* version = $version
* publisher = "gematik GmbH"
* date = "2024-12-12"
* implementationGuide = "https://gematik.de/fhir/ISiK/ImplementationGuide/ISiK-Medikation"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerordnung"

RuleSet: Meta-CapabilityStatementVerabreichung
* status = #active
* experimental = false
* version = $version
* publisher = "gematik GmbH"
* date = "2024-12-12"
* implementationGuide = "https://gematik.de/fhir/ISiK/ImplementationGuide/ISiK-Medikation"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichung"
