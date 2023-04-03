# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Version: 3.0.0-rc1

Datum: 03.04.2023

* ISiKAbrechnungsfall: Identifier-Pattern und Kodierung ersetzt durch Anpassung an das Basisprofil DE Pre-Release
* ISiKProzedur: SNOMED-Kodierung auf Must Support gesetzt
* ISiKVersicherungsverhaeltnisSelbstzahler: Organisation als möglicher 'payor' hinzugefügt (es gibt auch Konstellationen, in denen die Zahlung direkt über die PKV erfolgt)
* KontaktGesundheitseinrichtung: SearchParameter aus FHIR-R5 für Encounter.period als Custom SearchParameter eingeführt, um die effektive Suche auf Encounter ohne abgeschlossene "period" zu ermöglichen

----
Version: 2.0.5

Datum: 24.03.2023

- Änderungen am IG
  - Hinweis Inkompatibilität zu KBV Basisprofile bei Patient.Adress.country
  - Einschränkung der Umsetzungspflicht für Suchparameter vom Typ "Token" auf Datentypen "code", "Coding" oder "CodeableConcept"
- ISiKBerichtBundle
  - Slicing-Korrektur - betrifft Validierung und erfordert keine Anpassung von Seiten der Implementierung (https://github.com/gematik/spec-ISiK-Basismodul/pull/202/commits/e4cf702116c0d9c7a11260efc4cc9e583ba4ea889)
- ISiKPatient (Beispiel - erfordert keine Anpassung von Seiten der Implementierung)
  - Fixed identifier-Slicing of Type VersichertenId-GKV

----
Version: 2.0.4

Datum: 31.01.2023

- ISiKVersicherungsverhaeltnisGesetzlich
  - ```Reference``` auf Kernspezifikation-Profil RelatedPerson statt ISiKAngehoeriger (entspricht allgemeinem Design-Prinzip)
  - ```Coverage.beneficiary.identifier``` URL in ```patternidentifier.system``` ersetzt
- weitere Änderungen an Implementierungsleitfaeden (informativ)

----
Version: 2.0.3

Datum: 21.12.2022

- CapabilityStatemtent
  - Composition und Bundle-Parameter hinzugefügt
- ISiKBerichtSubsystem
  - ```encounter``` auf FHIR-Core gesetzt
- ISiKBerichtBundle
  - Beispiele hinzugefügt
- Weitere geringfügige Änderungen am Implementierungsleitfaden



----
Version: 2.0.2

Datum: 31.10.2022

- Bericht für Subsysteme
  - ```id``` ist nun 0..1
- Kontakt
  - ```id``` ist nun 0..1
- Patient
  - ```id``` ist nun 0..1
  - Der Identifier ```Versichertennummer-GKV``` wurde zu ```VersichertenId-GKV```
- Prozedur
  - ```id``` ist nun 0..1
- Versicherungeverhältnis Gesetzlich
  - ```id``` ist nun 0..1
  - ```type.coding``` ist nun Must Support
  - ```VersicherungsArtDeBasis``` ist nun Must Support
- Invarianten wurden verbessert

----
Version: 2.0.1

Datum: 30.09.2022

* ISiKPatient:
  * .address.Strassenanschrift.extension:Stadtteil, .type, .status nun Must Support
* ISiKPersonImGesundheitsberuf:
  * .address.Strassenanschrift.extension:Stadtteil, nun Must Support
* ISiKAngehöriger:
  * .address.Strassenanschrift.extension:Stadtteil, nun Must Support
* ISiKAbrechnungsfall
  * .identifier.system im Example nun https://test.krankenhaus.de/fhir/sid/besuchsnummer
* ISiKKontaktGesundheitseinrichtung
  * .identifier.system im Example nun https://test.krankenhaus.de/fhir/sid/besuchsnummer
* ISiKVersicherungsverhaeltnisGesetzlich
  * .type ist nun Must Support
* ISiKVersicherungsverhaeltnisSelbstzahler
  * .type und .status ist nun Must Support

----
Version: 2.0.0

Datum: 30.06.2022

* Allgemein:
    * Alle Conformance Ressourcen enthalten den Prefix "https://gematik.de/fhir/isik/v2/Basismodul/" in ihrer Canonical URL
    * Erweiterung des Abschnittes "Verpflichtende Suchparameter (Alle Datenobjekte)" durch _tag, , _count, _include, _revinclude
    * Best Practice Empfehlungen für Standard-Suchfilter hinzugefügt
    * Verpflichtung :type-Modifier auf Referenzen hinzugefügt
    * Aufhebung der Einschränkung von Chaining und Reverse Chaining auf die Referenzen "patient", "subject" und "encounter"
    * Anpassung der Vorgaben für den "Self"-Link als Antwort auf eine Suchanfrage.
* Neue Profile hinzugefügt:
    * ISiKAbrechnungsfall
    * ISiKBerichtBundle
    * ISiKBinary
    * ISiKCodeSystem
    * ISiKValueSet
* ISiKAngehöriger:
    * Target Profil Einschränkung auf ISiKPatient in RelatedPerson.patient aufgehoben
* ISiKBerichtSubsystem:
    * Must-Support Flags hinzugefügt
* ISiKDiagnose:
    * Beschreibung von "isik-con1"-Constraint korrigiert
    * Must Support Flag für Extension "related" hinzugefügt
* ISiKPatient:
    * Umbenennung Slice von "Patient.identifier:Versichertennummer-GKV in "Patient.identifier:VersichertenId-GKV"
* ISiKPersonImGesundheitsberuf:
    * Element "Practitioner.identifier:TelematikId" hinzugefügt (must-support)
* ISiKVersicherungsverhaeltnisGesetzlich:
    * Must-Support Flag auf "Coverage.payor.identifier.type" hinzugefügt
* ISiKKontaktGesundheitseinrichtung
    * Constraints ISiK-enc-2 bis ISiK-enc-8 hinzugefügt
    * Extensions plannedStartDate, plannedEndDate und Wahlleistung hinzugefügt
    * Änderung Kardinalität von Element "Encounter.identifier:Aufnahmenummer.type" auf 1..1
    * Änderung Kardinalität von Element "Encounter.type:Kontaktebene" auf 1..1
    * Element "Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel" hinzugefügt
    * Änderung Kardinalität von "Encounter.period" von 1..1 auf 0..1
    * Element "Encounter.diagnosis.use.coding:Diagnosetyp" und "Encounter.diagnosis.use.coding:DiagnosesubTyp" hinzugefügt
    * Must-Support Flag auf Element "Encounter.account" hinzugefügt
    * Änderung der Binding-Strength des Elementes "Encounter.hospitalization.admitSource" von "preferred" auf "extensible"
    * Extensible ValueSet zu Element "Encounter.location.physicalType" hinzugefügt
    * Anstelle von "Encounter.location.location.display" ist nun "Encounter.serviceProvider.identifier" zu verwenden
    * Must-Support-Flag entfernt auf Element "Encounter.partOf"

----
Version: 2.0.0-ballot

Datum: 08.04.2022

* Initiale Ballotierungsversion für ISiK Stufe 2
----
