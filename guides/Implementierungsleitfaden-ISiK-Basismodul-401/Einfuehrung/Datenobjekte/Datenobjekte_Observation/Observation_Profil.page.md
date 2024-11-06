---
topic: ImplementationGuide-markdown-Observation-Observation-Profil
---
### Profil

#### ISiKLebenszustand

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKLebenszustand' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKLebenszustand, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKLebenszustand' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKLebenszustand' )
for differential.element
select
Path: path,
join binding.where(valueSet.exists())
{
  Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
  Strength: strength,
  URL: valueSet
}
```

----