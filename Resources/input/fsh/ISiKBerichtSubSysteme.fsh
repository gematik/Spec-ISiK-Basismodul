Profile: ISiKBerichtSubSysteme
Parent: Composition
Id: ISiKBerichtSubSysteme
Description: "Dieses Profil ermöglicht die Krankenhaus-interne Übermittlung eines Berichtes in Form eines Dokumentes, die in ISiK Szenarien von Subsystemen an Primärsysteme gesendet werden."
* insert Meta
* text 1.. MS
  * status = #extensions (exactly)
  * status MS
  * div MS
* identifier 1.. MS
  * system 1.. MS
  * value 1.. MS
* status = #final (exactly)
* status MS
* type MS
* type.coding 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains
    LOINC 0..1 MS and
    KDL 0..1 MS and
    IHE 0..1 MS
* type.coding[LOINC] = $loinc#55112-7
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* type.coding[KDL] ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1..
  * system = "http://dvmd.de/fhir/CodeSystem/kdl" (exactly)
  * code 1..
    * obeys kdl-1
* type.coding[IHE] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode" (exactly)
  * code 1..
* category MS
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category.coding contains
    LOINC 0..1 MS and
    IHE 0..1 MS
* category.coding[LOINC].system 1..
* category.coding[LOINC].system = "http://loinc.org" (exactly)
* category.coding[LOINC].code 1..
* category.coding[IHE].system 1..
* category.coding[IHE].system = "http://ihe-d.de/CodeSystems/IHEXDSclassCode" (exactly)
* category.coding[IHE].code 1..
* subject 1.. MS
* subject only Reference(Patient)
  * reference 1.. MS
* encounter MS
* date MS
* author MS
* author only Reference(PractitionerRole or Device or Organization or RelatedPerson or Patient or Practitioner)
  * display 1.. MS
* title MS
* section 1.. MS
  * title 1.. MS
  * text 1.. MS
  * section MS

Instance: composition-blutdruck
InstanceOf: ISiKBerichtSubSysteme
Usage: #example
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">  <p> Familienname:Fürstin von Musterfrau</p>   <p> Geburtsdatum:1964-08-12</p>   <p> PID:TestPID</p>   <p> Bericht-Status:final</p>   <p> Bericht-Typ:Berichtzusammenfassung / Document Summary</p>   <p> Datum:03.05.2022</p>   <p> Titel:Blutdruckmessung vom 3.5.2022</p>   <p> Autor:Gerät XY, Fa. Z, Modell T</p></div>"
* identifier[0].type = $v2-0203#FILL
* identifier[=].system = "https://fhir.krankenhaus.example/sid/system-a/berichtnummer"
* identifier[=].value = "0123456789"
* status = #final
* type = $loinc#55112-7
* subject.reference = "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
* encounter.reference = "urn:uuid:74b46c1a-6fc9-11ed-a1eb-0242ac198765"
* date = "2022-05-03"
* author.type = "Device"
* author.display = "Gerät XY, Fa. Z, Modell T"
* title = "Blutdruckmessung vom 3.5.2022"
* section[0].title = "Messung"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b> Systolisch</b></td><td><b> Diastolisch</b></td><td><b> Einheit</b></td><td><b> Uhrzeit</b></td></tr><tr><td> \r\n\t\t\t\t\t\t\t140\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t110\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\tmmHG\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t17:15h\r\n\t\t\t\t\t\t</td></tr></table></div>"

Invariant: kdl-1
Description: "KDL-Code ungültig"
Severity: #warning
Expression: "matches('^[A-Z]{2}[0-9]{6}$')"