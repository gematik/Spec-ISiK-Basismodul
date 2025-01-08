
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
* name[official].use = #official
* name[official].family = "Müller"
* name[official].family.extension[namenszusatz].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
* name[official].family.extension[namenszusatz].valueString = "Fürstin"
* name[official].family.extension[own-name].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[official].family.extension[own-name].valueString = "Müller"
* name[official].family.extension[own-prefix].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
* name[official].family.extension[own-prefix].valueString = "von"
* name[official].given = "Anna"
* name[official].prefix = "Dr."
* name[official].prefix.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name[official].prefix.extension.valueCode = #AC
* name[maiden].use = #maiden
* name[maiden].family = "Weber"
* name[maiden].family.extension[own-name].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[maiden].family.extension[own-name].valueString = "Weber"
* telecom[mobile].system = #phone
* telecom[mobile].value = "+49 170 1234567"
* telecom[mobile].use = #mobile
* telecom[mobile].rank = 1
* telecom[work].system = #email
* telecom[work].value = "anna.mueller@example.com"
* telecom[work].use = #work
* telecom[work].rank = 2
* gender = #female
* birthDate = "1957-08-12"
* deceasedBoolean = false
* address[home].type = #both
* address[home].line[0] = "Musterweg 2"
* address[home].line[1] = "3. Etage"
* address[home].line[0].extension[streetName].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[home].line[0].extension[streetName].valueString = "Musterweg"
* address[home].line[0].extension[houseNumber].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[home].line[0].extension[houseNumber].valueString = "2"
* address[home].line[1].extension[additionalLocator].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[home].line[1].extension[additionalLocator].valueString = "3. Etage"
* address[home].city = "Demmin"
* address[home].postalCode = "17109"
* address[home].country = "DE"
* address[postal].type = #postal
* address[postal].line = "Postfach 8 15"
* address[postal].line.extension[postBox].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address[postal].line.extension[postBox].valueString = "Postfach 8 15"
* address[postal].city = "Musterhausen"
* address[postal].postalCode = "98764"
* address[postal].country = "DE"
* maritalStatus = $v3-MaritalStatus#M
* multipleBirthBoolean = true
* multipleBirthInteger = 2
* photo.contentType = #image/jpeg
* photo.url = "https://example.com/patient-photo.jpg"
* contact[emergency].relationship = $v2-0131#EP
* contact[emergency].name.family = "Schmidt"
* contact[emergency].name.given = "Clara"
* contact[emergency].telecom.system = #phone
* contact[emergency].telecom.value = "+49 123 456789"
* communication[primary].language.coding[0].system = "urn:ietf:bcp:47"
* communication[primary].language.coding[0].code = #en-US
* communication[primary].language.coding[0].display = "American English"
* generalPractitioner[0] = Reference(Practitioner/1234)
/*Beispiel Practitioner evtl. erstellen*/
* managingOrganization = Reference(Organization/5678)
/*Beispiel Organization evtl. erstellen*/
* link[seealso].other = Reference(Patient/9876)
* link[seealso].type = #seealso