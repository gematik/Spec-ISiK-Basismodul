## Bundle MedikationTransaction [(Bundle)](https://www.hl7.org/fhir/R4/bundle.html)

Hinweis: Die Regeln aus dem Modul [ISiK Basis Stufe 4](https://simplifier.net/guide/isik-basis-v4) für die Verarbeitung Document-Bundles, treffen hier nicht zu, da es sich um den Bundle-Typ Transaction handelt.

---

### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction, hybrid}}

### Anmerkungen zu Must-Support-Feldern

@```from
	StructureDefinition
where
    url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction'
for differential.element
where mustSupport = true
  and short.exists()
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```

### Beispiele

Valides Beispiel für das Profil MedikationTransaction:

{{json:ExampleISiKMedikationTransaction}}

### Interaktionen

Transaction-Bundles werden nicht persistiert, sondern ausschließlich im Kontext von FHIR-Transaktionen verwendet, vgl. [FHIR RESTful API - Batch/Transaction](https://www.hl7.org/fhir/R4/http.html#transaction).
