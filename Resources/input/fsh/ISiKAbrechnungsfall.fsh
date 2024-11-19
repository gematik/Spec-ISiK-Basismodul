Profile: ISiKAbrechnungsfall
Parent: Account
Id: ISiKAbrechnungsfall
Description: "Dieses Profil beschreibt die Gruppierung von medizinischen Leistungen in ISiK-Szenarien"
* insert Meta
* extension MS
* extension contains http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur named AbrechnungsDiagnoseProzedur 0..* MS
* extension[AbrechnungsDiagnoseProzedur]
  * ^comment = "In dieser Extension SOLL das 'Use' Element nur einfach verwendet werden, um eine eindeutige Zuweisung (1 zu N) gegenüber dem Element 'Referenz' zu gewährleisten."
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Abrechnungsnummer 1..1 MS
* identifier[Abrechnungsnummer] only IdentifierAbrechnungsnummer
  * ^patternIdentifier.type = $v2-0203#AN
  * type MS
  * system MS
  * value MS
* status MS
* type 1.. MS
* type from ISiKAccountType (required)
* subject only Reference(Patient)
* subject 1..1 MS
* coverage MS
  * extension 0..1 MS
  * extension contains http://fhir.de/StructureDefinition/ExtensionAbrechnungsart named Abrechnungsart 0..1 MS
  * coverage MS

Profile: IdentifierAbrechnungsnummer
Parent: Identifier
Id: identifier-abrechnungsnummer
Title: "Identifier-Profil für die Abbildung einer Abrechnungsnummer (\"Fallnummer\") "
Description: "Identifier-Profil für die Abbildung einer organisationsspezifischen Abrechnungsnummer (\"Fallnummer\")"
* insert Meta
* type 1..
* type = $v2-0203#AN
* type from ISiKAccountIdentifierType (required)
* system 1..
* value 1..

Instance: AbrechnungsfallDRG
InstanceOf: ISiKAbrechnungsfall
Usage: #example
* extension[+]
  * url = "http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur"
  * extension[+].url = "Use"
  * extension[=].valueCoding = http://fhir.de/CodeSystem/KontaktDiagnoseProzedur#hospital-main-diagnosis "Krankenhaus Hauptdiagnose"
  * extension[+].url = "Referenz"
  * extension[=].valueReference = Reference(Condition/DiagnoseSelteneErkrankung)
* identifier[Abrechnungsnummer]
  * system = "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer"
  * value = "0123456789"
* status = #active
* type = $v3-ActCode#IMP
* subject = Reference(PatientinMusterfrau)
* coverage
  * extension.url = "http://fhir.de/StructureDefinition/ExtensionAbrechnungsart"
  * extension.valueCoding = $Abrechnungsart#DRG "Diagnosebezogene Fallgruppen"
  * coverage = Reference(CoverageGesetzlich)
