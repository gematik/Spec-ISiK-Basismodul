## Dokumentenabfrage und -zugriff

### Dokumentenabfrage (IHE MHD ITI-67 (Find DocumentReferences))
Dokumente können anhand ihrer Metadaten gesucht werden. Im Rahmen der ISiK-Spezifikation müssen mindestens die im Kapitel {{pagelink:ImplementationGuide/markdown/Datenobjekte/DocumentReference/DocumentReference_Interaktionen.md}}
mit `MUSS` gekennzeichneten Suchparameter unterstützt werden. Einzelnen Systemen steht es frei, darüber hinaus weitere FHIR-konforme Suchparameter zu implementieren.

Die Ergebnisse einer Suchanfrage werden in Form eines Bundles zurückgegeben:
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenSuchergebnisse, hybrid}}

Suchergebnisse können zahlreich sein. Server MÜSSEN daher [FHIR-konformes Paging](https://hl7.org/fhir/R4/http.html#paging) unterstützen. Server KÖNNEN im SearchSet-Bundle auch Ressourcen vom Typ [OperationOutcome](https://hl7.org/fhir/R4/operationoutcome.html) mit Informationen über die Suchergebnisse zurückgeben. Diese müssen in `Bundle.entry.search.mode` mit dem Wert `outcome` gekennzeichnet sein. Die Issues im OperationOutcome dürfen nur dem Schweregrad `information` oder `warning` entsprechen.
Issues vom Schweregrad `error` oder `fatal` sind unzulässig.

### Hinweise und Anmerkungen zur Implementierung von [IHE MHD ITI-67 (Find DocumentReferences)](https://profiles.ihe.net/ITI/MHD/ITI-67.html)

Für die Implementierung der Interaktion "Dokumentenabfrage" gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-67 (Find DocumentReferences)](https://profiles.ihe.net/ITI/MHD/ITI-67.html) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt.

#### [2:3.67.4.1 Find Document References Request Message](https://profiles.ihe.net/ITI/MHD/ITI-67.html#236741-find-document-references-request-message)

##### [2:3.67.4.1.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-67.html#2367411-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.

##### [2:3.67.4.1.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-67.html#2367412-message-semantics)
Es gelten darüber hinaus die allgemeinen Festlegungen zu Suchparametern gemäß [ISiK Basisprofil Stufe 4](https://simplifier.net/guide/isik-basis-v4/UebergreifendeFestlegungen-UebergreifendeFestlegungen-Suchparameter?version=current)

##### [2:3.67.4.1.2.1 Query Search Parameters](https://profiles.ihe.net/ITI/MHD/ITI-67.html#23674121-query-search-parameters)
Im Rahmen der ISiK-Spezifikation müssen mindestens die im Kapitel {{pagelink:ImplementationGuide/markdown/Datenobjekte/DocumentReference/DocumentReference_Interaktionen.md}}
mit `MUSS` gekennzeichneten Suchparameter unterstützt werden. Einzelnen Systemen steht es frei, darüber hinaus weitere FHIR-konforme bzw in IHE MHD geforderte Suchparameter zu implementieren.

Die in IHE bestehende Verpflichtung für Clients, bei jeder Query mindestens einen der Parameter `patient` oder `patient.identifier` verwenden zu müssen, besteht im ISiK-Kontext nicht. Patientenübergreifende Suchanfragen sind zulässig. 

##### [2:3.67.4.1.2.2 Populating Expected Response Format](https://profiles.ihe.net/ITI/MHD/ITI-67.html#23674122-populating-expected-response-format)
Die Vereinbarungen gelten uneingeschränkt.

##### [2:3.67.4.1.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-67.html#2367413-expected-actions)
Die Vereinbarungen gelten uneingeschränkt.

##### [2:3.67.4.1.3.1 XDS on FHIR Option](https://profiles.ihe.net/ITI/MHD/ITI-67.html#23674131-xds-on-fhir-option)
Die Implementierung der "XDS on FHIR"-Option ist im ISiK-Kontext nicht gefordert.
  
  
#### [2:3.67.4.2 Find Document References Response Message](https://profiles.ihe.net/ITI/MHD/ITI-67.html#236742-find-document-references-response-message)
##### [2:3.67.4.2.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-67.html#2367421-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.67.4.2.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-67.html#2367422-message-semantics)
* Suchergebnisse können zahlreich sein. Server MÜSSEN daher [FHIR-konformes Paging](https://hl7.org/fhir/R4/http.html#paging) unterstützen. Server KÖNNEN im * SearchSet-Bundle auch Ressourcen vom Typ [OperationOutcome](https://hl7.org/fhir/R4/operationoutcome.html) mit Informationen über die Suchergebnisse zurückgeben. Diese müssen in `Bundle.entry.search.mode` mit dem Wert `outcome` gekennzeichnet sein. Die Issues im OperationOutcome dürfen nur dem Schweregrad `information` oder `warning` entsprechen. Issues vom Schweregrad `error` oder `fatal` sind unzulässig.
* Das Ergebnis-Bundle der Suche muss konform sein zum Profil "ISiKDokumentenSuchergebnisse"{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenSuchergebnisse, hybrid}}

##### [2:3.67.4.2.2.1 DocumentReference Resource Contents](https://profiles.ihe.net/ITI/MHD/ITI-67.html#23674221-documentreference-resource-contents)
* Die DocumentReference-Ressoucen müssen im ISiK-Kontext auf Basis des Profils "ISiKDokumentenMetadaten" und den dort vereinbarten Kardinalitäten bzw. MustSupport-Flags erstellt werden.

##### [2:3.67.4.2.2.1.1 Document Location](https://profiles.ihe.net/ITI/MHD/ITI-67.html#236742211-document-location)
Die Vereinbarungen gelten uneingeschränkt.

Alle weiteren Unterkapitel von [2:3.67.4.2.2.1 DocumentReference Resource Contents](https://profiles.ihe.net/ITI/MHD/ITI-67.html#23674221-documentreference-resource-contents) sind für den ISiK-Kontext nicht relevant.

#### [2:3.67.4.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-67.html#236743-expected-actions)
Die Vereinbarungen gelten uneingeschränkt.

#### [2:3.67.4.4 CapabilityStatement Resource](https://profiles.ihe.net/ITI/MHD/ITI-67.html#236744-capabilitystatement-resource)

Es gelten die Vereinbarungen gemäß {{pagelink:ImplementationGuide/markdown/Datenobjekte/CapabilityStatement.md}}

#### [2:3.67.5 Security Considerations](https://profiles.ihe.net/ITI/MHD/ITI-67.html#23675-security-considerations)
Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Sicherheit](https://simplifier.net/isik-sicherheit-v3).


### Dokumentenzugriff (IHE MHD ITI-68 (Retrieve Document))

Das den Metadaten zugeordnete Dokument kann jeweils unter `DocumentReference.content.attachment.url` vom Server abgerufen werden.

### Hinweise und Anmerkungen zur Implementierung von [IHE MHD ITI-68 (Retrieve Document)](https://profiles.ihe.net/ITI/MHD/ITI-68.html)

Für die Implementierung der Interaktion "Dokumentenzugriff" gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-68 (Retrieve Document)](https://profiles.ihe.net/ITI/MHD/ITI-68.html) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt.

#### [2:3.68.4.1 Retrieve Document Request Message](https://profiles.ihe.net/ITI/MHD/ITI-68.html#236841-retrieve-document-request-message)

##### [2:3.68.4.1.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-68.html#2368411-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.

##### [2:3.68.4.1.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-68.html#2368412-message-semantics)
Der einzige MIME-Type, den alle Dokumentenserver verpflichtend zurückgeben können MÜSSEN, ist der MIME Type, der dem `DocumentReference.content.attachment.contentType` entspricht.

Im ISiK-Kontext SOLLEN Dokumentenserver das Dokument darüber hinaus über einen [Binary-Endpunkt](https://hl7.org/fhir/R4/binary.html) bereitstellen können. Dieser verfügt über folgende Besonderheit:

* Wenn der Zugriff mit dem Accept-Header `application/fhir+xml` oder `application/fhir+json` erfolgt, müssen die Daten als [Binary-Ressource im angeforderten Format](https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_Binary?version=current) zurückgegeben werden.
* Wenn der Zugriff mit einem *anderen* Accept-Header als `application/fhir+xml` oder `application/fhir+json` erfolgt, so soll das Dokument im angeforderten Format zurückgegeben werden,
z.B. MUSS bei Zugriffen mit Accept-Header `application/pdf` das Dokument unmittelbar als PDF zurückgegeben werden, sofern dies dem Content-Type der Binary-Ressource entspricht.

##### [2:3.68.4.1.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-68.html#2368413-expected-actions)
Die Vereinbarungen gelten uneingeschränkt.

#### [2:3.68.4.2 Retrieve Document Response Message](https://profiles.ihe.net/ITI/MHD/ITI-68.html#236842-retrieve-document-response-message)
Die Vereinbarungen dieses Kapitels und aller Unterkapitel gelten uneingeschränkt.

##### [2:3.68.4.2.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-68.html#2368421-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.68.4.2.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-68.html#2368422-message-semantics)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.68.4.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-68.html#2368423-expected-actions)
Die Vereinbarungen gelten uneingeschränkt.

##### [2:3.68.4.4 CapabilityStatement Resource](https://profiles.ihe.net/ITI/MHD/ITI-67.html#236843-capabilitystatement-resource)
Es gelten die Vereinbarungen gemäß {{pagelink:ImplementationGuide/markdown/Datenobjekte/CapabilityStatement.md}}

#### [2:3.68.5 Security Considerations](https://profiles.ihe.net/ITI/MHD/ITI-68.html#23685-security-considerations)
Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Sicherheit](https://simplifier.net/isik-sicherheit-v3)

