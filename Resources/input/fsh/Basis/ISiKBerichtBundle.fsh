Profile: ISiKBerichtBundle
Parent: Bundle
Id: ISiKBerichtBundle
Title: "ISiKBerichtBundle"
Description: "A document style representation of the receipt (complete, self-contained, signed)"
* insert Meta
* obeys ISiK-docBundle-1
* type = #document (exactly)
* type MS
* timestamp 1.. MS
* identifier 1.. MS
* entry MS
  * fullUrl 1..1 MS
  * resource 1..1 MS
  * search 0..0
  * request 0..0
  * response 0..0
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #open
* entry contains Composition 1..1 MS
* entry[Composition].resource only ISiKBerichtSubSysteme

Instance: ISiKBundle-Example
InstanceOf: ISiKBerichtBundle
Usage: #example
Title: "Bundle-Beispiel-Blutdruck"
Description: "Beispiel für ein Bundle mit Composition Blutdruck, das folgende User Story repräsentiert: Die Patientin von Musterfrau war vom 3. bis 5. Mai 2022 als stationärer Fall anlässlich einer geplanten Operation im Krankenhaus. Dabei wurde am 3. Mai der Blutdruck gemessen und das Ergebnis in einem Peripheriesystem vermerkt. Das Peripheriesystem sendet das Messergebnis an das KIS, so dass das KIS dieses in die Gesamtdokumentation zur Patientin aufnehmen kann."
* identifier[0].type = $v2-0203#FILL
* identifier[=].system = "https://fhir.krankenhaus.example/sid/subsystem-a/berichtbundlenummer"
* identifier[=].value = "0123456789"
* timestamp = "2022-05-03T17:57:34+01:00"
* entry[0].resource = composition-blutdruck
* entry[=].fullUrl = "urn:uuid:74b471ba-6fc9-11ed-a1eb-0242ac120002"
* entry[+].resource = PatientinMusterfrauMinimal
* entry[=].fullUrl = "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
* entry[+].resource = FachabteilungskontaktMinimal
* entry[=].fullUrl = "urn:uuid:74b46c1a-6fc9-11ed-a1eb-0242ac198765"


Instance: PatientinMusterfrauMinimal
InstanceOf: Patient
Usage: #example
Description: "Minimalbeispiel für Patientin Musterfrau "
* identifier[0].type = $v2-0203#MR
* identifier[=].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[=].value = "TestPID"
* name[0].use = #official
* name[=].family = "Fürstin von Musterfrau"
* name[=].given = "Erika"
* name[=].prefix = "Dr."
* gender = #female
* birthDate = "1964-08-12"

Instance: FachabteilungskontaktMinimal
InstanceOf: Encounter
Usage: #example
* identifier.type = $v2-0203#VN
* identifier.system = "https://test.krankenhaus.de/fhir/sid/besuchsnummer"
* identifier.value = "0123456789"
* status = #unknown
* class = $v3-ActCode#IMP
* type[0] = $Kontaktart-de#operation
* type[+] = $Kontaktebene#abteilungskontakt
* serviceType = $FachabteilungsschluesselCS#0100
* subject.reference = "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
* period.start = "2022-05-03"
* period.end = "2022-05-05"

Invariant: ISiK-docBundle-1
Description: "All referenced Resources must be contained in the Bundle"
Severity: #error
Expression: "Bundle.entry.descendants().reference.distinct().subsetOf(%context.entry.fullUrl)"