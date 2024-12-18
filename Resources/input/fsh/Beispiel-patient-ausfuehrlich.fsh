
/*Dr. Fürstin Anna von Müller, geboren Weber, 67 Jahre, mit der Diagnose primäre Gonarthrose, 
beidseitig (ICD M17.0), die durch ihre Orthopädin (Frau Dr. Peters) gestellt wurde,
möchte durch die geplante Implantation einer Knie-Endoprothese (OPS 5-822)
in einem spezialisierten Krankenhaus ihre Mobilität und Lebensqualität verbessern.*/


Instance: PatientinAusfuehrlich
InstanceOf: ISiKPatient
Usage: #example
* identifier[0].type = $v2-0203#MR
* identifier[=].system = "https://fhir.krankenhaus.example/sid/PID" 
/*Link funktioniert nicht*/
* identifier[=].value = "TestPID1"
/*PID?*/
* identifier[+].type = $identifier-type-de-basis#GKV
/*GKV retired? https://simplifier.net/packages/de.basisprofil.r4/1.5.1-beta1/files/2680552 */
* identifier[=].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "A1234567890"
* active = true
* name[0].use = #official
* name[=].family = "Müller"
* name[=].family.extension[0].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
* name[=].family.extension[=].valueString = "Fürstin"
* name[=].family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[=].family.extension[=].valueString = "Müller"
* name[=].family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
* name[=].family.extension[=].valueString = "von"
* name[=].given = "Anna"
* name[=].prefix = "Dr."
* name[=].prefix.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name[=].prefix.extension.valueCode = #AC
* name[+].use = #maiden
* name[=].family = "Weber"
* name[=].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[=].family.extension.valueString = "Weber"
* telecom[0].system = "phone"
* telecom[0].value = "+49 170 1234567"
* telecom[0].use = "mobile"
* telecom[0].rank = 1
* telecom[1].system = "email"
* telecom[1].value = "anna.mueller@example.com"
* telecom[1].use = "work"
* telecom[0].rank = 2
* gender = #female
* birthDate = "1957-08-12"
* deceasedBoolean = false
* address[0].type = #both
* address[=].line[0] = "Musterweg 2"
* address[=].line[+] = "3. Etage"
* address[=].line[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[=].line[=].extension[=].valueString = "Musterweg"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[=].line[=].extension[=].valueString = "2"
* address[=].line[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[=].line[=].extension.valueString = "3. Etage"
* address[=].city = "Demmin"
* address[=].postalCode = "17109"
* address[=].country = "DE"
* address[+].type = #postal
* address[=].line = "Postfach 8 15"
* address[=].line.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address[=].line.extension.valueString = "Postfach 8 15"
* address[=].city = "Musterhausen"
* address[=].postalCode = "98764"
* address[=].country = "DE"
* maritalStatus = $v3-MaritalStatus#M
* multipleBirth = true
* multipleBirth = 2
* photo.contentType = "image/jpeg"
* photo.url = "https://example.com/patient-photo.jpg"
* contact[0].relationship = $v2-0131#EP
* contact[0].name.family = "Schmidt"
* contact[0].name.given = "Clara"
* contact[0].telecom.system = "phone"
* contact[0].telecom.value = "+49 123 456789"
* communication[0].language.coding[0].system = "urn:ietf:bcp:47"
* communication[0].language.coding[0].code = "en-US"
* communication[0].language.coding[0].display = "American English"
* generalPractitioner[0] = Reference(Practitioner/1234)
/*Beispiel Practitioner evtl. erstellen*/
* managingOrganization = Reference(Organization/5678)
/*Beispiel Organization evtl. erstellen*/
* link[0].other = Reference(Patient/9876)
* link[0].type = #seealso

Invariant: isik-pat-1
Description: "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden"
Severity: #error
Expression: "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()"

Invariant: address-cnt-2or3-char
Description: "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2."
Severity: #warning
Expression: "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))"
