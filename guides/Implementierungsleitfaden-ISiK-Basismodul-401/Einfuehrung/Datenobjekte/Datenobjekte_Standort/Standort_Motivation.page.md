---
topic: ImplementationGuide-markdown-Standort-Standort-Motivation
---
### Motivation
In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.

Die Abbildung von Standorten in einem Krankenhaus unterstützt u.a. die Raum- und Bettenbelegung in strukturierter Form. 

Die Erfassung des Standortes in strukturierter Form soll u.a. ermöglichen:
- Zuweisungen von Diensten an bestimmte Standorte im Rahmen des Terminmanagements
- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär) - u.a. für 
    - Patientenportale im Rahmen der Terminbuchung, z.B. um den Wunsch nach Einzelbett, bzw. 1 oder 2 Betten abzubilden
    - KIS und weitere Subsysteme:
      - zur Patientenabholung und Information für den Transportdienst
      - Abbildung der Verfügbarkeit eines spezifischen Bettenstellplatzes (z.B. mit spezifischem Monitoring-Device) 
- Im Rahmen der Versorgung kann eine der folgenden Beispiel-Fragen beantworten werden:
    - Handelt es sich um ein Isolationszimmer?
    - Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte?
    - etc.

Dafür werden Standort-Profile in unterschiedlicher Granularität definiert. 

---

#### Normativer Status und Bestätigung

Diese Profile MÜSSEN im Rahmen der Bestätigung NICHT unterstützt werden. Falls ein Profil unterstützt wird, SOLLEN die hier definierten Festlegungen greifen.


---