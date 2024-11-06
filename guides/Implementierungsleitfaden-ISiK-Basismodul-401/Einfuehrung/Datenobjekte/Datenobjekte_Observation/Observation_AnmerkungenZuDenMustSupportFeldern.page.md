---
topic: markdown-Observation-Observation-AnmerkungenZuDenMustSupportFeldern
---
### Anmerkungen zu den Must-Support-Feldern

### `Observation.status`

**Bedeutung:** Der Status MUSS insbesondere zur Differenzierung von abgeschlossenen, vorläufigen oder korrigierten Beobachtungen angegeben werden. 
Es ist möglich, dass einzelne Systeme nur Werte vom Status `final` bereitstellen. Empfangende Systeme müssen jedoch in der Lage sein, sämtliche Status-Codes zu interpretieren.

**Hinweis:** Siehe Beschreibung in der [FHIR Kernspezifikation](https://hl7.org/fhir/R4/observation-definitions.html#Observation.status).

### `Observation.category`
**Bedeutung:** Kategorie-Code, der die Untersuchung kategorisiert.

### `Observation.code`
**Bedeutung:** Code, der die Untersuchung repräsentiert und kodiert.

### `Observation.subject`
**Bedeutung:** Ein Patientenbezug der Observation MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen. 

### `Observation.encounter`
**Bedeutung:** Der Fallbezug einer Observation MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.

**Hinweise:**

Eine Verlinkung der Referenz auf den dazugehörigen Kontakt MUSS auf die Ebene des Abteilungskontaktes (entsprechend ISiKKontaktGesundheitseinrichtung) erfolgen.
Bei der Auswahl des Kontaktes ist zu beachten, dass mehrere Encounter-Ressourcen mit identischen Aufnahmenummer-Identifiern existieren können (Abbildung Vor- und nachstationäre Kontakte).

### `Observation.effective[x]`
**Bedeutung:** Klinisch relevanter Zeitpunkt/Zeitspanne für die Observation.

### `Observation.hasMember`
**Bedeutung:** Weitere Observation, die mit dieser Observation gemeinsam zu betrachten ist. 

### `Observation.value[x]`
**Bedeutung:** Erfasster Wert der Observation. 

### `Observation.component`

**Bedeutung:** Bei Vitalparametern, die aus mehreren Einzelnen Messpunkten bestehen (Blutdruck, EKG, GCS), werden die gemessenen Einzelwerte
jeweils mit einem separaten LOINC-Code in `Observation.component.code` versehen  und der entsprechende Messwert in `Observation.component.value` erfasst.

---