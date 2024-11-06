---
topic: Extension-FQL-Beschreibung
---

<fql output="inline">
using scope
        from
	        StructureDefinition
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>