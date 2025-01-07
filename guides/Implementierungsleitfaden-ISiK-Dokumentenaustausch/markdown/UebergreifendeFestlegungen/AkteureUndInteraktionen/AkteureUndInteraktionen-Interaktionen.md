----

## Interaktionen

### Dokumentenabfrage und -Zugriff (bestätigungsrelevant)
**Use Case:** Ein (webbasierter/mobiler) Client möchte Dokumente anhand definierter Kriterien abfragen.
Zur Dokumenten(-Metadaten)abfrage nutzt diese Spezifikation die SEARCH-Interaktionen auf der DocumentReference-Ressource gemäß der FHIR-Spezifikation.
Dabei MÜSSEN ausgewählte Suchparameter von Dokumentenservern verpflichtend unterstützt werden. Die Selektion erfolgt anhand der Relevanz der Parameter für die identifizierten Use Cases.
Der Zugriff auf die von den DocumentReferences verlinkten Dokumente (z.B. im PDF-Format) MUSS per READ-Interaktion auf der [Binary-Ressource gemäß ISIK-Spezifikation](https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_Binary?version=current) erfolgen.

### Dokumentenbereitstellung (bestätigungsrelevant)
**Use Case:** Ein (webbasierter/mobiler) Client möchte neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumentenserver übermitteln. Der Server MUSS Dokument und Metadaten entgegennehmen, diese persistieren und anschließend für die Dokumentabfrage und den -zugriff bereitstellen.

### Update von Dokumentenmetadaten (optional)
**Use Case:** Ein Client möchte die Metadaten eines Dokumentes ändern, ohne den Inhalt des Dokumentes selbst zu beeinflussen oder eine neue Version des Dokumentes hochladen zu müssen. Dies ist nur für eine stark eingeschränkte Menge von Elementen möglich. Der Server stellt dafür eine Operation zur Verfügung, deren Parameter den änderbaren Elementen entsprechen.

### Erzeugen von Dokumentenmetadaten (optional)
**Use Case:** Ein Client möchte ein gem. ISiK Basismodul Stufe 4 erzeugtes, strukturiertes, FHIR-basiertes Dokument an einen Dokumentenserver übermitteln.
Der Server stellt dazu eine Operation zur Verfügung, die aus den strukturierten Daten des Dokumentes die erforderlichen Metadaten extrahiert und dem Client eine entsprechend ausgefüllte `DocumentReference`-Ressource zurückgibt. Diese Operation kann von einem Dokumentenserver aber auch einem Drittsystem bereitgestellt werden.
