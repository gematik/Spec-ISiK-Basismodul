
/*Dr. Anna von Müller, geboren Weber, 67 Jahre, mit der Diagnose primäre Gonarthrose, 
beidseitig (ICD M17.0), die durch ihre Orthopädin (Frau Dr. Peters) gestellt wurde,
möchte durch die geplante Implantation einer Knie-Endoprothese (OPS 5-822)
in einem spezialisierten Krankenhaus ihre Mobilität und Lebensqualität verbessern.*/


Instance: PatientinAusfuehrlich
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].type = $identifier-type-de-basis#KVZ10
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A1234567890"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID" 
* identifier[Patientennummer].value = "TestPID1"
* active = true
* name[0].use = #official
* name[0].family = "Müller"
* name[0].family.extension[0].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
* name[0].family.extension[0].valueString = "Fürstin"
* name[0].family.extension[1].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[0].family.extension[1].valueString = "Müller"
* name[0].family.extension[2].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
* name[0].family.extension[2].valueString = "von"
* name[0].given = "Anna"
* name[0].prefix = "Dr."
* name[0].prefix.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name[0].prefix.extension[0].valueCode = #AC
* name[1].use = #maiden
* name[1].family = "Weber"
* name[1].family.extension[0].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[1].family.extension[0].valueString = "Weber"
* telecom[0].system = #phone
* telecom[0].value = "+49 170 1234567"
* telecom[0].use = #mobile
* telecom[0].rank = 1
* telecom[1].system = #email
* telecom[1].value = "anna.mueller@example.com"
* telecom[1].use = #work
* telecom[1].rank = 2
* gender = #female
* birthDate = "1957-08-12"
* deceasedBoolean = false
* address[0].type = #both
* address[=].line[0] = "Musterweg 2"
* address[=].line[+] = "3. Etage"
* address[=].line[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[=].line[=].extension[0].valueString = "Musterweg"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[=].line[=].extension[+].valueString = "2"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[=].line[=].extension[+].valueString = "3. Etage"
* address[=].city = "Demmin"
* address[=].postalCode = "17109"
* address[=].country = "DE"
* address[+].type = #postal
* address[=].line[0] = "Postfach 8 15"
* address[=].line[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address[=].line[=].extension[0].valueString = "Postfach 8 15"
* address[=].city = "Musterhausen"
* address[=].postalCode = "98764"
* address[=].country = "DE"
* maritalStatus = $v3-MaritalStatus#M
* multipleBirthBoolean = true
* multipleBirthInteger = 2
* photo.contentType = #image/jpeg
* photo.url = "https://example.com/patient-photo.jpg"
* contact[0].relationship = $v2-0131#EP
* contact[0].name.family = "Schmidt"
* contact[0].name.given = "Clara"
* contact[0].telecom.system = #phone
* contact[0].telecom.value = "+49 123 456789"
* communication[0].language.coding[0].system = "urn:ietf:bcp:47"
* communication[0].language.coding[0].code = #en-US
* communication[0].language.coding[0].display = "American English"
* generalPractitioner[0] = Reference(Practitioner/1234)
/*Beispiel Practitioner evtl. erstellen*/
* managingOrganization = Reference(Organization/5678)
/*Beispiel Organization evtl. erstellen*/
* link[0].other = Reference(Patient/9876)
* link[0].type = #seealso