Profile: ISiKSauerstoffsaettigungArteriell
Parent: VitalSignDE_Arterielle_Sauerstoffsaettigung
Id: ISiKSauerstoffsaettigungArteriell
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die arterielle Sauerstoffsättigung eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der arteriellen Sauerstoffsättigung ist essenziell für die Beurteilung der respiratorischen Funktion, die Überwachung von Patienten mit Atemwegserkrankungen sowie die Unterstützung klinischer Entscheidungen, insbesondere in kritischen Versorgungssituationen.

In FHIR wird die arterielle Sauerstoffsättigung mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKSauerstoffsaettigungArteriell ist vom Profil [VitalSignDE_Arterielle_Sauerstoffsaettigung](http://fhir.de/StructureDefinition/observation-de-vitalsign-sauerstoffsaettigung) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Oxygen Saturation Profile](http://hl7.org/fhir/StructureDefinition/oxygensat) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#150324

Instance: ISiKSauerstoffsaettigungArteriellExample
InstanceOf: ISiKSauerstoffsaettigungArteriell
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/oxygensat"
* meta.profile[+] = Canonical(VitalSignDE_Arterielle_Sauerstoffsaettigung)
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#2708-6 "Oxygen saturation in Arterial blood"
* code.coding[snomed] = $sct#442476006 "Arterial oxygen saturation"
* code.coding[IEEE11073] = $IEEE11073#150324 "MDC_SAT_O2_ART"
* code.text = "Arterielle Sauerstoffsättigung"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2020-10-11"
* valueQuantity = 98 '%' "%"
* component[0].code.coding[0] = $loinc#3151-8 "Inhaled oxygen flow rate"
* component[=].code.coding[+] = $sct#427081008 "Delivered oxygen flow rate"
* component[=].code.text = "Sauerstoffflussrate"
* component[=].valueQuantity = 2 'L/min' "Liter pro Minute"
* component[+].code.coding[0] = $loinc#3150-0 "Inhaled oxygen concentration"
* component[=].code.coding[+] = $sct#250774007 "Inspired oxygen concentration"
* component[=].code.text = "Inspiratorische Sauerstoffkonzentration"
* component[=].valueQuantity = 50 '%' "%"