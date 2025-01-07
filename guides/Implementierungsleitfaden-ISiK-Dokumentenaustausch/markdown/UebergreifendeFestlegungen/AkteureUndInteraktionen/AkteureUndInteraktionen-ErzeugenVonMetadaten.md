----

## Erzeugen von Metadaten (IHE MHD ITI-106 Generate Metadata)

| Hinweis | Breaking Change!|
|---------|---------------------|
| {{render:Material/images/ig_bilder_Warning.jpg}} | Die in der Stufe 3 erfolgte Umstellung der Definition von $generate-metadata von der in ISiK Stufe 2 spezifizierten OperationDefinition auf die in [IHE MHD ITI-106](https://profiles.ihe.net/ITI/MHD/ITI-106.html) spezifizierte Fassung ist nicht kompatibel zu den Festlegungen dieses Moduls in Stufe 2! Die Änderung dient dem Zweck der Harmonisierung mit der IHE-MHD-Interaktion ITI-106 (Generate Metadata), die zum Zeitpunkt des Releases von Stufe 2 noch nicht zur Verfügung stand.  |

### Hinweise und Anmerkungen zur Implementierung von IHE MHD ITI-106 (Generate Metadata)
Für die Implementierung der Interaktion "Erzeugen von Dokumentenmetadaten" gelten die in IHE MHD festgelegten Vereinbarungen zu ITI-106 (Generate Metadata) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt.

#### [2:3.106.4.1 Generate Metadata Request Message](https://profiles.ihe.net/ITI/MHD/ITI-106.html#2310641-generate-metadata-request-message)

##### [2:3.106.4.1.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106411-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.1.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106412-message-semantics)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.1.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106413-expected-actions)
Der Fokus für die Implementierung der Operation ISiK-Kontext sollte auf dem Persistieren und Erzeugen von Metadaten für ISiK-konforme Bundles gemäß [Interaktion ISiK Modul Basis Stufe 4: Bericht aus Subsystem](https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_BerichtSubsystem?version=current) liegen. Für die Implementierung kann das unten angegeben ISiK-Spezifische Mapping Composition -> DocumentReference als Anhaltspunkt verwendet werden.

Die Unterstützung weiterer Input-Formate (z.B. CDA oder andere FHIR-Dokumente, wie MIOs, eRezept, eAU etc.) ist optional.

Alle weiteren Unterkapitel von 2:3.106.4.1.3 Expected Actions sind für den ISiK-Kontext nicht relevant.

#### [2:3.106.4.2 Generate Metadata Response Message](https://profiles.ihe.net/ITI/MHD/ITI-106.html#2310642-generate-metadata-response-message)

##### [2:3.106.4.2.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106421-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.2.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106422-message-semantics)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.2.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106423-expected-actions)
Die Vereinbarungen gelten uneingeschränkt.

#### [2:3.106.4.3 CapabilityStatement Resource](https://profiles.ihe.net/ITI/MHD/ITI-106.html#2310643-capabilitystatement-resource)
Es gelten die Vereinbarungen gemäß {{pagelink:ImplementationGuide/markdown/Datenobjekte/CapabilityStatement.md}}

#### [2:3.106.5 Security Considerations](https://profiles.ihe.net/ITI/MHD/ITI-106.html#231065-security-considerations)
Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Sicherheit](https://simplifier.net/isik-sicherheit-v3)


### ISiK-Spezifisches Mapping Composition -> DocumentReference
 @```
      from StructureDefinition
      where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten'
      for differential.element
      select
        Path: id,
        join mapping.where(identity = 'CompositionDocumentReferenceMapping') { map, comment }
      ```


## Abgrenzung zu ISiK Stufe 2 (Basis) bei der Kommunikation *strukturierter* Dokumente (FHIR-Document-Bundle)
### Interaktion ISiK Modul Basis Stufe 2: Bericht aus Subsystem
* Use Case: Client übermittelt diverse strukturierte Informationen in Form eines Dokumentes an einen Empfänger. Der Empfänger (oder ggf. dessen Benutzer) kann selbst entscheiden, welche Informationen übernommen und ggf. weiterverarbeitet werden können/sollen. Als Minimum muss die Narrative (die HTML-Repräsentation des gesamten Dokumentes) übernommen werden.
* HTTP-verb: POST auf [base]
* Content: Bundle vom Typ `document`
* erforderliches Verhalten: der Empfänger verarbeitet den Inhalt des Dokumentes (HTML + Ressourcen soweit möglich), das Original muss nicht zwingend persistiert werden. Es besteht kein zwingendes Erfordernis, dass das Dokument oder seine Inhalte über die API wieder bereitgestellt werden können. 

### Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung
* Use Case: Client übermittelt ein strukturiertes Dokument zur inhaltsagnostischen, dauerhaften, ggf. rechtssicheren Archivierung
* HTTP-verb: POST auf [base]/DocumentReference
* Content: DocumentReference mit Base64-codiertem Bundle vom Typ `document` eingebettet in DocumentReference.content.attachment.data)
* erforderliches Verhalten: das Dokument sowie seine Metadaten werden persistiert und über die API mittels der Interaktionen "Dokumentenabfrage" und "Dokumentenzugriff" bereitgestellt.

### Typische Szenarien mit Koexistenz beider Interaktionen:
Der Empfänger eines Subsystem-Berichtes gem. Modul "Basis" möchte vor der Verarbeitung des Dokumenteninhalts das Original zur Archivierung an einen Dokumentenserver gem. Modul "Dokumentenaustausch" übermitteln und die Herkunft der extrahierten Daten aus dem Dokument nachvollziehbar machen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/AkteureUndInteraktionen/AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung.md, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
3. Extraktion der verarbeitbaren Ressourcen aus dem Bundle
4. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](https://hl7.org/fhir/R4/provenance.html).

Der Sender eines Subsystem-Berichtes gem. Modul "Basis" möchte parallel zur Übermittlung an z.B. ein KIS zur Weiterverarbeitung der Informationen das Dokument ebenfalls im Original archivieren lassen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/AkteureUndInteraktionen/AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung.md, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
3. Übermittlung des Dokumentes zur Verarbeitung gemäß [Interaktion ISiK Modul Basis Stufe 4: Bericht aus Subsystem](https://simplifier.net/guide/isik-basis-v4jek/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_BerichtSubsystem?version=current)


Der Empfänger eines Dokumentes gem. Modul "Dokumentenaustausch" möchte neben der Archivierung des Dokumentes auch dessen Inhalte weiterverarbeiten.

Empfohlenes Vorgehen:
1. Entgegennahme und Persistierung des Original-Dokumentes gemäß {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/AkteureUndInteraktionen/AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung.md, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
1. Extraktion des Bundles aus den eingebetten Binärdaten
2. Extraktion der verarbeitbaren Ressourcen aus dem Bundle
3. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](https://hl7.org/fhir/R4/provenance.html).
