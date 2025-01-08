
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
* name[official].use = #official
* name[official].family = "Müller"
* name[official].family.extension[0].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
* name[official].family.extension[0].valueString = "Fürstin"
* name[official].family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[official].family.extension[=].valueString = "Müller"
* name[official].family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
* name[official].family.extension[=].valueString = "von"
* name[official].given = "Anna"
* name[official].prefix = "Dr."
* name[official].prefix.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name[official].prefix.extension.valueCode = #AC
* name[maiden].use = #maiden
* name[maiden].family = "Weber"
* name[maiden].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[maiden].family.extension.valueString = "Weber"
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
* address[home].type = #both
* address[home].line[0] = "Musterweg 2"
* address[home].line[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[home].line[=].extension[=].valueString = "Musterweg"
* address[home].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[home].line[=].extension[=].valueString = "2"
* address[home].line[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[home].line[=].extension.valueString = "3. Etage"
* address[home].city = "Demmin"
* address[home].postalCode = "17109"
* address[home].country = "DE"
* address[postal].type = #postal
* address[postal].line = "Postfach 8 15"
* address[postal].line.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address[postal].line.extension.valueString = "Postfach 8 15"
* address[postal].city = "Musterhausen"
* address[postal].postalCode = "98764"
* address[postal].country = "DE"
* maritalStatus = $v3-MaritalStatus#M
* multipleBirthBoolean = true
* multipleBirthInteger = 2
* photo.contentType = #image/jpeg
* contact[primary].relationship = $v2-0131#EP
* contact[primary].name.family = "Schmidt"
* contact[primary].name.given = "Clara"
* contact[primary].telecom.system = #phone
* contact[primary].telecom.value = "+49 123 456789"
* communication[preferred].language.coding[0].system = "urn:ietf:bcp:47"
* communication[preferred].language.coding[0].code = #en-US
* generalPractitioner[gp] = Reference(Practitioner/1234)
/*Beispiel Practitioner evtl. erstellen*/
* managingOrganization = Reference(Organization/5678)
/*Beispiel Organization evtl. erstellen*/
* link[seealso].other = Reference(Patient/9876)
* link[seealso].type = #seealso