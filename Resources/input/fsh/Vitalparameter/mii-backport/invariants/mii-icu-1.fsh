Invariant: mii-icu-1
Description: "If there is no Observation.value, a dataAbsentReason must be given."
* severity = #error
* expression = "value.exists().not() implies dataAbsentReason.exists()"
* source = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/score"