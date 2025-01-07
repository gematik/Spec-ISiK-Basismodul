Profile: ISiKKoerpertemperatur
Parent: VitalSignDE_Koerpertemperatur
Id: ISiKKoerpertemperatur
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpertemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKoerpertemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[snomed] from ISiKKoerpertemperaturSCTVS
  * coding[IEEE11073] = $IEEE11073#150364

ValueSet: ISiKKoerpertemperaturSCTVS
Id: ISiKKoerpertemperaturSCTVS
Title: "ISiKKoerpertemperaturSCTVS"
Description: "ValueSet des Körpergewicht SnomedCT Codes in ISiK"
* insert Meta
* $sct#386725007 "Body temperature (observable entity)"

Instance: ISiKKoerpertemperaturExample
InstanceOf: ISiKKoerpertemperatur
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/bodytemp"
* meta.profile[+] = Canonical(VitalSignDE_Koerpertemperatur)
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.coding[snomed] = $sct#386725007 "Body temperature (observable entity)"
* code.coding[IEEE11073] = $IEEE11073#150364 "MDC_TEMP_BODY"
* code.text = "Körpertemperatur"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2020-10-11"
* valueQuantity = 36.8 'Cel' "°C"