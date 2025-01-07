# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Es handelt sich um ein **Support Modul**, was nicht eigenständig funktionsfähig ist (eigene Use Cases bedient) oder bestätigtigungsrelevant ist.

---
Version: 4.0.0-rc2

Datum: tbd

- Entfernen von MS von .id der Ressourcen https://github.com/gematik/spec-ISiK-Labor/pull/6

----
**Release Candidate zur Kommentierung**



* Es handelt sich um ein Support Modul, was nicht eigenständig funktionsfähig ist (eigene Use Cases bedient) oder bestätigtigungsrelevant ist
* ISiKLaboruntersuchung als generisches Profil von Observation
  * Davon abgeleitet 8 als besonders relevant identifizierte Untersuchungen: CRP, GFR, Hb, PCT, Serumkreatinin, TSH, Thrombozyten, Troponin.
  * Die Angaben zu Messart (z.B. im Serum) und Einheiten (z.B. umol/L ) für die jeweilige Untersuchung in den gängigsten Varianten. Coding in der Regel in LOINC und UCUM
  * Alle notwendigen CodeSystems und ValueSets. Jeweils 2 Profile pro Beobachtungswert
* Teil des Übergreifenden Use Case AMTS, inklusive mini-IG und Auszügen aus IOP-Arbeitskreis. Dieser Übergreifende Use Case nutzt auch (insbesondere) weitere neue Profile aus dem Modul Basis und Medikation
  * Risikobewertung aus Medikation (ISiKAMTSBewertung)
  * Diagnose aus Basis (ISiKAllergieUnvertraeglichkeit, chr. Krankheit wie Parkinson, usw.)
  * Observation aus Basis (Schwangerschaft, AlkoholAbusus usw.)
  * Observation aus Labor oder Vital (SerumKreatinin, GFR, Blutbild, Gewicht usw.)
* Teil des Übergreifenden Use Case bzw. Konzept Überleitung Normal- und Intensivversorgung. Dieser Use Case ist insbesondere Teil des Moduls Vitalparameter

**Full Changelog**: initial Release
