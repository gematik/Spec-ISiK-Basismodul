
/*Dr. Anna von Müller, geboren Weber, 67 Jahre, mit der Diagnose primäre Gonarthrose, 
beidseitig (ICD M17.0), die durch ihre Orthopädin (Frau Dr. Peters) gestellt wurde,
möchte durch die geplante Implantation einer Knie-Endoprothese (OPS 5-822)
in einem spezialisierten Krankenhaus ihre Mobilität und Lebensqualität verbessern.*/


Instance: PatientinAusfuehrlich
InstanceOf: ISiKPatient
Usage: #example
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID" 
* identifier[Patientennummer].value = "TestPID1"
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
* gender = #female
* birthDate = "1957-08-12"
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
* link[0].other = Reference(Patient/9876)
* link[0].type = #seealso