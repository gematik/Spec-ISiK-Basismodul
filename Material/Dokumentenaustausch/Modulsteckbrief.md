# Dokumentenaustausch

## Kurzbeschreibung
### Use-Cases
* Abruf von patientenbezogenen Dokumenten in Archiv- und Dokumentenverwaltungssystemen, ePAs, KISsen
* Einstellen von Dokumenten durch Sub- oder Portalsysteme in ein KIS- oder Dokumentenverwaltungssystem
* Integration von Archivsystemen in Primärsysteme
* Schaffung der Grundlagen  für eine kontinuierliche Weiterentwicklung (vom Erstellen und Abfragen strukturierter Metadaten zu unstrukturierten Dokumenten hin zu vollständiger Durchsuchbarkeit von strukturierten Daten in Dokumenten, gezielte Weiterverarbeitung strukturierter Daten aus Dokumenten mit Nachverfolgbarkeit der Herkunft, Erzeugung von strukturierten ad hoc Dokumenten.
#### Use Case a) Abfrage von Dokumenten
Ein Subsystem möchte eine Übersicht aller Dokumente zum einem Besuch anzeigen.
Für die Unterstützung dieses Use Cases definiert dieses Modul die zu unterstützenden Suchparameter für die FHIR-Ressource DocumentReference 
#### Use Case b) Einstellen eines Dokumentes
Ein Subsystem möchte einen Befund/Bericht in Form eines vorformatierten Dokumentes (z.B. Mikrobiologiebefund) an das Primärsystem übermitteln.
Für die Unterstützung dieses Use Cases wird die Datenrückübermittlung der IsiK Stufe 1 in diesem Modul auf unstrukturierte Dokumente (PDF, DOC, JPEG) ausgeweitet.
#### Use Case c) Weiterverarbeitung strukturierter Daten aus FHIR-basierten Dokumenten,
z.B. 
* Rückübermittlung aus Subsystemen gem. Isik Basis Stufe 1
* MIOs, die aus der ePA eines Patienten abgerufen wurden
* DiGa-Exporte
* ePflegebericht etc.

Ein Primärsystem möchte die in einem strukturierten Dokument enthaltenen Daten weiterverarbeiten, aber dabei die Herkunft der Daten für den Anwender nachvollziehbar machen.
Beispiel: Ein Primärsystem verfügt über einen Ablagebereich für Dokumente sowie Datenbankstrukturen zur Speicherung von Blutdruckmesswerten. Aus den strukturierten Messwerten dieser Tabelle kann eine Verlaufskurve erzeugt und dem Benutzer dargestellt werden. 
##### Variante 1: Vom Primärsystem verarbeitbare Daten aus Dokumenten (aus Fremdsystemen) werden automatisch in die Blutdrucktabelle übernommen und in der Verlaufskurve angezeigt, sofern das Dokument aus einer vertrauenswürdiger Quelle stammt und die Blutdruck-Ressource valide ist.
##### Variante 2: Bei der Entgegennahme von Dokumenten (aus unbekannten oder weniger vertrauenswürdigen Quellen) analysiert das Primärsystem deren Inhalt und bietet dem Anwender die validen Blutdruckmesswerte zur Übernahme in die Kurve an. Die Entscheidung obliegt dem Anwender, ob die Daten übernommen werden sollen.
Für die Unterstützung dieses Use Cases beschreibt dieses Modul den Umgang mit strukturierten FHIR-basierten Dokumenten und der Extraktion der darin enthaltenen Ressourcen unter Beibehaltung des unveränderten Originaldokumentes und Kenntlichmachung der Herkunft der übernommenen Daten.

#### relevante Use Cases aus KHZG
FTB 2.A:

\[...\]es den Patientinnen und Patienten ermöglichen, ihre Behandlungsunterlagen sowie weitere zur Aufnahme und Behandlung relevante Daten und Unterlagen, insbesondere den bundeseinheitlichen Medikationsplan (Barcode-Scan zur strukturieten Weiterverarbeitung), vorab online hochzuladen, oder dem Leistungserbringer im Rahmen einer vom Patienten oder der Patientin digital erteilten temporären Berechtigung (Consent) den Zugriff auf diese Daten (z. B. in einer existierenden elektronischen Akte) zu ermöglichen,
\[...\]

\[...\]es vorgelagerten Leistungserbringern ermöglichen, Überweisungsscheine bereits vorab online der Klinik zukommen zu lassen,\[...\]

\[...\]Schnittstellen zu bestehenden KIS und/oder ERP-Systemen vorweisen, sodass die digital erfassten Daten der Patientin/des Patienten auch für nachgelagerte organisatorische Prozesse sowie Prozesse der Ressourcenplanung (z. B. Personalplanung oder Bettenmanagement) automatisch und interoperabel zur Verfügung stehen.\[...\]

## weitere potentielle Features 
### genannt von Teilnehmern der Auftaktveranstaltung am 16.07.
* Bildübertragung (ImagingStudy) -> sollte aufgrund der geringen Überlappung zum Dokumentenaustausch (ImagingStudy vs. DocumentReference) in separatem Modul behandelt werden (Stufe 4?). Die Kommunikation von Nicht-DICOM-Objekten (JPEG, PNG etc.) fällt jedoch in den Scope des Dokumenten-Moduls. 
* Signaldatenübertragung (EKG/EEG) -> sollte im Modul "Vitalparameter" behandelt werden, da ess ich um eine Serie von Messwerten (Observation mit SampledData) handelt, es sei denn, die Übertragung erfolgt in unstrukturierter Form (PDF o.ä.).
### Dokumentenaustausch via KIM
Gemeinsam mit dem KIM-Team der Gematik sollen BestPractice-Empfehlungen für die Kommunikation von FHIR-basierten Dokumenten via KIM erarbeitet werden, u.a.
* Persistieren von Sender- und Empfänger-Daten im Dokument
* Beschreibung des Zusammenhangs zwischen KIM-Metadaten (z.B. Dienstkennung) und Dokumentenmetadaten 
* Umgang mit Fehlermeldungen
### Abbildung von Einwilligungen zum Dokumentenaustausch
z.B. in Richtung Patientenportal oder ePA

## Bezug KHZG
Fördertatbestand 2: Patientenportale (§ 19 Abs. 1 Satz 1 Nr. 2 KHSFV): 
* Dokumentenupload und bundeseinheitlicher Medikationsplan

## Bestätigungsrelevante Systeme (DRAFT!)
Die Implementierung dieses Moduls ist verpflichtend für alle Systeme, die strukturierte FHIR-basierte Dokumente _**oder **_ unstrukturierte Dokumente (PDF, DOC, JPEG) im Sinne einer elektronischen Patientenakte speichern.


## Relevante Spezifikationen
z.B.
* [IHE-MHD(ci)](https://build.fhir.org/ig/IHE/ITI.MHD/)
* [IHE-MHD(4.0.1)](https://profiles.ihe.net/ITI/MHD/)
* [MHDS](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_MHDS.pdf) QEDm, mXDE (Use-Case-Beschreibung, Austauschverfahren)
* [IHE-PMIR](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_PMIR.pdf) (Beschreibung von "merge" auf Seite 43 ff.)
* KBV-MIOs (Mio-Metadaten und ePA-API, Attachments zu Mios)
* [KBV AWS](https://simplifier.net/pvs-archivierungs-undwechselschnittstelle/kbvprawanlage)
* Gematik ePA-Schnittstelle (IHE-XDS) und deren Migrationspfad nach FHIR
* IHE-DE ValueSets (Terminologie)
* [KDL(Terminologie)](https://simplifier.net/KDL)
* [Argonaut Write (?)](https://confluence.hl7.org/display/AP/Argo+Write+Homepage)

## Datenobjekte/FHIR-Ressourcen
### aus anderen Modulen

* [Patient](https://simplifier.net/isik/isikpatient) (Basis)
* [Encounter](https://simplifier.net/isik/isikencounter) (Basis)
* [Bundle](https://simplifier.net/isik/isikberichtbundle)/[Composition](https://simplifier.net/isik/isikberichtsubsysteme) (Basis)

### neue Datenobjekte
* [DocumentReference](https://hl7.org/fhir/R4/DocumentReference) In MHD >4.0.0 durch List ersetzt
* ~~[DocumentManifest (?)](https://hl7.org/fhir/R4/DocumentManifest)~~ In MHD >4.0.0 durch List ersetzt
* [List](https://hl7.org/fhir/R4/List)
* [Binary](https://hl7.org/fhir/R4/Binary)
* [Provenance](https://hl7.org/fhir/R4/Provenance)


## Potentielle Probleme/Risiken
* technologisch inkompatibel zur derzeitigen Gematik-ePA-Schnittstellenspezifikation, inhaltliche Kompatibilität sollte jedoch angestrebt werden um einen Migrationspfad zu ermöglichen.
* wird derzeit einrichtungsintern und -übergreifend bereits mit IHE-XDS/HL7 MDM abgebildet (??)
Kann mittels Bridge angebunden werden:
![Quelle: https://wiki.ihe.net/index.php/Mobile_access_to_Health_Documents_(MHD)](https://wiki.ihe.net/images/e/e9/Slide1.PNG)
* DiGa-Export-Format (noch) nicht spezifiziert (Work in Progress bei BfArm/Gematik/KBV)
* inkompatibel mit derzeit genutzen (strukturierten) Formaten für den bundeseinheitlichen Medikationsplan (xml zu FHIR-Komvertierung im Rahmen des MPP Projektes basiert noch auf FHIR STU3)
* KIS-Systeme verlangen stets(?) den Fallbezug klinischer Dokumente. Dieser ist jedoch bei IHE-MHD nicht berücksichtigt und insbesondere bei den Dokumenten in der ePA nicht enthalten. Bei den Use Cases des KHZG (Portale, Terminplanung) könnten sogar Dokumente entstehen, die sich auf im KIS noch nicht angelegte Patienten beziehen. Diese Konstellationen sollten berücksichtigt werden.


