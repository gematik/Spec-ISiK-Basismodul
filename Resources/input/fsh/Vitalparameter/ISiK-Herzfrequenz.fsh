Profile: ISiKHerzfrequenz
Parent: VitalSignDE_Herzfrequenz
Id: ISiKHerzfrequenz
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Herzfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Herzfrequenz ist essenziell für die frühzeitige Erkennung von Herz-Kreislauf-Problemen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird die Herzfrequenz mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKHerzfrequenz ist vom Profil [VitalSignDE_Herzfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-herzfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/heartrate) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[snomed] from ISiKHerzfrequenzSCTVS
  * coding[IEEE11073] = $IEEE11073#147842

ValueSet: ISiKHerzfrequenzSCTVS
Id: ISiKHerzfrequenzSCTVS
Title: "ISiKHerzfrequenzSCTVS"
Description: "ValueSet des Herzfrequenz SnomedCT Codes in ISiK"
* insert Meta
* $sct#364075005 "Herzfrequenz"

Instance: ISiKHerzfrequenzExample
InstanceOf: ISiKHerzfrequenz
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/heartrate"
* meta.profile[+] = Canonical(VitalSignDE_Herzfrequenz)
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.coding[snomed] = $sct#364075005 "Heart rate (observable entity)"
* code.coding[IEEE11073] = $IEEE11073#147842 "MDC_ECG_HEART_RATE"
* code.text = "Herzfrequenz"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2020-10-11"
* valueQuantity = 63 '/min' "per minute"