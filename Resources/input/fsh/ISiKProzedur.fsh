Profile: ISiKProzedur
Parent: Procedure
Id: ISiKProzedur
Description: "Diese Profil ermöglicht die Nutzung von Prozedur-bezogenen Informationen in ISiK Szenarien."
* insert Meta
* obeys proc-ISiK-1 and proc-ISiK-2
* . ^constraint[5].source = Canonical(ISiKProzedur)
* id MS
* extension MS
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains ExtensionProzedurDokumentationsdatum named Dokumentationsdatum 0..1 MS
* status MS
* category MS
  * coding ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains SNOMED-CT 0..1 MS
  * coding[SNOMED-CT] from $ProzedurenKategorieSCT (preferred)
    * system 1.. MS
    * system = "http://snomed.info/sct"
    * code 1.. MS
* code MS
  * obeys sct-ops-1 and proc-ISiK-3
  * ^constraint[1].source = Canonical(ISiKProzedur)
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains
      OPS 0..1 MS and
      SNOMED-CT 0..1 MS
  * coding[OPS] only CodingOPS
  * coding[OPS] from OpsVS (required)
    * extension[Seitenlokalisation] MS
    * system MS
    * version MS
    * code MS
  * coding[SNOMED-CT] from $ProzedurenCodesSCT (required)
    * system 1.. MS
    * system = "http://snomed.info/sct"
    * code 1.. MS
  * text MS
* subject MS
  * reference 1.. MS
* encounter MS
* performed[x] 1.. MS
* performed[x] only dateTime or Period
* note MS

Instance: Appendektomie
InstanceOf: ISiKProzedur
Usage: #example
* extension.url = "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum"
* extension.valueDateTime = "2020-04-23"
* status = #completed
* category = $sct#387713003 "Surgical procedure (procedure)"
* code.coding[0] = $sct#80146002 "Excision of appendix (procedure)"
* code.coding[+].version = "2020"
* code.coding[=] = $ops#5-470 "Appendektomie"
* code.text = "Entfernung des Blinddarms"
* subject = Reference(PatientinMusterfrau)
* performedDateTime = "2020-04-23"
* note.text = "Testnotiz"

Invariant: proc-ISiK-1
Description: "Falls die Prozedur per OPS kodiert wird, MUSS eine SNOMED-CT kodierte Category abgebildet werden"
Severity: #error
Expression: "code.coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists() implies category.coding.where(system = 'http://snomed.info/sct').exists()"

Invariant: proc-ISiK-2
Description: "Falls eine codierte Prozedur vorliegt MUSS eine kodierte Category abgebildet werden"
Severity: #error
Expression: "code.coding.exists() implies category.coding.exists()"

Invariant: sct-ops-1
Description: "Falls die Prozedur kodiert vorliegt, SOLL mindestens ein OPS oder SNOMED-CT Code angegeben werden. Liegt die Prozedur nicht kodiert vor SOLL Freitext angegeben werden."
Severity: #error
Expression: "coding.exists() implies coding.where(system = 'http://snomed.info/sct').exists() or coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists()"

Invariant: proc-ISiK-3
Description: "Entweder MUSS eine kodierte Prozedur vorliegen oder eine textuelle Beschreibung. Stattdessen nur Extensions hinzuzufügen (vgl. https://www.hl7.org/fhir/element.html - ele-1), ist explizit nicht erlaubt."
Severity: #error
Expression: "coding.exists().not() implies text.exists()"