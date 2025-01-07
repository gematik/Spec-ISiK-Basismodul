# Blutdruck

Mit diesem Profil lassen sich unterschiedliche Messungen zum Blutdruck erfassen, wobei z.B. systolischer und diastolischer Blutdruck gemeinsam in einer Instanz angegeben werden sollen (ggf. auch systolischer allein, s.u.).

Alle bestätigungsrelevanten Systeme für dieses Modul müssen Ressourcen verarbeiten können, die zu diesem Profil konform sind.

## Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKBlutdruckSystemischArteriell' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKBlutdruckSystemischArteriell, hybrid}}

**Hinweis:** In Fällen, in denen fachlich motiviert ausschließlich ein systolischer Blutdruck erhoben wird (z.B. in der Intensivmedizin), kann für den Slice zur Diastole (DiastolicBP) das Element .dataAbsentReason (mit dem Code 'not-performed') verwendet werden.

## Beispiele

Valides Minimalbeispiel für das Profil ISiKBlutdruck:

{{json:ISiKBlutdruckExample}}