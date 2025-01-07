# ISiKGCS (Glasgow Coma Score)
Mit diesem Profil lässt sich ein Glasgow Coma Score (GCS) erfassen.

Alle bestätigungsrelevanten Systeme für dieses Modul, welche GCSs verwalten, MÜSSEN Ressourcen verarbeiten können, die zu diesem Profil konform sind.


## Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKGCS' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKGCS, hybrid}}

## Beispiele

Valides Minimalbeispiel für das Profil ISiKGCS:

{{json:ISiKGCSExample}}