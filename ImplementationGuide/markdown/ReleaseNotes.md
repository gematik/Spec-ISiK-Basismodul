# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Version: 3.0.6

Datum: t.b.d

* Lockerung der Anforderung für MS-Definition und Suchparameter zu Condition.clinicalStatus (entspricht Änderungen in 4.0.0-rc3 und 2.0.7) https://github.com/gematik/spec-ISiK-Basismodul/pull/428
* Anpassung der Kardinalität für Account.coverage.extension:Abrechnungsart https://github.com/gematik/spec-ISiK-Basismodul/pull/464

----

Version 3.0.5

Datum: 30.04.2024

* Lockerung der Anforderung für den Suchparameter "context-type-value" für ISiKValueSet- -> KANN https://github.com/gematik/spec-ISiK-Basismodul/pull/392
* Fix des ValueSets für SNOMED-CT-Diagnosen https://github.com/gematik/spec-ISiK-Basismodul/pull/398
* Änderung des Beispiels zum Abrechnungsfall https://github.com/gematik/spec-ISiK-Basismodul/pull/387

----

Version: 3.0.4

Datum: 1.3.2024

* Entfernen der Festlegungen zum .identifier in ISiKVersicherungsverhaeltnisGesetzlich: https://github.com/gematik/spec-ISiK-Basismodul/pull/362
* Korrektur der Anforderung zur Encounter-Kontaktebene: https://github.com/gematik/spec-ISiK-Basismodul/pull/363
* Hinweis zur Nutzung des Suchparameter "context-type-value" hinzugefügt: https://github.com/gematik/spec-ISiK-Basismodul/pull/367
* Änderung der Anforderung zu KANN für Profil ISIKKatalog: https://github.com/gematik/spec-ISiK-Basismodul/pull/367
* Lockerung für Extension Kardinalität in Account zu ..* und hinzufügen einer Beschreibung: https://github.com/gematik/spec-ISiK-Basismodul/pull/366


----
Version: 3.0.3

Datum: 15.01.2024

* Anpassung und Harmonisierung der Anforderungen zu HTTP-Responses: update HTTP response requirement #308 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/354

**Full Changelog**: https://github.com/gematik/spec-ISiK-Basismodul/compare/v.3.0.2...v.3.0.3

----
Version: 3.0.2

Datum: 09.01.2024

* Hinzufügen optionaler Suchparameter für RelatedPerson: Add new optional SearchParameter for RelatedPerson.address - Feature/anfisk 146 search related person by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/346

**Full Changelog**: https://github.com/gematik/spec-ISiK-Basismodul/compare/v.3.0.1...v.3.0.2

----
Version: 3.0.1

Datum: 05.12.2023

* Obsoleter SNOMED Code ersetzt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/d72f3a08a41b999074b4f33db299d5d71cd04be9
* Hinweis zur Nutzung der ISIKBinary-Ressource hinzugefügt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/7dc3026686856efd3e61660a37f1e15955d45a11
* Invariante zur Strassenanschrift modifiziert - fix invariant context #330: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/345d776f3b75442e391d8787c71a051628050b9e
  * hier auch Constraint bezüglich ISiKAngehoeriger aus Strassenanschrift entfernt
* Anforderungen im CapabilityStatement zum Account entsprechend der textuellen Anforderungen angepasst: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/ac4d2c730bb94dd50cc4f5deea8c2b1344329d2c
* Neue (klärende) Anforderung zum Versorgungsstellenkontakt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/d7005923c4596f8a646468f20e1f9975f2489bef 
* Öffnung der Festlegung einer Coverage-ID - fix identifier slices + add MS beneficiary + rm MS kvid: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/bd66cca38397b987581bece3d2e9f508813ff765
* Zielstellung zur Interoperabilität der Profile angepasst: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/3130973de182a078208f181a64ff1cfd8783493a


**Full Changelog**: https://github.com/gematik/spec-ISiK-Basismodul/compare/v.3.0.0...v.3.0.1

----
Version: 3.0.0

Datum: 01.07.2023

* Mit dem Release der Stufe 3.0.0 werden die unten gelisteten Änderungen normativ festgesetzt.

----
Version: 3.0.0-rc3

Datum: 30.05.2023

* Allgemein: Vorgaben zur Herkunftsausweisung/Provenance (meta.tag) gelockert
  * update provenance constraints by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/263
* ISiKCapabilityStatement: Read Shall für Composition entfernt
  * fix capability for Composition #259 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/260
* ISiKAbrechnungsfall: 
  * Änderung des Codierungs-Pattern, Value Set hinzugefügt und Beispiel angepasst
    * Enhancement/account identifier by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/238
    * Update/identifier Abrechnungsnummer vs by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/269
  * Änderung der falschen Kardinalität
    * fix cardinality #258 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/262
  * Nur der Patient als Subject zugelassen
    * Update/account.subject only patient #251 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/265
* ISiK Prozedur: MS für SNOMED-Codierung
  * add: MS for SNOMED by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/239
* ISiKVersicherungsverhaeltnisSelbstzahler: Organisation als zahlende Instanz hinzugefügt
  * add: organization as payor by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/236
* ISiK KontaktGesundheitseinrichtung: Suchparameter für Encounter.date start/end aus R5 übernommen
  * feat: Encounter.date start/end SearchParameters backported from R5, e… by @patrick-werner in https://github.com/gematik/spec-ISiK-Basismodul/pull/242
* ISiKBerichtSubSysteme: References generisch statt ISiK-spezifisch
  * update Reference - Kommentierung Stufe 3 by @f-peverali in https://github.com/gematik/spec-ISiK-Basismodul/pull/256

----
Version: 3.0.0-rc2

Datum: 03.04.2023

* KontaktGesundheitseinrichtung: SearchParameter aus FHIR-R5 für Encounter.period als Custom SearchParameter eingeführt, um die effektive Suche auf Encounter ohne abgeschlossene "period" zu ermöglichen
  * feat: Encounter.date start/end SearchParameters backported from R5, e… by @patrick-werner in <https://github.com/gematik/spec-ISiK-Basismodul/pull/242>

----
Version: 3.0.0-rc1

Datum: 31.03.2023

* ISiKAbrechnungsfall: Identifier-Pattern und Kodierung ersetzt durch Anpassung an das Basisprofil DE Pre-Release
  * Enhancement/account identifier by @f-peverali in <https://github.com/gematik/spec-ISiK-Basismodul/pull/238>
* ISiKProzedur: SNOMED-Kodierung auf Must Support gesetzt
  * add: MS for SNOMED by @f-peverali in <https://github.com/gematik/spec-ISiK-Basismodul/pull/239>
* ISiKVersicherungsverhaeltnisSelbstzahler: Organisation als möglicher 'payor' hinzugefügt (es gibt auch Konstellationen, in denen die Zahlung direkt über die PKV erfolgt)
  * add: organization as payor by @f-peverali in <https://github.com/gematik/spec-ISiK-Basismodul/pull/236>

**Full Changelog**: <https://github.com/gematik/spec-ISiK-Basismodul/compare/master-isik-stufe-2...main-isik-stufe-3-rc>

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
