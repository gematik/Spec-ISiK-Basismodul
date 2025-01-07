----

## Interaktion: Update von Metadaten

### Herstellung von Dokumentenkontext
Der Client muss zunächst die URL der DocumentReference ermitteln, auf die das Update angewendet werden soll. Hierzu kann die Interaktion {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/AkteureUndInteraktionen/AkteureUndInteraktionen-Dokumentenabfrage.md, text:Dokumentenabfrage}} verwendet werden.

### Metadatenupdate
Das Update der Metadaten erfolgt mittels der `$update-metadata` Operation.
Hinweis: Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE-MHD-Implementierungsleitfaden sieht kein Metadatenupdate vor. Hier müsste stets ein neues Dokument übermittelt werden.

Für den ISiK Use Case als maßgeblich relevant und unkritisch in Bezug auf die Versionierung hat sich jedoch das Element `docStatus`erwiesen, welches im IHE-Kontext keine Berücksichtigung findet. Im einrichtungsinternen Dokumentenaustausch kommt es häufig vor, dass sich der Status eines Dokumentes ändert (z.b. vorläufig -> final), ohne dass dies Auswirkungen auf den Inhalt hat. Die Anlage eines neuen Dokumentes wäre in diesem Kontext nicht effizient.

Daher spezifiziert ISiK eine geeignete Operation, die das gezielte Ändern des Dokumentenstatus ermöglicht.

### OperationDefinition `$update-metadata`

{{render:https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata}}

### Beispiel 

    [base]/DocumentReference/example/$update-metadata?docStatus=final


| Hinweis | Work in Progress!|
|---------|---------------------|
| {{render:Material/images/ig_bilder_Warning.jpg}} |  Die hier vorliegende Definition der Operation dient als Vorschlag, der auf Basis von Implementierungserfahrungen weiterentwickelt werden soll. Kritik, Feedback und Verbesserungsvorschläge, insbesondere Use Cases für das Update weiterer Metadaten-Elemente bitte im [ISiK-Community-Chat](https://chat.fhir.org/#narrow/stream/287581-german.2Fisik) diskutieren! |