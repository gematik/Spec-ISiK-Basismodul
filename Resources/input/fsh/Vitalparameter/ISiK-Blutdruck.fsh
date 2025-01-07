Profile: ISiKBlutdruckSystemischArteriell
Parent: VitalSignDE_Blutdruck
Id: ISiKBlutdruckSystemischArteriell
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Blutdruck eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).
### Motivation
Die Erfassung und Überwachung des Blutdrucks ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.

In FHIR wird der Blutdruck mit der Observation-Ressource repräsentiert, die einzelnen Komponenten des Blutdrucks werden als Component-Elemente abgebildet.

### Kompatibilität
Das Profil ISiKBlutdruckSystemischArteriell ist vom Profil [VitalSignDE_Blutdruck](http://fhir.de/StructureDefinition/observation-de-vitalsign-blutdruck) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Blood Pressure Profile](http://hl7.org/fhir/StructureDefinition/bp) aus der FHIR R4 Spezifikation."
* insert ISiKVitalsignCommons
* insert Observation-category-VSCat-MS
* code
  * coding contains IEEE11073 0..1
  * coding[IEEE11073] = $IEEE11073#150016
* component MS
  * insert Component-MS
  * dataAbsentReason MS
    * ^comment = "Motivation MS: Dieses Feld erlaubt die Angabe von Gründen für fehlende Untersuchungsergebnisse"
    * ^short = "Grund für fehlendes Untersuchungsergebniss"
* component[SystolicBP] MS
  * ^comment = "Motivation MS: Kodierung des systolischen Blutdrucks."
  * ^short = "Systolischer Blutdruck"
  * insert Quantity-MS
  * insert Component-Slice-MS
  * code
    * coding 
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
        IEEE11073 0..1 and
        SCT 0..1
    * coding[IEEE11073] = $IEEE11073#150017
    * coding[SCT] = $sct#271649006
* component[DiastolicBP] MS
  * ^comment = "Motivation MS: Kodierung des diastolischen Blutdrucks."
  * ^short = "Diastolischer Blutdruck"
  * insert Quantity-MS
  * insert Component-Slice-MS
  * code 
    * coding 
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
        IEEE11073 0..1 and
        SCT 0..1
    * coding[IEEE11073] = $IEEE11073#150018
    * coding[SCT] = $sct#271650006
  * dataAbsentReason MS
    * ^comment = "Motivation MS: Dieses Feld erlaubt die Angabe von Gründen für fehlende Untersuchungsergebnisse"
    * ^short = "Grund für fehlendes Untersuchungsergebniss"
* component[meanBP] MS
  * ^comment = "Motivation MS: Kodierung des mittleren arteriellen Drucks."
  * ^short = "Mittlerer arterieller Druck"
  * insert Quantity-MS
  * insert Component-Slice-MS
  * code
    * coding
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
        IEEE11073 0..1 and
        SCT 0..1
    * coding[IEEE11073] = $IEEE11073#150019
    * coding[SCT] = $sct#6797001

Instance: ISiKBlutdruckSystemischArteriellExample
InstanceOf: ISiKBlutdruckSystemischArteriell
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/bp"
* meta.profile[+] = "http://fhir.de/StructureDefinition/observation-de-vitalsign-blutdruck"
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
  * coding[snomed] = $sct#75367002 "Blood pressure (observable entity)"
  * coding[IEEE11073] = $IEEE11073#150016 "MDC_PRESS_BLD"
  * text = "Systolischer und Diastolischer Blutdruck"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2012-09-17"
* performer.reference = "Practitioner/example"
* interpretation = $v3-ObservationInterpretation#L "low"
* interpretation.text = "Below low normal"
* bodySite = $sct#368209003 "Right arm"
* component[SystolicBP]
  * code.coding[IEEE11073] = $IEEE11073#150017 "MDC_PRESS_BLD_SYS"
  * code.coding[SCT] = $sct#271649006 "Systolischer Blutdruck"
  * valueQuantity = 107 'mm[Hg]' "mmHg"
* component[DiastolicBP]
  * code.coding[IEEE11073] = $IEEE11073#150018 "MDC_PRESS_BLD_DIA"
  * code.coding[SCT] = $sct#271650006 "Diastolischer Blutdruck"
  * valueQuantity = 60 'mm[Hg]' "mmHg"
* component[meanBP]
  * code.coding[IEEE11073] = $IEEE11073#150019 "MDC_PRESS_BLD_MEAN"
  * code.coding[SCT] = $sct#6797001 "Mittlerer arterieller Druck"
  * valueQuantity = 80 'mm[Hg]' "mmHg"