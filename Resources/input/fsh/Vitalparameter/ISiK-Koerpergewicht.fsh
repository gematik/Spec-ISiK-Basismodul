Profile: ISiKKoerpergewicht
Parent: VitalSignDE_Koerpergewicht
Id: ISiKKoerpergewicht
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über das Körpergewicht eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung des Körpergewichts ist essenziell für die Beurteilung des Ernährungszustands, die Überwachung von Veränderungen im Rahmen der Therapie sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird das Körpergewicht mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKoerpergewicht ist vom Profil [VitalSignDE_Koerpergewicht](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergewicht) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Weight Profile](http://hl7.org/fhir/StructureDefinition/bodyweight) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[snomed] from ISiKKoerpergewichtSCTVS
  * coding[IEEE11073] = $IEEE11073#188736

ValueSet: ISiKKoerpergewichtSCTVS
Id: ISiKKoerpergewichtSCTVS
Title: "ISiKKoerpergewichtSCTVS"
Description: "ValueSet des Körpergewichts SnomedCT Codes in ISiK"
* insert Meta
* $sct#27113001 "Körpergewicht"

Instance: ISiKKoerpergewichtExample
InstanceOf: ISiKKoerpergewicht
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/bodyweight"
* meta.profile[+] = Canonical(VitalSignDE_Koerpergewicht)
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.coding[snomed] = $sct#27113001 "Body weight"
* code.coding[IEEE11073] = $IEEE11073#188736 "MDC_MASS_BODY_ACTUAL"
* code.text = "Körpergewicht"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2020-10-11"
* valueQuantity = 79 'kg' "kilogram"