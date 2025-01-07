Profile: ISiKKoerpergroesse
Parent: VitalSignDE_Koerpergroesse
Id: ISiKKoerpergroesse
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.

In FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKoerpergroesse ist vom Profil [VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[snomed] from ISiKKoerpergroesseSCTVS
  * coding[IEEE11073] = $IEEE11073#188740

ValueSet: ISiKKoerpergroesseSCTVS
Id: ISiKKoerpergroesseSCTVS
Title: "ISiKKoerpergroesseSCTVS"
Description: "ValueSet des Körpergroesse SnomedCT Codes in ISiK"
* insert Meta
* $sct#1153637007 "Body height"

Instance: ISiKKoerpergroesseExample
InstanceOf: ISiKKoerpergroesse
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/bodyheight"
* meta.profile[+] = Canonical(VitalSignDE_Koerpergroesse)
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.coding[snomed] = $sct#1153637007 "Body height (observable entity)"
* code.coding[IEEE11073] = $IEEE11073#188740 "MDC_LEN_BODY_ACTUAL"
* code.text = "Körpergröße"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2020-10-11"
* valueQuantity = 174 'cm' "centimeter"