Profile: ISiKValueSet
Parent: ValueSet
Id: ISiKValueSet
Description: "Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien"
* insert Meta
* url 1.. MS
* version 1.. MS
* name 1.. MS
* status MS
* useContext 1.. MS
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.value[x] only CodeableConcept
* useContext.value[x] from ResourceType (required)
* useContext.value[x] ^binding.description = "One of the resource types defined as part of this version of FHIR."
* expansion 1.. MS
* expansion.timestamp MS
* expansion.contains 1.. MS
* expansion.contains.system 1.. MS
* expansion.contains.version 1.. MS
* expansion.contains.code 1.. MS
* expansion.contains.display 1.. MS

Instance: ISiKValueSetExample
InstanceOf: ISiKValueSet
Usage: #example
* url = "http://example.org/fhir/ValueSet/TestValueSet"
* version = "2.0.2"
* name = "TestValueSet"
* status = #active
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.valueCodeableConcept = http://hl7.org/fhir/resource-types#Encounter
* expansion.timestamp = "2022-03-30"
* expansion.contains.system = "http://example.org/fhir/CodeSystem/TestKatalog"
* expansion.contains.version = "1.0.0"
* expansion.contains.code = #test
* expansion.contains.display = "Test"