
/*Dr. Anna von Müller, geboren Weber, 67 Jahre, mit der Diagnose primäre Gonarthrose, 
beidseitig (ICD M17.0), die durch ihre Orthopädin (Frau Dr. Peters) gestellt wurde,
möchte durch die geplante Implantation einer Knie-Endoprothese (OPS 5-822)
in einem spezialisierten Krankenhaus ihre Mobilität und Lebensqualität verbessern.*/


Instance: PatientinNormal
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].type = $identifier-type-de-basis#KVZ10
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A1234567890"
* identifier[VersichertenId-GKV].type = $identifier-type-de-basis#KVZ10
* identifier[VersichertenId-GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId-GKV].value = "A1234567890"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID" 
* identifier[Patientennummer].value = "TestPID1"
* active = true
* name[0].use = #official
* name[=].family = "Müller"
* name[=].given = "Anna"
* name[=].prefix = "Dr."
* name[+].use = #maiden
* name[=].family = "Weber"
* gender = #female
* birthDate = "1957-08-12"
* address[0].type = #physical
* address[=].line = "Musterweg 2"
* address[=].city = "Demmin"
* address[=].postalCode = "17109"
* address[=].country = "DE"
* address[+].type = #postal
* address[=].line = "Postfach 815"
* address[=].city = "Musterhausen"
* address[=].postalCode = "98764"
* address[=].country = "DE"
* link[0].other = Reference(Patient/9876)
* link[=].type = #seealso