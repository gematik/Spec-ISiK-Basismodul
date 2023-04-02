### Interaktionen

Die Rückübermittlung eines Document-Bundles an ein Primärsystem erfolgt mittels einer 'POST'-Interaktion auf den Endpunkt des Primärsystems.

 Beispiele:

   `POST [base]/` mit einer FHIR-Bundle Ressource im Request-Body.

   Anwendungshinweise: Weitere Informationen zu den verschiedenen Endpunkten für Dokumente finden sich in der [FHIR-Basisspezifikation - Abschnitt "Document End-Points"](https://www.hl7.org/fhir/documents.html#bundle).
  
Das Bundle dient der Aggregation aller Ressourcen, die Bestandteil des Dokumentes sind. Dabei ist die erste Ressource im Bundle (Bundle.entry.resource) stets eine Composition, alle weiteren Entries enthalten zusätzliche Ressourcen, auf die die Composition verweist.

Falls die im Dokumenten-Bundle enthaltene Patient-Ressource und/oder Encounter-Ressource nicht anhand der Business-Identifier oder anderer Matching-Kriterien im empfangenden System gefunden werden kann (d.h. der Patient oder der Encounter existiert im empfangenden System noch nicht), MUSS als Antwort der HTTP Status Code "422 - Unprocessable Entity" zurückgegeben werden. Im Body der Response ist eine OperationOutcome zurückzugeben, welche ein Issue mit dem Verweis auf die nicht auflösbare Referenz enthält. Zur Kodierung von OperationOutcome.issue.code MUSS als Code ["processing"](http://hl7.org/fhir/issue-type) verwendet werden.

Das Bundle muss folgendem Profil entsprechen:
{{tree:https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKBerichtBundle, hybrid}}  

Unterscheidungshinweis: Informationen zu Interaktionen mit Dokument-Binaries finden sich im Modul [ISiK Dokumentenaustausch - Abgrenzung zu ISiK Stufe 2](https://simplifier.net/guide/isik-dokumentenaustausch/ImplementationGuide-markdown-AkteureUndInteraktionen?version=current#ImplementationGuide-markdown-AkteureUndInteraktionen-ErzeugenVonMetadaten).

### Verarbeitung des Dokumentes

In der aktuellen Ausbaustufe von ISiK MUSS ein empfangenes Dokument in folgenden Schritten verarbeitet werden:

1. Extraktion der Patient-Ressource aus dem Bundle und Herstellung des Patientenbezuges anhand eines eindeutigen Identifiers ('Patient.identifier') oder ähnlich identifizieren Merkmalen
2. Extraktion der Encounter.Ressource aus dem Bundle und Herstellung des Fallbezuges anhand der Abrechnungsfallnummer ('Encounter.account.identifier') oder ähnlich identifizieren Merkmalen
3. Extraktion der Composition-Ressource aus dem Bundle und Auslesen der mit 'mustSupport' gekennzeichneten Meta-Daten, sowie der menschenlesbaren Repräsentation des Dokumentes ('Composition.text', 'Composition.section.text', 'Composition.section.section.text')
4. Hinzufügen des Dokumentes und seiner Metadaten zur Fallakte des Patienten.
5. Visualisierung des Dokumentes und seiner Metadaten in der Fallakte des Patienten

{{render:ImplementationGuide/Images/Composition-Bundle.png}}
*Die Grafik zeigt an einem vereinfachten Beispiel die Zuordnung des HTML-Dokumentes zu Patient und Kontakt in der aktuellen Ausbaustufe von ISiK (schwarze Pfeile). Die grauen Pfeile deuten die Übernahme strukturierter Daten, wie sie in weiteren Ausbaustufen erforderlich wird.*

### Hinweise zum Umgang mit der menschenlesbaren Repräsentation

Die menschenlesbare Repräsentation ("Narrative") eines Dokumentes setzt sich zusammen aus dem Inhalt von 'Composition.text', einer Repräsentation der Metadaten (z.B. Dokumenttyp, Patientenname, Patientennummer, Aufnahmenummer, Datum) sowie der Aggregation der Inhalte von 'Composition.section', wobei zu beachten ist, dass ein Dokument beliebig viele Sections haben kann.
Die einzelnen Bestandteile des Narratives KÖNNEN mit \<div\>-Elementen zusammengefügt werden.

### Extraktion der Patient-/ und Encounter-Ressource im Document-Bundle

Folgende Fälle sind zu beachten um eine Patient-/ und Encounter-Ressource aus dem Document-Bundle zu extrahieren:

* Die aufzulösende Referenz ist eine URN (immer absolut, z. B. "urn:uuid:9d1714da-b7e6-455b-bfd2-69ce0ff5fb12"):
  * Suche nach einem Bundle-Entry mit einer fullUrl, die mit dem reference.value übereinstimmt
  * Wenn einer gefunden wird, ist die Auflösung erfolgreich (und endet hier)
  * Andernfalls schlägt die Auflösung fehl (und endet hier). Die Referenz hat in dieser Spezifikation keine definierte Bedeutung.

* Wenn die Referenz eine absolute URL ist (z. B. "https://fhir.example.org/base/Patient/123", "https://fhir.example.org/base/Patient/123/_history/a"):
  * Suche nach einem Bundle-Entry mit einer fullUrl, die mit dem reference.value übereinstimmt
  * Wenn einer gefunden wird, ist die Auflösung hier erfolgreich (und endet)
  * Wird mehr als ein Eintrag gefunden, KANN der Server nach der neuesten Version suchen (basierend auf meta.lastUpdated). Wenn jener auf diese Weise genau eine aktuelle Version findet, ist die Auflösung erfolgreich (und endet hier)

* Wenn die Referenz die Form "[Typ]/[id]" hat (z. B. "Patient/123")
  * Wenn der Bundle-Entry, der den Verweis enthält, eine FullUrl hat, die dem [RESTful-URL-Regex](http://hl7.org/fhir/references.html#regex) entspricht (z. B. "https://fhir.example.org/Observation/456"):
    * Extrahiert wird die [root] aus der fullUrl des Bundle-Entries und mit der relative Referenz zusammenangefügt (z. B. "https://fhir.example.org/" + "Patient/123" --> "https://fhir.example.org/Patient/123")
    * Gefolgt wird den Schritten für die Auflösung absoluter Referenzen. Siehe oben.

### Persistierung der menschenlesbaren Repräsentation

Das Narrative der Ressource KANN innerhalb einer DocumentReference-Ressource persistiert werden. Zum derzeitigen Zeitpunkt obliegt es der jeweiligen Implementierung wie diese DocumentReference Ressource ausgestaltet ist.
Ein Mapping der Composition-Metadaten auf DocumentReference-Metadaten KANN der FHIR Kernspezifikation entnommen werden. Siehe [Abschnitt "2.42.8.7 FHIR Composition"](https://www.hl7.org/fhir/documentreference-mappings.html#fhircomposition).

Das Narrative MUSS als Binary-Ressource unter DocumentReference.content.attachment.url angegeben werden.

**Hinweis:** Es ist zu beachten, dass in einem Attachment-Datentyp im Element "url" eine absolute URL anzugeben ist. Somit muss zunächst das Binary auf dem externen System per POST angelegt werden. Der hieraus resultierende Link kann anschließend im Attachment verwendet werden.

Falls ein Bundle erneut mit dem gleichen Bundle.identifier übermittelt wird, MUSS eine neue DocumentReference erstellt werden, welche unter DocumentReference.relatesTo.target angegeben wird.

### Hinweise zum Umgang mit strukturierten Daten

Auch wenn in der aktuellen Stufe nur die Übernahme der menschenlesbaren Repräsentation erforderlich ist, empfiehlt es sich dennoch, das vollständige Bundle samt der strukturierten Anteile zu einem Dokument zu persistieren, sodass zu einem späteren Zeitpunkt, wenn eine Übernahme einzelner Daten möglich ist, diese auch rückwirkend erfolgen kann.

---