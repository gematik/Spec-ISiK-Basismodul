Profile: ISiKDiagnose
Parent: Condition
Id: ISiKDiagnose
Description: "Dieses Profil ermöglicht die Nutzung von Diagnosen in ISiK Szenarien."
* insert Meta
* obeys isik-con1
* id MS
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains $condition-related named ReferenzPrimaerdiagnose 0..1 MS
* clinicalStatus MS
* code 1.. MS
  * obeys icd-text-1
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      ICD-10-GM 0..1 MS and
      Alpha-ID 0..1 MS and
      SNOMED-CT 0..1 MS and
      Orphanet 0..1 MS
  * coding[ICD-10-GM] only CodingICD10GM
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
    * extension[Mehrfachcodierungs-Kennzeichen] MS
    * extension[Seitenlokalisation] MS
    * extension[Diagnosesicherheit] MS
  * coding[Alpha-ID] only CodingAlphaID
    * ^patternCoding.system = "http://fhir.de/CodeSystem/alpha-id"
    * system 1.. MS
    * code 1.. MS
  * coding[SNOMED-CT] from $diagnoses-sct (required)
    * ^patternCoding.system = "http://snomed.info/sct"
    * system 1.. MS
    * code 1.. MS
  * coding[Orphanet] ^patternCoding.system = "http://www.orpha.net"
    * system 1.. MS
    * code 1..
* subject MS
  * reference 1.. MS
* encounter MS
* onset[x] only dateTime or Period
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #closed
* onsetPeriod only Period
  * ^sliceName = "onsetPeriod"
  * start.extension contains ExtensionLebensphase named Lebensphase-Start 0..1
  * end.extension contains ExtensionLebensphase named Lebensphase-Ende 0..1
* onsetDateTime only dateTime
  * ^sliceName = "onsetDateTime"
* recordedDate 1.. MS
* note MS

Instance: Example-condition-ausrufezeichen-sekundaer
InstanceOf: ISiKDiagnose
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(Example-condition-ausrufezeichen-primaer)
* clinicalStatus = $condition-clinical#recurrence
* code.coding.extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen#!
* code.coding.version = "2019"
* code.coding = $icd-10-gm#U69.32 "Intravenöser Konsum sonstiger psychotroper Substanzen"
* subject = Reference(Patient/example)
* encounter = Reference(Encounter/example)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-kreuz-stern-primaer
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#recurrence
* code.coding.extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension.valueCoding.version = "2021"
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen#†
* code.coding.version = "2019"
* code.coding = $icd-10-gm#E10.30 "Diabetes mellitus"
* subject = Reference(Patient/example)
* encounter = Reference(Encounter/example)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-kreuz-stern-sekundaer
InstanceOf: ISiKDiagnose
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(Example-condition-kreuz-stern-primaer)
* clinicalStatus = $condition-clinical#active
* code.coding.extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen#*
* code.coding.version = "2019"
* code.coding = $icd-10-gm#H36.0 "Retinopathia diabetica"
* subject = Reference(Patient/example)
* encounter = Reference(Encounter/example)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: condition
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#active
* code.coding.version = "2020"
* code.coding = $icd-10-gm#F71 "Mittelgradige Intelligenzminderung"
* subject = Reference(patient)
* encounter = Reference(Encounter/encounter01)
* onsetDateTime = "2019-09-02"
* recordedDate = "2020-10-14"

Invariant: isik-con1
Description: "Falls eine kodierte Diagnose vorliegt muss der dazugehörige Einrichtungskontakt angegeben werden"
Severity: #error
Expression: "code.coding.exists() implies encounter.exists()"

Invariant: icd-text-1
Description: "Entweder MUSS eine kodierte Diagnose vorliegen oder eine textuelle Beschreibung. Stattdessen nur Extensions hinzuzufügen (vgl. https://www.hl7.org/fhir/element.html - ele-1), ist explizit nicht erlaubt."
Severity: #error
Expression: "coding.exists().not() implies text.exists()"