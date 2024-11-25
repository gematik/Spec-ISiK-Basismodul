---
topic: UebergreifendeFestlegungen-BestaetigungsrelevanteSysteme
---
# Bestätigungsrelevante Systeme

Gemäß §373 (2) SGB V legt das Kompetenzzentrum für Interoperabilität im Gesundheitswesen (KIG) gegenwärtig die Definition der bestätigungsrelevanten Systeme fest. 

# **Definition Bestätigungsrelevante Systeme**
# **Allgemein**
Für den Austausch von versorgungsrelevanten Daten in Krankenhäusern erarbeitet die gematik einen verbindlichen Standard über eine standardisierte Schnittstelle für informationstechnische Systeme in Krankenhäusern (ISiK). Damit kommt sie ihrem gesetzlichen Auftrag nach § 373 SGB V nach. 
Die standardisierte Schnittstellen-Festlegung ISiK wird in Modulen veröffentlicht. An dieser Stelle werden die Festlegungen für die bestätigungsrelevanten IT-Systeme anhand definierter Akteure getroffen.

Bei bestätigungsrelevanten IT-Systemen in ISiK handelt es sich stets um Software-Systeme, die versorgungsrelevante Daten verarbeiten oder dauerhaft speichern. Ausgenommen sind Software-Produkte, die ausschließlich zur redundanten Datenspeicherung und -wiederherstellung eingesetzt werden. Wenn im Folgenden die Rede ist von einem *primären, dauerhaften Ort zur Speicherung und Verwaltung von Daten*, so ist damit im Sinne einer Single Source of Truth (führendes System) ein allgemeingültiger Datenbestand gemeint.

Versorgungsrelevante Daten sind administrative Daten (z.B. Alter des Patienten, Name der Einrichtung, Arztnummer usw.) sowie Daten zu klinischen Verfahren (z.B. Prozeduren-Codes), Diagnostik (z.B. Laborbefunde), Medikation (z.B. Medikamenten-Verordnung) und Abrechnung (z.B. Versicherungsverhältnis).

Es wird eine Kategorisierung der bestätigungsrelevanten Subsysteme entlang von definierten Akteuren und des groben Funktionsumfangs von Produkten im Markt angestrebt. In diesem Sinne sind die unten gelisteten **Definitionen** als Funktionsklärungen zu verstehen. Ein Akteur ist zu verstehen als ein System, das in einer bestimmten Rolle fungiert. Der **Geltungsbereich** konkretisiert wiederum die Definition in Bezug auf Produktkategorien. Der **normative Status** wird schließlich tabellarisch unter den entsprechenden Abschnitten zur **Bestätigungsrelevanz** aufgeführt. 

Eine weitere Detaillierung zu den einzelnen Festlegungen und Anforderungen, die im Rahmen des Bestätigungsverfahrens geprüft werden, erfolgt ggf. in entsprechenden Abschnitten des Implementierungsleitfadens der einzelnen Module. Eine technische Aufbereitung der Anforderungen in der REST-API erfolgt in der (FHIR-Ressource) CapabilityStatement.

An dieser Stelle werden Festlegungen getroffen, die folgende ISiK-Module betreffen:

- Basismodul
- Dokumentenaustausch
- Vitalparameter und Körpermaße
- Terminplanung
- Medikation

Das Support-Modul Labor stellt Profile bereit, die im Kontext anderer Module bestätigungsrelevant sein können, ist als Modul selbst jedoch nicht bestätigungsrelevant.

+++++++++++++++++++++++++++++
# **Basismodul**
## **Akteur: Basis-Server**
### **Definition**
Der Akteur "Basis-Server" im Sinne des ISiK-Moduls "Basis" ist ein System, das versorgungsrelevante Daten für andere Applikationen (Akteur: Basis-Client) über eine FHIR R4 REST API nach ISiK zur Abfrage und Weiternutzung bereitstellt.

Nicht-normative Erläuterung in Bezug auf IHE Festlegungen (genaueres in den ISIK Implementation Guides): Der Basis-Server nimmt im IHE-PDQm-Kontext die Rolle des Akteurs *Patient Demographics Supplier* und im IHE-QEDm-Kontext die Rolle des Akteurs *Clinical Data Source* ein*.*
### **Geltungsbereich**
Als Basis-Server gelten in diesem Kontext Systeme, die strukturierte, versorgungsrelevante Daten über Schnittstellen entgegennehmen oder selbst erstellen und als primärer, dauerhafter Ort zur Speicherung und Verwaltung dieser Daten während der Patientenversorgung im Krankenhaus dienen.

Dies betrifft u.a.:

- KIS-Systeme
- Clinical Data Repository
- Abrechnungssysteme, sofern diese als führende Systeme für die Speicherung und Verwaltung versorgungsrelevanter Daten genutzt werden
## **Akteur: Basis-Client**
### **Definition**
Der Akteur "Basis-Client" im Sinne des ISiK-Moduls "Basis" ist ein System, das versorgungsrelevante Daten von einem Basis-Server abfragt. Der vorrangige Zweck des Abrufs dieser versorgungsrelevanten Daten ist sie einem Anwender anzuzeigen, um eine redundante Erfassung zu vermeiden oder sie in internen Prozesse zu verarbeiten. Auch das Aufrufen von strukturierten Workflows zur Erstellung, Manipulation (Ändern, Anreichern etc.) und Synchronisation der zuvor genannten Daten kennzeichnet "Basis-Clients".

Dabei können sie die für die Server verpflichtend festgelegten Suchkriterien beliebig kombinieren. Basis-Clients sind nicht verpflichtet, alle von den Servern geforderten Suchkriterien zu unterstützen. Weiterhin können Basis-Clients neu erstellte patientenbezogene Daten in Form eines strukturierten FHIR-Dokumentes an Basis-Server übermitteln, sofern diese die entsprechende Interaktion unterstützen. Dabei müssen sie jedoch mindestens die in diesem Modul verpflichtend festgelegten Metadaten zu den Dokumenten sowie eine HTML-Repräsentation (Narrative) bereitstellen. 

Nicht-normative Erläuterung in Bezug auf IHE Festlegungen (genaueres in den ISIK Implementation Guides): Der Basis-Client nimmt im IHE-PDQm-Kontext die Rolle des Akteurs *Patient Demographics Consumer* und im IHE-QEDm-Kontext die Rolle des Akteurs *Clinical Data Consumer* ein*.*
### **Geltungsbereich**
Als Basis-Clients gelten in diesem Kontext alle Systeme, die strukturierte versorgungsrelevante Daten von anderen Systemen abfragen. Basis-Clients gelten *nicht* als primärer, dauerhafter Speicherort für die abgefragten Daten.

Dies betrifft u.a. :

- Systeme, die Patientenstammdaten nicht über eine HL7 V2-Datenstrom empfangen, sondern diese bei Bedarf im patientenführenden System abfragen möchten
- Systeme, die versorgungsrelevante Daten in anderen Systemen abfragen möchten, um redundante Datenerfassung zu verhindern
- Systeme, die Daten aus anderen Systemen abfragen möchten, um sie Anwendern oder Prozessen bedarfsgerecht zur Verfügung zu stellen zu können, ohne diese redundant speichern zu müssen

## **Bestätigungsrelevanz**
Tabellarisch gelistet wird hier die Bestätigungsrelevanz in Bezug auf die zuvor definierten Akteure:

|**Akteur**|**konkrete Anforderungen**|**bestätigungsrelevant**|
| :-: | :-: | :-: |
|Basis-Server|<https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-CapabilityStatement?version=current>|ja|
|Basis-Client|keine|nein|
# **Dokumentenaustausch**
## **Akteur: Dokumenten-Server**
### **Definition**
Der Akteur "Dokumenten-Server" im Sinne des ISiK-Moduls "Dokumentenaustausch" ist ein System, das (potentiell) versorgungsrelevante Dokumente über eine FHIR R4 API nach ISIK von anderen Applikationen (Akteur: Dokumenten-Client) entgegennimmt, speichert und Dokumenten-Clients zur Abfrage und Weiternutzung zur Verfügung stellt.

Nicht-normative Erläuterung in Bezug auf IHE Festlegungen (genaueres in den ISIK Implementation Guides): Der Dokumenten-Server nimmt im Kontext der [Spezifikation IHE ITI Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) die Rollen der Akteure [Document Recipient](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133113-document-recipient) und [Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder) ein und implementiert die IHE-MHD-Interaktionen gemäß Version 4.2.0

- Simplified Publish [ITI-105] (verpflichtend)
- Generate Metadata [ITI-106] (optional)
- Find Document References [ITI-67] (verpflichtend)
- Retrieve Document [ITI-68] (verpflichtend)
### **Geltungsbereich**
Als Dokumenten-Server gelten in diesem Kontext alle Systeme, die strukturierte und/ oder unstrukturierte versorgungsrelevante Dokumente über Schnittstellen entgegennehmen oder selbst erstellen und als primärer, dauerhafter Ort zur Speicherung und Verwaltung dieser Dokumente dienen.

Dies betrifft u.a.:

- KIS-Systeme mit integrierter Dokumentenverwaltung
- Archivsysteme, sofern diese nicht ausschließlich zur Umsetzung einer Backup-Lösung genutzt werden
- Dokumentenverwaltungssysteme (DMS), sofern diese zur Speicherung von versorgungsrelevante Dokumenten (s.o. zu versorgungsrelevante Daten) verwendet werden
## **Akteur: Dokumenten-Client**
### **Definition**
Der Akteur "Dokumenten-Client" im Sinne des ISiK-Moduls "Dokumentenaustausch" ist ein System, das Dokumente von einem Dokumenten-Server abfragt, um sie z.B. einem Anwender anzuzeigen. Dabei können sie die für die Server verpflichtend festgelegten Suchkriterien beliebig kombinieren. Dokumenten-Clients sind nicht verpflichtet, alle von den Servern geforderten Suchkriterien zu unterstützen. Weiterhin können Dokumenten-Clients neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumenten-Server übermitteln. Dabei müssen sie jedoch mindestens die in diesem Modul verpflichtend festgelegten Metadaten zu den Dokumenten bereitstellen. Sowohl die Implementierung der Interaktion "Dokumentenabfrage" als auch "Dokumentenbereitstellung" sind für Dokumenten-Clients optional.

Nicht-normative Erläuterung in Bezug auf IHE Festlegungen (genaueres in den ISIK Implementation Guides): Der Dokumenten-Client nimmt agiert IHE-MHD-Kontext als Akteur [Document Source](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133111-document-source) und [Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133112-document-consumer) ein und implementiert die IHE-MHD-Interaktionen

- Simplified Publish [ITI-105] (optional)
- Generate Metadata [ITI-106] (optional)
- Find Document References [ITI-67] (optional)
- Retrieve Document [ITI-68] (optional)
### **Geltungsbereich**
Als Dokumenten-Clients gelten in diesem Kontext alle Systeme, die strukturierte und/oder unstrukturierte versorgungsrelevante Dokumente erstellen und über Schnittstellen kommunizieren oder solche Dokumente von Dokumenten-Servern abfragen. Dokumenten-Clients gelten *nicht* als primärer, dauerhafter Speicherort für die erstellten oder abgefragten Dokumente.

Dies betrifft u.a.:

- Anwendersysteme, die medizinischem Personal den bedarfsgerechten Zugang zu versorgungsrelevanten, andernorts gespeicherten Dokumenten ermöglichen
- Telekonsil-System gemäß § 31a BMV-Ä die Dokumente von Dokumenten-Servern abfragen und zur Verwendung in Telekonsilien bereitstellen
- KIM-Client-Anwendungssoftware, die Dokumente aus Anhängen an KIM-Nachrichten zur Speicherung an Dokumenten-Server übermitteln und/oder Dokumente von Dokumenten-Servern abfragen, um sie im Anhang an KIM-Nachrichten zu versenden
## **Bestätigungsrelevanz**
Tabellarisch gelistet wird hier die Bestätigungsrelevanz in Bezug auf die zuvor definierten Akteure:

|**Akteur**|**konkrete Anforderungen**|**bestätigungsrelevant**|
| :-: | :-: | :-: |
|Dokumenten-Server|<https://simplifier.net/guide/isik-dokumentenaustausch-v4/ImplementationGuide-markdown-Datenobjekte-CapabilityStatement?version=current>|ja|
|Dokumenten-Client|keine|nein|
# **Vitalparameter und Körpermaße**
## **Akteur: Vitalparameter-Server**
### **Definition**
Der Akteur "Vitalparameter-Server" im Sinne des ISiK-Moduls "Vitalparametern und Körpermaße" ist ein System, das versorgungsrelevante Daten für andere Applikationen (Akteur: Vitalparameter-Client) über eine FHIR R4 REST API nach ISiK zur Abfrage und Weiternutzung zur Verfügung stellt und persistiert.

Nicht-normative Erläuterung in Bezug auf IHE Festlegungen (genaueres in den ISIK Implementation Guides): Analog zum ISiK Basismodul ist ein Vitalparameter-Server im Modul Vitalparameter weitgehend analog zu IHE QEDm '*Clinical Data Source'* zu betrachten.
### **Geltungsbereich**
Als Vitalparameter-Server gelten in diesem Kontext alle Systeme, die strukturierte versorgungsrelevante Daten über eine Schnittstellen bereitstellen, verarbeiten und als primärer, dauerhafter Speicherort dieser Daten dienen.

Systeme, die als Vitalparameter-Server agieren sind u.a.:

- KIS mit Funktion elektronische Kurve bzw. entsprechendes KIS-Modul
- Patientendaten-Managementsystem (PDMS) [z.B. für Intensivbereiche]
- Clinical Data Repository
- Elektronische Kurve [z.B. für die Verwendung auf Normal-Stationen]
## **Akteur: Vitalparameter-Client**
### **Definition**
Im Kontext des Moduls Vitalparameter und Körpermaße fragen Vitalparameter-Clients versorgungsrelevante Daten von einem Vitalparameter-Server ab (entspricht weitgehend einem IHE QEDm Akteur  *Clinical Data Consumer)*, um sie z.B. einem Anwender anzuzeigen oder mittels dedizierter Software zu verarbeiten, z.B. zur Entscheidungsunterstützung. Vitalparameter-Clients sind nicht verpflichtet, alle von den Vitalparameter-Servern geforderten Suchkriterien zu unterstützen.
### **Geltungsbereich**
Als Vitalparameter-Clients gelten in diesem Kontext alle Systeme, die strukturierte versorgungsrelevante Daten über eine Schnittstelle abfragen oder kommunizieren. Vitalparameter-Clients gelten *nicht* als primärer, dauerhafter Speicherort für die versorgungsrelevante Daten.

Vitalparameter-Clients sind zum Beispiel:

- Elektronische Kurve [z.B. für die Verwendung auf Normal-Stationen]

Dabei ist zu beachten, dass auch Systeme, die oben als Akteur 'Vitalparameter-Server' gelistet sind, zusätzlich als Akteur 'Vitalparameter-Client' agieren können. Insbesondere für die Unterstützung zwischen Überleitungs-Workflows gilt dies für:

- KIS
- PDMS
## **Bestätigungsrelevanz**
Bestätigungsrelevant im Kontext des Moduls Vitalparameter sind alle Software-Produkte, die eine Teilmenge der in diesem Modul in Form von FHIR-Profilen definierten Daten zu klinischen Vitalparametern und Körpermaßen verarbeiten und dauerhaft speichern (die Bestätigung wird dann ggf. nur für eine Teilmenge der Datenschemata erfolgen): auch wenn z.B. nur ein Profil für die Schnittstelle umgesetzt werden MUSS (z.B. im hypothetischen Falle, dass ein System nur dieses unterstützt ), ist der "Vitalparameter-Server" bestätigungsrelevant (für dieses eine Profil).

Tabellarisch gelistet wird hier die Bestätigungsrelevanz in Bezug auf die zuvor definierten Akteure:

|**Akteur**|**konkrete Anforderungen**|**bestätigungsrelevant**|
| :-: | :-: | :-: |
|Vitalparameter-Server|<https://simplifier.net/guide/isik-vitalparameter-v4?version=current>|ja|
|Vitalparameter-Client|keine|nein|
# **Terminplanung**
## **Akteur: Termin-Repository**
### **Definition**
Der Akteur "Termin-Repository" im Sinne des ISiK-Moduls "Terminplanung" ist ein System, das Informationen zu verfügbaren Termineinheiten von Ressourcen (z.B. Ambulanzen, Leistungsstellen, Mitarbeiter, Geräte und Räume) vorhalten und die dafür vereinbarten Termine über eine FHIR R4 REST API nach ISiK zur Abfrage und Weiternutzung zur Verfügung stellt und verwaltet. Das Termin-Repository gilt stets als autoritative Quelle zur Verwaltung von Termindaten und ist damit als ein patientenführendes System zu verstehen.
### **Geltungsbereich**
Systeme, die als Termin-Repository agieren sind u.a.:

- Patietenportal im Falle, dass das System selbst terminführend ist
- terminführenden Systeme, z.B. KIS oder auch Klinische Arbeitsplatz-Systeme (KAS) inkl. Terminverwaltung
- PDMS, die Termine verwalten
## **Akteur: Termin-Requestor (Termin-Source)**
### **Definition**
Als Termin-Requestor (in Anlehnung an die IHE Terminologie auch als Termin-Source zu bezeichnen) werden alle Client-Systeme definiert, die mittels Schnittstellenanfrage zur Erhebung und Veränderung von Termininformationen dienen. Der Termin-Requestor übernimmt die Koordination der Schnittstellenaufrufe per FHIR R4 REST API nach ISiK, um einen Termin zu buchen. Das Termin-Requestor allein gilt *nicht* als autoritative Quelle zur Verwaltung von Termindaten., d.h. sofern der Termin-Requestor Termindaten von einem Termin-Repository synchronisiert und speichert/cached, sollten diese Termindaten nicht als solche verbindlich für einen mögliche Weiterverbreitung gelten, es muss vielmehr sichergestellt werden, dass die Daten mit denen des Quellsystems (Termin-Repository) übereinstimmen.
### **Geltungsbereich**
Systeme, die als Termin-Requestor agieren sind u.a.:

- Mobile Apps zur Verwaltung von Terminen
- Patientenportal bei der Synchronisierung mit einem weiteren Termin-Repository
- KIS / KAS bei der Synchronisierung mit einem weiteren Termin-Repository
## **Termin-Consumer**
### **Definition**
Als Termin-Consumer werden alle System definiert, die Termininformationen abfragen, um diese einem Benutzer zu präsentieren. Ein Termin-Consumer verfügt in der Regel über keine permanente Persistierung der abgefragten Informationen. Durch den Termin Consumer erfolgt explizit nur die Aufbereitung und Präsentation der Termininformationen. Eine anderweitige Verarbeitung der Termininformationen fällt in die Kategorie der Termin-Repositories und Termin-Requestors.
### **Geltungsbereich**
Systeme, die als Termin-Consumer agieren sind u.a.:

- Apps zum Anzeigen eines Kalenders
- Systeme zum Versenden von Benachrichtigungen im Kontext eines Termins
- Ressourcen-Managementsoftware
## **Bestätigungsrelevanz**
Tabellarisch gelistet wird hier die Bestätigungsrelevanz in Bezug auf die zuvor definierten Aktuere:

|**Akteur**|**konkrete Anforderungen**|**bestätigungsrelevant**|
| :-: | :-: | :-: |
|Termin-Repository|[https://simplifier.net/isik-terminplanung-v4/~guides](https://simplifier.net/isik-terminplanung-v3/~guides)|ja|
|Termin-Requestor|keine|nein|
|Termin-Consumer|keine|nein|
# **Medikation**
Das Modul "Medikation" unterscheidet die im Folgenden definierten Akteure.
## **Akteur: Medikations-Server**
### **Definition**
Der Akteur "Medikations-Server" im Sinne des ISiK-Moduls "Medikation" ist ein System, das Informationen über Verordnung, Abgabe und Verabreichung von Medikamenten für andere Applikationen (Akteur: Medikations-Client) über eine FHIR R4 REST API nach ISiK zur Abfrage und Weiternutzung zur Verfügung stellt und persistiert.
### **Geltungsbereich**
Als Medikations-Server gelten in diesem Kontext alle Systeme, die strukturierte versorgungsrelevante Medikationsdaten über eine Schnittstellen bereitstellen, verarbeiten und als primärer, dauerhafter Speicherort dieser Daten dienen. Medikationsdaten bilden Informationen zur Medikation ab, diese ist "die Verordnung und Anwendung von Medikamenten unter Festlegung einer bestimmten Dosierung. [[...](https://wiki.gematik.de/pages/createpage.action?spaceKey=IOPAK&title=...)] Sie ist die konkrete Ausführung der Pharmakotherapie." (<https://flexikon.doccheck.com/de/Medikation>)

Systeme, die als Medikations-Server agieren können, sind u.a.:

- KIS mit Funktion Medikationsdatenverwaltung bzw. entsprechendes KIS-Modul
- Patientendaten-Managementsystem (PDMS) [z.B. für Intensivbereiche] (Anwendungsfallbeispiel: Medikationsdaten in das KIS übertragen bei Verlegung vom Intensivbereich auf Normal-Station)
- Software für digitales Medikationsmanagement (z.B. für die Umsetzung von KHZG Fördertatbestand 5)
- E-Therapieplan-System für Zytostatika-Behandlung mit Verarbeitung von Verordnungs- und Medikationsinformationen 
  (gemäß Festlegungen keine Umsetzung des ISIK-Datenobjekts MedikationsVerabreichung notwendig)
- Herstellungssystem mit Verarbeitung von Verordnungs- und Medikationsinformationen
  (gemäß Festlegungen keine Umsetzung des ISIK-Datenobjekts MedikationsVerabreichung notwendig)
## **Akteur: AMTS Data Provider**
### **Definition**
Der Akteur AMTS Data Provider im Sinne des ISiK-Moduls "Medikation" ist ein System, das AMTS relevante Informationen für andere Applikationen (Akteur: Medikations-Client) über eine FHIR R4 REST API nach ISiK zur Abfrage und Weiternutzung zur Verfügung stellt und persistiert. Beispiele für ATMS-relevante Informationen sind z.B. der Stillstatus, Schwangerschafts- und Raucherstatus.

Es geht hier nicht um ein System das AMTS-Resultate bereitstellt - daher wurde die Bezeichnung AMTS Data Provider gegenüber AMTS-Server hier bevorzugt.
### **Geltungsbereich**
Als AMTS data provider gelten in diesem Kontext alle Systeme, die AMTS relevante, strukturierte klinische Daten über eine Schnittstellen bereitstellen, verarbeiten und als primärer, dauerhafter Speicherort dieser Daten dienen.

Systeme, die als AMTS data provider agieren können sind u.a.:

- KIS
- Laborinformationssysteme (LIS)
- PDMS (Anwendungsfallbeispiel: Abrufen von AMTS relevanten Zusatzinformationen)
## **Akteur: Medikations-Client**
### **Definition**
Im Kontext des Moduls Medikation fragen Medikations-Clients versorgungsrelevante Daten von einem Server ab, um sie z.B. einem Anwender (End-User als Mensch) anzuzeigen oder mittels dedizierter Software zu verarbeiten, z.B. zur Entscheidungsunterstützung. Medikations-Clients sind nicht verpflichtet, alle von den Servern bereitgestellten Suchkriterien zu unterstützen.
### **Geltungsbereich**
Als Medikations-Clients gelten in diesem Kontext alle Systeme, die strukturierte versorgungsrelevante Daten zur Medikation über eine Schnittstelle abfragen oder kommunizieren. Medikations-Clients gelten *nicht* als primärer, dauerhafter Speicherort für die versorgungsrelevante Daten.

Medikations-Clients sind zum Beispiel:

- AMTS Systeme

Dabei ist zu beachten, dass auch Systeme, die oben als Medikations-Server gelistet sind, zusätzlich als Akteur 'Medikations-Client' agieren können. Insbesondere für die Unterstützung eines Überleitungs-Workflows gilt dies für:

- KIS
- PDMS
## **Bestätigungsrelevanz**

Bestätigungsrelevant im Kontext des Moduls Medikation sind alle Systeme, die eine Teilmenge der in diesem Modul in Form von FHIR-Profilen definierten Daten zu Medikationsinformationen verarbeiten und dauerhaft speichern (die Bestätigung wird dann ggf. nur für eine Teilmenge der Datenschemata erfolgen): auch wenn z.B. nur ein Profil für die Schnittstelle umgesetzt werden MUSS (z.B. im hypothetischen Falle, dass ein System nur dieses unterstützt ), ist das System bestätigungsrelevant (für dieses eine Profil).

Bestandteile des Support Moduls Labor sind im Kontext des Medikationsmoduls bestätigungsrelevant, insbesondere für die Anwendungsfälle rund um AMTS.

Tabellarisch gelistet wird hier die Bestätigungsrelevanz in Bezug auf die zuvor definierten Akteure:

|**Akteur**|**konkrete Anforderungen**|**bestätigungsrelevant**|
| :-: | :-: | :-: |
|Medikations-Server|<https://simplifier.net/guide/isik-medikation-v4?version=current>|ja|
|AMTS Data Provider|<https://simplifier.net/guide/isik-basis-v4?version=current><br><https://simplifier.net/guide/isik-labor-v4?version=current>|ja|
|Medikations-Client|keine|nein|


# Festlegungen auf Profilebene im CapabilityStatement

Festlegungen zu Anforderungen auf Profilebene werden unter {{pagelink:guides\Implementierungsleitfaden-ISiK-Basismodul-401\Einfuehrung\Datenobjekte\CapabilityStatement.page.md}} geführt.