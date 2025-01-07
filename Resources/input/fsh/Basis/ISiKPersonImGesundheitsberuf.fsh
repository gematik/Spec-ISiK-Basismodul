Profile: ISiKPersonImGesundheitsberuf
Parent: Practitioner
Id: ISiKPersonImGesundheitsberuf
Description: "Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien.
### Motivation

Das Profil ISIKPersonImGesundheitsberuf bildet alle denkbaren medizinischen Leistungserbringer und Fachexperten  ab. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element `performer` der Procedure Ressource, oder als die Person, die eine Diagnose stellt, im Element `asserter` der Condition Ressource.

In FHIR werden PersonImGesundheitsberuf mit der [`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource
 repräsentiert.  
 Für das Profil ISIKPersonImGesundheitsberuf wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:
* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner). 
* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control der  Medizininformatik Initiative ](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* obeys prac-de-1
* . ^constraint[5].source = Canonical(ISiKPersonImGesundheitsberuf)
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    Arztnummer 0..* MS and
    EFN 0..1 MS and
    TelematikId 0..1 MS
* identifier[Arztnummer] only IdentifierLanr
  * ^short = "Lebenslange Arztnummer"
  * ^comment = " Im Krankenhaus ist die lebenslange Arztnummer der Ärzte bekannt und MUSS zur eindeutigen Identifikation eines Arztes bereitgestellt werden.
**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/LebenslangeArztnummerLANR-Identifier.html)
Während die Deutschen Basisprofile hier die Abkürzung LANR verwenden, ist im KBV-Kontext das Akronym ANR gebräuchlich. Die Bezeichnung des Slices hat jedoch keinerlei Auswirkungen auf die Kompatibilität."
  * ^patternIdentifier.type = $v2-0203#LANR
  * type 1..
* identifier[EFN] only IdentifierEfn
  * ^patternIdentifier.type = $v2-0203#DN
  * type 1..
  * ^comment = "In bestimmten KIS wird keine EFN geführt, da diese aus Compliance-Gründen getrennt in HR-Systemen vorgehalten wird (Hinweis kam von Stakeholder), daher soll der entsprechende Test im Test-System mit \"warningOnly\" ausgegeben werden." 
  // Dennoch soll das MS im Profil enthalten sein: das war laut gefyra eine KBV-Anforderung [Stand 9.12.2022].
* identifier[TelematikId] only IdentifierTelematikId
  * ^patternIdentifier.type = $v2-0203#PRN
  * type 1..
* name MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* name contains
    Name 1..1 MS and
    Geburtsname 0..1
* name[Name] only HumannameDeBasis
  * ^short = "Vollständiger Name"
  * ^comment = "Der Name des Arztes MUSS in konkreten Anwendungen angezeigt werden können. Es MUSS nach dem Namen des Arztes gesucht werden können."
  * ^patternHumanName.use = #official
  * use 1.. MS
  * use = #official (exactly)
  * family 1.. MS
  * given 1.. MS
  * prefix MS
* name[Geburtsname] only HumannameDeBasis
  * ^patternHumanName.use = #maiden
  * use 1.. MS
  * use = #maiden (exactly)
  * family 1..
  * given ..0
  * prefix ..0
* telecom.system 1..
* telecom.value 1..
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * ^short = "Postfachanschrift"
  * ^comment = "Ist die Postfachadresse bekannt, unter der ein Arzt erreichbar ist, MUSS sie bereitgestellt werden."
  * ^patternAddress.type = #postal
  * type 1.. MS
  * line 1.. MS
  //VSDM-Extensions WARUM? 
    * extension[Strasse] 0..0
    * extension[Hausnummer] 0..0
    * extension[Adresszusatz] 0..0
    * extension[Postfach] 0..1 MS
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* address[Strassenanschrift] only AddressDeBasis
  * ^short = "Straßenanschrift"
  * ^comment = "Ist die Adresse bekannt, unter der ein Arzt erreichbar ist, MUSS sie bereitgestellt werden."
  * extension[Stadtteil] MS
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
  //VSDM-Extensions WARUM? 
    * extension[Strasse] 0..1 MS
    * extension[Hausnummer] 0..1 MS
    * extension[Adresszusatz] 0..1 MS
    * extension[Postfach] 0..0
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* gender MS
  * ^short = "Administratives Geschlecht"
  * ^short = "Ist das Geschlecht des Arztes bekannt, MUSS es bereitgestellt werden."
  //Extension WARUM?
  * extension contains GenderOtherDE named Geschlecht-Administrativ 0..1 MS
  * extension[Geschlecht-Administrativ].value[x] MS
  //Slicing kann weg weil implizit:
* birthDate.extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
  //WAS? WIESO Data-Absent-Reason!? Das Element ist doch optional! Es ist nichtmal MS!!
* birthDate.extension contains $data-absent-reason named Data-Absent-Reason 0..1 MS
//Achtung, VZD weicht hier ab: https://simplifier.net/vzd-fhir-directory/practitionerqualificationvs
* qualification.code ^comment = "Zur Kodierung der Qualifikation ist das entsprechende [ValueSet der KBV](https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality) zu empfehlen."



Instance: PractitionerWalterArzt
InstanceOf: ISiKPersonImGesundheitsberuf
Usage: #example
* meta.source = "http://krankenhaus.de"
* identifier[0].type = $v2-0203#LANR
* identifier[=].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier[=].value = "123456789"
* identifier[+].type = $v2-0203#DN
* identifier[=].system = "http://fhir.de/sid/bundesaerztekammer/efn"
* identifier[=].value = "123456789123456"
* active = true
* name[Name]
  * text = "Walter Arzt"
  * family = "Arzt"
    * extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    * extension.valueString = "Arzt"
  * given = "Walter"
* name[Geburtsname]
  * text = "Gross"
  * family = "Gross"
    * extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    * extension.valueString = "Gross"
* address.type = #both
* address.line = "Schmiedegasse 16"
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * extension[=].valueString = "16"
  * extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * extension[=].valueString = "Schmiedegasse"
* address.city = "Potsdam"
* address.postalCode = "14469"
* address.country = "DE"
* gender = #male
* birthDate.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* birthDate.extension.valueCode = #masked
* qualification.code.coding.version = "http://snomed.info/sct/900000000000207008/version/20200131"
* qualification.code.coding = $sct#112247003 "Medical doctor (occupation)"

Invariant: prac-de-1
Description: "Die amtliche Differenzierung der Geschlechtsangabe 'other' darf nur gefüllt sein, wenn das Geschlecht 'other' angegeben ist"
Severity: #error
Expression: "gender='other' or gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').empty()"