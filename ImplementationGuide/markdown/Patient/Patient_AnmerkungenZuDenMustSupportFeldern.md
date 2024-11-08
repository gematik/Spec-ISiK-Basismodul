### Anmerkungen zu Must-Support-Feldern

### `Patient.active`

**Bedeutung:** Indikator "Patientdatensatz ist in aktiver Benutzung"

**Hinweise:** Siehe Beschreibung in der [FHIR Kernspezifikation](https://hl7.org/fhir/R4/patient-definitions.html#Patient.active)

### `Patient.identifier:versichertenId_GKV`

**Bedeutung:** Versicherten ID der gesetzlichen Krankenkasse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/GesetzlicheKrankenversichertennummer10-stelligeKVID-Identifier.html)

### `Patient.identifier:pid`

**Bedeutung:** Organisationsinterner Patienten-Identifier

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/OrganisationsinternerPatienten-Identifier.html)

### `Patient.identifier:versicherungsnummer_pkv`

**Bedeutung:** Versicherten Nr., falls versichert bei einer privaten Krankenkasse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/PrivateKrankenversichertennummer-Identifier.html)

### `Patient.name:name`

**Bedeutung:** Vollständiger Name

**Hinweise:** Wenn kein Name vorliegt, SOLLTE die [data-absent-reasons](https://www.hl7.org/fhir/R4/extension-data-absent-reason.html)-Extension eingesetzt werden. Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-Patient.html#Ressourcen-Patient-Name)

### `Patient.name:geburtsname` 

**Bedeutung:** Geburtsname des Patienten (nur Nachname)

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-Patient.html#Ressourcen-Patient-Name)

### `Patient.address:Strassenanschrift`

**Bedeutung:** Straßenadresse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-Patient.html#Ressourcen-Patient-Addresse)

### `Patient.address:Postfach`

**Bedeutung:** Postfachadresse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-Patient.html#Ressourcen-Patient-Addresse)

### `Patient.gender`

**Bedeutung:** Administratives Geschlecht

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-Patient.html#Ressourcen-Patient-Geschlecht)

### `Patient.birthdate`

**Bedeutung:** Geburtsdatum

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-Patient.html#Ressourcen-Patient-Geburtsdatum)

### Stornierung von Patienten

Im Rahmen des ISiK Basismoduls SOLL die Stornierung eines Patienten entweder erfolgen durch
* das Löschen der Patienten-Ressource oder
* die Verwendung des Feldes Patient.active

Die konkrete Implementierung ist abhängig davon, wie die Stornierung im bestätigungsrelevanten System umgesetzt ist. Im letzteren Fall wird die Stornierung durch das Setzen von Patient.active auf "false" gekennzeichnet.

---