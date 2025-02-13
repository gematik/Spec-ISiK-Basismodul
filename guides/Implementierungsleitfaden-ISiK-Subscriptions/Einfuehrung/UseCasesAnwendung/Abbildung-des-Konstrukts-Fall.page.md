---
topic: Fall
---

## {{page-title}}


#### Der Begriff "Fall" im Kontext von FHIR

Der Begriff "Fall" gruppiert im Sprachgebrauch verschiedene Konzepte, die in FHIR durch unterschiedliche Ressourcen repräsentiert werden:

* **Aufenthalt/Besuch/Kontakt (Encounter):**
Der stationäre Aufenthalt oder der ambulante Kontakt eines Patienten in einer Gesundheitseinrichtung wird in FHIR durch die Ressource Encounter abgebildet.

* **Abrechnungsfall (Account):**
Der Fall, im Sinne einer Gruppierung von medizinischen Leistungen, die in einem gemeinsamen Kontext abgerechnet werden, sind in FHIR durch die Ressource Account repräsentiert. Ein Abrechnungsfall kann mehrere Encounter umfassen (z.B. vorstationärer Besuch, stationärer Aufenthalt und nachstationäre Besuche)
{{render:Material/Images/Encounter/Encounter-Modell-Abrechnung.png}}

* **Medizinischer Fall (EpisodeOfCare):**
Der medizinische Fall gruppiert Informationen, die im Kontext einer gemeinsamen (Dauer-)Diagnose stehen und wird in FHIR durch die EpisodeOfCare dargestellt.
{{render:Material/Images/Encounter/Encounter-Modell-Medizinisch.png}}

Wichtig ist die Herausstellung, dass "Besuch" und "Fall" wechselseitig keine synonymen Begriffe sind. 

---

#### Der Begriff "Fall" im Kontext der Medizininformatik-Initiative
In dem [von der Medizininformatik-Initiative zur Kontaktverfolgung (Infektionsketten) des Patienten entworfenen Modell](https://simplifier.net/guide/MedizininformatikInitiative-ModulFall-ImplementationGuide-backup/EinfachesAufbaumodell?version=current) wird der Encounter in drei verschiedenen Ebenen verwendet:

* **Einrichtungskontakt:**
Als Kontakt eines Patienten mit einer Einrichtung (z.B: Klinik) gruppiert mehrere Besuche bei einer Einrichtung als gemeinsamen Behandlungskontext.

* **Abteilungskontakt:**
Als Kontakt des Patienten mit einer Fachabteilung eines Krankenhauses (z.B. einer Ambulanz oder einer stationären Fachabteilung).

* **Versorgungsstellenkontakt:**
Als Kontakt des Patienten mit konkreten Servicestellen, wie z.B. Radiologie oder Endoskopie

Zur Unterscheidung der verschiedenen Kontaktebenen wird in der MI-I eine Codierung in `Encounter.type` verwendet. Die Hierarchie der Encounter wird über die `Encounter.partOf`-Relation hergestellt. Ambulante Besuche werden in dem Modell derzeit noch nicht berücksichtigt.

{{render:Material/Images/Encounter/Encounter-Modell-MII.png}}

---

#### Der Begriff "Fall" im Kontext der ISiK-Spezifikation

Für die derzeitige Ausbaustufe des ISiK Basismoduls werden alle zuvor genannten Sichtweise und Modelle berücksichtigt:

{{render:Material/Images/Encounter/Encounter-Modelle.png}}

Verpflichtend umzusetzen ist für die bestätigungsrelevanten Systeme der Account, im Sinne der Gruppierung einzelner Besuche, zu einem gemeinsamen (Abrechnungs-)Fall sowie der Encounter der Ebene "Abteilungskontakt" im Sinne des Modells der Medizininformatikinitiative.

Herstellern steht es frei, weitere Ressourcen, wie zum Beispiel die EpisodeOfCare oder den Encounter, im Sinne des Einrichtungskontaktes bzw. des Versorgungsstellenkontaktes, zu implementieren.

Wichtig sind dabei jedoch folgende Punkte zu beachten:

* Encounter im ISiK-Kontext sind stets als "Abteilungskontakte", im Sinne der MI-I mit dem entsprechenden `Encounter.type`-Code, zu kennzeichnen.
* Jegliche im ISiK-Basis-Modul, als auch in anderen ISiK-Modulen definierte Ressourcen, die über einen Encounter-Kontext verfügen, müssen auf einen ISiK-Encounter (Abteilungskontakt) referenzieren.
{{render:Material/Images/Encounter/Encounter-Modell-ISiK.png}}

---

#### Die Repräsentation der "Fall"-Nummer

Die "Fall"-Nummer ist ein im Kontext der stationären Versorgung häufig verwendetes Vehikel, um (insbesondere in der HL7-V2-Kommunikation) mit einfachen Mitteln den Fallkontext medizinischer Dokumentationen herzustellen.

In den meisten Fällen handelt es sich bei der "Fall"-Nummer um einen eindeutigen Identifier des Abrechnungsfalls. 
Im ISiK-Kontext ist die Fallnummer daher als Identifier des Accounts zu sehen und nicht geeignet, einen Encounter eindeutig zu identifizieren und damit den für FHIR-Ressourcen erforderlichen Encounter-Kontext zu etablieren.
Es müssen zusätzliche Kriterien, wie z.B. Zeitraum(`Encounter.period`), Fallart (`Encounter.class`) oder Status (`Encounter.status`) berücksichtigt werden, um den korrekten Encounter zu finden.

ISiK berücksichtigt jedoch die gängige Praxis, dass die Fallnummer als primäres Suchkriterium verwendet wird; auch von Systemen, die rein der medizinischen Versorgung dienen und keine Abrechnungsfunktionen implementieren. 
Um insbesondere Subsysteme von der Pflicht zu entbinden, die Account-Ressource zu implementieren, nur um Zugriff zur Fallnummer zu bekommen, ist das Mitführen des Account-Identifiers als logische Referenz auf den Account im Encounter verpflichtend. Die Fallnummer eines Encounters kann daher auch ohne Kenntnis des Accounts ermittelt werden.

| Hinweis | Änderung gegenüber ISiK-Basis-Modul Stufe 1!|
|---------|---------------------|
| {{render:Material/Images/IG_Warning}} | Die Abbildung der Fallnummer als Identifier des Accounts ist abweichend von der im Basismodul Stufe 1 festgelegten Abbildung der Fallnummer als Identifier des Encounters. Diese Änderung ist erforderlich, da die Fallnummer nicht geeignet ist, einen Encounter eindeutig zu identifizieren. Der Encounter kann weiterhin einen von der Abrechnungsfallnummer unabhängigen Identifier enthalten (z.B. "Aufnahmenummer", Bewegungsnummer). Dieser identifiziert eineindeutig den jeweiligen Kontakt.|

{{render:Material/Images/Encounter/Encounter-Modell-Fallnummer.png}}

---
