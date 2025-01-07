Profile: ISiKAtemfrequenz
Parent: VitalSignDE_Atemfrequenz
Id: ISiKAtemfrequenz
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Atemfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Atemfrequenz ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.

In FHIR wird die Atemfrequenz mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKAtemfrequenz ist vom Profil [VitalSignDE_Atemfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-atemfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/resprate) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[snomed] = $sct#86290005
  * coding[IEEE11073] = $IEEE11073#151562

Instance: ISiKAtemfrequenzExample
InstanceOf: ISiKAtemfrequenz
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/resprate"
* meta.profile[+] = Canonical(VitalSignDE_Atemfrequenz)
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#9279-1 "Respiratory rate"
* code.coding[snomed] = $sct#86290005 "Respiratory rate (observable entity)"
* code.coding[IEEE11073] = $IEEE11073#151562 "MDC_RESP_RATE"
* code.text = "Atemfrequenz"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2019-07-02"
* valueQuantity = 26 '/min' "Atemzüge pro Minute"