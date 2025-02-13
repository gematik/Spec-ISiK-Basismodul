---
topic: DatenübermittlungSubsystem
---

## {{page-title}}

In der heterogenen Systemlandschaft im Krankenhaus sind eine Vielzahl spezialisierter Subsysteme im Einsatz. Die Ergebnisse aus diesen Subsystemen sind aktuell jedoch häufig nicht in den Primärsystemen des Krankenhauses verfügbar, denn es bestehen folgende Herausforderungen:

1. Die Daten in Subsystemen sind sehr heterogen und können hochspezialisiert sein.
1. Bei der Nutzung dieser Subsysteme besteht häufig ein Interesse, auf die menschenlesbare Repräsentation der strukturierten Daten einwirken zu können.
1. Künftig ist mit Szenarien zu rechnen, bei denen Befunde aus Subsystemen in eine elektronische Patientenakte übertragen werden sollen.
1. Aktuell werden Befunde, obwohl diese in den Subsystemen in hochstrukturierter Form vorliegen, nur als PDF an das Primärsystem übermittelt. Oft weil kein strukturiertes Format spezifiziert ist, das sowohl versendendes Subsystem als auch empfangendes Primärsystem implementiert haben. 
1. Der Umfang, in dem eine Datenübernahme in ein Primärsystem möglich ist, variiert stark zwischen den Systemen oder Installationen, z.B. abhängig davon, ob ein Modul für Vitalparameter installiert ist.

Die ISiK-Spezifikation begegnet diesen Herausforderungen, indem sie die Übermittlung von Ergebnissen aus Subsystemen an die Primärsysteme in Form von strukturierten Dokumenten erfordert, die über eine menschenlesbare Repräsentation verfügen. Diese strukturierten Dokumente werden im ISiK-Kontext als Berichte bezeichnet. Dabei sind die strukturierten Inhalte der Berichte harmonisiert mit den verbreiteten Formaten für Primärsysteme.

In der aktuellen Ausbaustufe von ISiK ist lediglich die Übernahme und Anzeige der Dokument-Metadaten (z.B. Dokumenttyp, Dokumentdatum, Quelle) und der menschenlesbaren HTML-Repräsentation in die Primärsysteme erforderlich.

In weiteren Ausbaustufen von ISiK soll darüber hinaus eine Übernahme der strukturierten Anteile der Dokumente möglich sein, die den ISiK-Spezifikationen entsprechen, z.B. Diagnosen und Prozeduren.

Es obliegt dabei dem Ermessen des Herstellers, ob die Übernahme strukturierter Daten in das Primärsystem automatisch erfolgt, oder durch den Benutzer initiiert wird.

Die Berichte werden, wie von der [FHIR Spezifikation für die Composition Ressource vorgesehen](https://www.hl7.org/fhir/R4/composition.html), in einem FHIR-Bundle versendet.

### Interaktionen

Die Rückübermittlung eines Document-Bundles an ein Primärsystem erfolgt mittels einer 'POST'-Interaktion auf den Endpunkt des Primärsystems.

 Beispiele:

   `POST [base]/` mit einer FHIR-Bundle Ressource im Request-Body.

   Anwendungshinweise: Weitere Informationen zu den verschiedenen Endpunkten für Dokumente finden sich in der [FHIR-Basisspezifikation - Abschnitt "Document End-Points"](https://www.hl7.org/fhir/R4/documents.html#bundle).
  
Das Bundle dient der Aggregation aller Ressourcen, die Bestandteil des Dokumentes sind. Dabei ist die erste Ressource im Bundle (Bundle.entry.resource) stets eine Composition, alle weiteren Entries enthalten zusätzliche Ressourcen, auf die die Composition verweist.

Falls die im Dokumenten-Bundle enthaltene Patient-Ressource und/oder Encounter-Ressource nicht anhand der Business-Identifier oder anderer Matching-Kriterien im empfangenden System gefunden werden kann (d.h. der Patient oder der Encounter existiert im empfangenden System noch nicht), MUSS als Antwort der HTTP Status Code "422 - Unprocessable Entity" zurückgegeben werden. Im Body der Response ist eine OperationOutcome zurückzugeben, welche ein Issue mit dem Verweis auf die nicht auflösbare Referenz enthält. Zur Kodierung von OperationOutcome.issue.code MUSS als Code ["processing"](https://hl7.org/fhir/R4/codesystem-issue-type.html) verwendet werden.

Das Bundle muss folgendem Profil entsprechen:
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle, hybrid}}  

Unterscheidungshinweis: Informationen zu Interaktionen mit Dokument-Binaries finden sich im Modul [ISiK Dokumentenaustausch](https://simplifier.net/guide/isik-dokumentenaustausch-v4/AkteureUndInteraktionen-AkteureUndInteraktionen-ErzeugenVonMetadaten?version=current).

### Verarbeitung des Dokumentes

**Hinweis:** Die nachfolgenden Regeln für die Verarbeitung eines Dokumentes gelten nur für Document-Bundles, die an den oben genannten Endpunkt gesendet werden. Weitere ISiK-Module können Regeln für die Verarbeitung von anderen Bundle-Typen (z.B. 'transaction') aufstellen.

In der aktuellen Ausbaustufe von ISiK MUSS ein empfangenes Dokument in folgenden Schritten verarbeitet werden:

1. Extraktion der Patient-Ressource aus dem Bundle und Herstellung des Patientenbezuges anhand eines eindeutigen Identifiers ('Patient.identifier') oder ähnlich identifizieren Merkmalen
2. Extraktion der Encounter-Ressource aus dem Bundle und Herstellung des Fallbezuges anhand der Abrechnungsfallnummer ('Encounter.account.identifier') oder ähnlich identifizieren Merkmalen
3. Extraktion der Composition-Ressource aus dem Bundle und Auslesen der mit 'mustSupport' gekennzeichneten Meta-Daten, sowie der menschenlesbaren Repräsentation des Dokumentes ('Composition.text', 'Composition.section.text', 'Composition.section.section.text')
4. Hinzufügen des Dokumentes und seiner Metadaten zur Fallakte des Patienten.
5. Visualisierung des Dokumentes und seiner Metadaten in der Fallakte des Patienten

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/main-isik-stufe-3/Material/images/diagrams/Composition_Bundle.svg" alt="Composition Bundle" width="90%"/>

Die Grafik zeigt an einem vereinfachten Beispiel die Zuordnung des HTML-Dokumentes zu Patient und Kontakt in der aktuellen Ausbaustufe von ISiK (schwarze Pfeile). Die grauen Pfeile deuten die Übernahme strukturierter Daten, wie sie in weiteren Ausbaustufen erforderlich wird.

### Hinweise zum Umgang mit der menschenlesbaren Repräsentation

Die menschenlesbare Repräsentation ("Narrative") eines Dokumentes setzt sich zusammen aus dem Inhalt von 'Composition.text', einer Repräsentation der Metadaten (z.B. Dokumenttyp, Patientenname, Patientennummer, Aufnahmenummer, Datum) sowie der Aggregation der Inhalte von 'Composition.section', wobei zu beachten ist, dass ein Dokument beliebig viele Sections haben kann.
Die einzelnen Bestandteile des Narratives KÖNNEN mit \<div\>-Elementen zusammengefügt werden.

### Extraktion der Patient-/ und Encounter-Ressource im Document-Bundle

Folgende Fälle sind zu beachten, um eine Patient-/ und Encounter-Ressource aus dem Document-Bundle zu extrahieren:

* Die aufzulösende Referenz ist eine URN (immer absolut, z. B. "urn:uuid:9d1714da-b7e6-455b-bfd2-69ce0ff5fb12"):
  * Suche nach einem Bundle-Entry mit einer fullUrl, die mit dem reference.value übereinstimmt
  * Wenn einer gefunden wird, ist die Auflösung erfolgreich (und endet hier)
  * Andernfalls schlägt die Auflösung fehl (und endet hier). Die Referenz hat in dieser Spezifikation keine definierte Bedeutung.

* Wenn die Referenz eine absolute URL ist (z. B. "https://fhir.example.org/base/Patient/123", "https://fhir.example.org/base/Patient/123/_history/a"):
  * Suche nach einem Bundle-Entry mit einer fullUrl, die mit dem reference.value übereinstimmt
  * Wenn einer gefunden wird, ist die Auflösung hier erfolgreich (und endet)
  * Wird mehr als ein Eintrag gefunden, KANN der Server nach der neuesten Version suchen (basierend auf meta.lastUpdated). Wenn jener auf diese Weise genau eine aktuelle Version findet, ist die Auflösung erfolgreich (und endet hier)

* Wenn die Referenz die Form "[Typ]/[id]" hat (z. B. "Patient/123")
  * Wenn der Bundle-Entry, der den Verweis enthält, eine FullUrl hat, die dem [RESTful-URL-Regex](https://hl7.org/fhir/R4/references.html#regex) entspricht (z. B. "https://fhir.example.org/Observation/456"):
    * Extrahiert wird die [root] aus der fullUrl des Bundle-Entries und mit der relative Referenz zusammengefügt (z. B. "https://fhir.example.org/" + "Patient/123" --> "https://fhir.example.org/Patient/123")
    * Gefolgt wird den Schritten für die Auflösung absoluter Referenzen. Siehe oben.

### Persistierung der menschenlesbaren Repräsentation

Das Narrative der Ressource KANN innerhalb einer DocumentReference-Ressource persistiert werden. Zum derzeitigen Zeitpunkt obliegt es der jeweiligen Implementierung wie diese DocumentReference Ressource ausgestaltet ist.
Ein Mapping der Composition-Metadaten auf DocumentReference-Metadaten KANN der FHIR Kernspezifikation entnommen werden. Siehe [Abschnitt "2.42.8.7 FHIR Composition"](https://www.hl7.org/fhir/R4/documentreference-mappings.html#fhircomposition).

Das Narrative MUSS als Binary-Ressource unter DocumentReference.content.attachment.url angegeben werden.

**Hinweis:** Es ist zu beachten, dass in einem Attachment-Datentyp im Element "url" eine absolute URL anzugeben ist. Somit muss zunächst das Binary auf dem externen System per POST angelegt werden. Der hieraus resultierende Link kann anschließend im Attachment verwendet werden.

Falls ein Bundle erneut mit dem gleichen Bundle.identifier übermittelt wird, MUSS eine neue DocumentReference erstellt werden, welche unter DocumentReference.relatesTo.target angegeben wird.

### Hinweise zum Umgang mit strukturierten Daten

Auch wenn in der aktuellen Stufe nur die Übernahme der menschenlesbaren Repräsentation erforderlich ist, empfiehlt es sich dennoch, das vollständige Bundle samt der strukturierten Anteile zu einem Dokument zu persistieren, sodass zu einem späteren Zeitpunkt, wenn eine Übernahme einzelner Daten möglich ist, diese auch rückwirkend erfolgen kann.

