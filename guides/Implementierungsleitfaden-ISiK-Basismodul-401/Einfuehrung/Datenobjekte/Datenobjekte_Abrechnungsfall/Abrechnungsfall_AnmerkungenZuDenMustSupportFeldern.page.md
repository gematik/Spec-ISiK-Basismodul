---
topic: Account-MS
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall
---

### Anmerkungen zu Must-Support-Feldern

<fql>
from
	StructureDefinition
where 
    url = %canonical
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>

