
/*Dr. Anna von Müller, geboren Weber, 67 Jahre, mit der Diagnose primäre Gonarthrose, 
beidseitig (ICD M17.0), die durch ihre Orthopädin (Frau Dr. Peters) gestellt wurde,
möchte durch die geplante Implantation einer Knie-Endoprothese (OPS 5-822)
in einem spezialisierten Krankenhaus ihre Mobilität und Lebensqualität verbessern.*/


Instance: PatientinMinimal
InstanceOf: ISiKPatient
Usage: #example
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID" 
* identifier[Patientennummer].value = "TestPID1"
* name[0].use = #official
* name[=].family = "Müller"
* name[=].given = "Anna"
* gender = #female
* birthDate = "1957-08-12"