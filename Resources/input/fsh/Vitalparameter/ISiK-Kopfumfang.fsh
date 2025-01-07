Profile: ISiKKopfumfang
Parent: VitalSignDE_Kopfumfang
Id: ISiKKopfumfang
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Kopfumfang eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung des Kopfumfangs ist essenziell für die Beurteilung von Wachstumsprozessen, insbesondere bei Säuglingen und Kleinkindern, sowie für die frühzeitige Erkennung von Entwicklungsauffälligkeiten oder neurologischen Erkrankungen.

In FHIR wird der Kopfumfang mit der Observation-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKKopfumfang ist vom Profil [VitalSignDE_Kopfumfang](http://fhir.de/StructureDefinition/observation-de-vitalsign-kopfumfang) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Head Circumference Profile](
http://hl7.org/fhir/StructureDefinition/headcircum) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Quantity-MS
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[snomed] from ISiKKopfumfangSCTVS
  * coding[IEEE11073] = $IEEE11073#153856
* valueQuantity.code = #cm


ValueSet: ISiKKopfumfangSCTVS
Id: ISiKKopfumfangSCTVS
Title: "ISiKKopfumfangSCTVS"
Description: "ValueSet des Kopfumfang SnomedCT Codes in ISiK"
* insert Meta
* $sct#363812007 "Kopfumfang"

Instance: ISiKKopfumfangExample
InstanceOf: ISiKKopfumfang
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/headcircum"
* meta.profile[+] = Canonical(VitalSignDE_Kopfumfang)
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#9843-4 "Head Occipital-frontal circumference"
* code.coding[snomed] = $sct#363812007 "Head circumference (observable entity)"
* code.coding[IEEE11073] = $IEEE11073#153856 "MDC_CIRCUM_HEAD"
* code.text = "Kopfumfang"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2019-07-02"
* valueQuantity = 38 'cm' "Centimeter"