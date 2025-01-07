## Motivation und Hintergrund
Dieser Abschnitt des Implementierungsleitfadens beschreibt eine bidirektionale Überleitung zwischen Intensiv- und Normalversorgung auf der Ebene eines Workflows zur Datenkommunikation zwischen den betroffenen Systemen (PDMS und KIS).

###  Stakeholder, User und weitere Systeme
Die Spezifikation richtet sich insbesondere an SW-Hersteller von KIS und PDMS.

Es handelt sich um eine technische Spezifikation, zu der keine weiteren medizinischen Fachexperten zu Rate gezogen werden. 

Kommunikations-Workflows, die auf der hiesigen Schnittstellen-Festlegung aufbauen, können lediglich der Unterstützung von Versorgung und Qualitätssicherungsmaßnahmen in der Überleitung zwischen Intensiv- und Normalversorgung (bidirektional) dienen.

###  User und Systeme im Fokus
Primär zu berücksichtigende User sind
* Krankenhausmitarbeitende (insbesondere intensivmedizinisches Personal, MFAs, Ärzte etc.)

Beteiligte Systeme sind prinzipiell alle [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-v4/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme?version=current). Primär hervorzuheben sind entsprechend der Definition der DKG dabei:
* KIS mit Funktion elektronische Kurve bzw. entsprechendes KIS-Modul
* Patientendaten-Managementsystem (PDMS) [z.B. für Intensivbereiche]
* Elektronische Kurve [z.B. für die Verwendung auf Normal-Stationen]

###  Einordnung in die ISiK Landschaft
Als übergreifender Use Case (bzw. Workflow) ist die Überleitung zwischen Intensiv- und Normalversorgung nicht allein im Modul Vitalparameter verankert. Dennoch werden aus verschiedenen fachlichen Gründen  die  wesentlichen Ressourcen hier vorgehalten. 
Fachlich relevant sind im ISiK-Kontext für die Intensivversorgung ebenfalls:

- **ISiK Basismodul: Mit Informationen zum Patienten und Diagnosen** - Hier sind Patientenstammdaten, Diagnosen und Prozeduren verortet. Es gehören aber auch chronische Erkrankungen (z.B. Niereninsuffizienz), Lebensumstände (z.B. Schwangerschaft) und Lebensgewohnheiten (z.B. Raucher) dazu. Siehe [ISiK Basismodul](https://simplifier.net/guide/isik-basis-v4)
- **ISiK Support Modul Labor: Mit Informationen aus der Labor Diagnostik** - In diesem Modul finden sich relevante Beobachtungen und Messwerte, die als Ergebnis eines diagnostischen Prozesses oder einer Probe zugeordnet werden können. Siehe [ISiK Modul Labor](https://simplifier.net/guide/isik-labor-v4)
 
###  Out-of-Scope
Aufgrund technischer Beschränkungen und Aufwände gibt es Aspekte, die aktuell außen vor bleiben müssen:
* Die Festlegung und Abstimmung eines vollständigen ISiK Labor Moduls
* Die konkrete Abdeckung von Versorgungsprozessen in der Intensivmedizin