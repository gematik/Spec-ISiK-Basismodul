Invariant: code-coding-icu
Description: "Es muss mindestens ein snomed oder loinc code vorhanden sein"
* severity = #error
* expression = "coding.exists() implies coding.where(system = 'http://snomed.info/sct').exists() or coding.where(system = 'http://loinc.org').exists()"
* source = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/score"