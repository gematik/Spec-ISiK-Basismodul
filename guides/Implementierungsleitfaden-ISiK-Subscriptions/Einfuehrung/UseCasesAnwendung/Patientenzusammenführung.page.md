---
topic: Patient-merge
---
# Patient merge und Notification

## Motivation
Im Rahmen von Krankenhausbesuchen umfassen u.a. die Aufnahme-Workflows regelmäßig die manuelle Bearbeitung von Patientenstammdaten. Daher ist hier das Risiko redundant persistierter Patientendaten stets vorhanden. Dies hat auch zur Folge, dass Zusammenführungen von Patientendaten in Krankenhäusern an der Tagesordnung stehen. 

Die Patientendatenzusammenführung (Patient merge) bezeichnet den Workflow der Bereinigung redundanter Patienten-Instanzen innerhalb eines KIS oder einer KH-IT-Umgebung. Die Bereinigung geschieht erfahrungsgemäß als halb-automatisierter Prozess, für den dedizierte Komponenten eingesetzt werden können (d.h. Master-Patient-Index).

Im Kontext verteilter Systeme ist es entscheidend, dass ein patientenführendes System/Server (KIS) einen Client über einen Patient merge benachrichtigt (Patient merge Notification), damit der Client weiterhin auf eine korrekte Patienteninstanz zugreifen kann. Daher trifft dieser Abschnitt eine Festlegung zur Umsetzung einer Patient merge Notification auf Basis von FHIR.

## Normativer Status 
Alle hier getroffenen Festlegungen haben den normativen Status einer KANN-Anforderung. Werden allerdings die hier festgelegten Lösungen genutzt, so SOLLEN die hier angeführten Vorgaben (inklusive Profil-Ebene) eingehalten werden.

Eine Prüfung im Rahmen des Bestätigungsverfahrens zur Patient merge Notification ist in der jetzigen Entwicklungsstufe nicht vorgesehen.

## Zweck und Definition 'Patient merge Notification'
Zweck dieses Abschnitts ist eine Festlegung darüber zu treffen, wie externe Clients Patient-merge-Vorgänge nachvollziehen und entsprechend verarbeiten können.
Entsprechend wird hier eine Festlegung zur Kommunikation eines stattgefundenen Patient merges (Patient merge Notification) gegenüber einem Subsystem oder einem externen Service - u.a. mittels FHIR Subscriptions - festgelegt.

**Definition**: Der Workflow 'Patient merge Notification' entspricht der Benachrichtigung angeschlossener Systeme  über den erfolgreichen Patient merge. Die Benachrichtigung unterstützt das Kernziel einer reibungslosen Kommunikation zwischen zwei Systemen, nachdem ein Patient merge stattgefunden hat. Durch die Benachrichtigung wird ein fehlerhafter Abruf oder falsche Referenzierung einer alten Patientenressource von Seiten des Clients verhindert oder zumindest vorgebeugt und damit eine Verbesserung der Qualität hinsichtlich Robustheit und damit auch eine Stärkung der Praxistauglichkeit von ISiK als Schnittstellen-Lösung erreicht.

## Festlegungen zu 'Patient merge Notification'
Falls eine Patient merge Notification im Rahmen von ISIK bereitgestellt wird, gelten folgende Festlegungen:

Das patientenführende System SOLL einen Client mittels FHIR Subscription über einen erfolgten Patienten merge informieren können. Dieser Mechanismus basiert auf dem [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/channels.html) und nutzt das Konzept der "Topic-Based Subscription" aus FHIR R5.  

Hierfür wurde das Subscription Topic: *https://gematik.de/fhir/isik/StructureDefinition/patient-merge-subscription* definiert.

Das patientenführende System SOLL den Support dieser Subscription innerhalb des CapabilityStatements bekannt geben.

Weitere Informationen zum Subscription Workflow finden sich hier:

[Subscription Workflow - Subscriptions R5 Backport](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/workflow.html)

### Proof of Concept Implementierung
Zur Illustration der technischen Umsetzung für die Patient merge Notification dient ein [Prove of Concept (POC) mit Anleitung](https://github.com/gematik/poc-isik-patient-merge). 

### Notification Channel Types
Notifications über einen Patient-merge-Vorgang können per *rest-hook* oder *websocket* an das subscribende System versandt werden. Im *rest-hook* Fall postet das patientenführende System ein NotificationBundle an den in `Subscription.channel.endpoint` definierten REST Endpunkt. Bei einer *websocket* Notification geschieht das über einen Websocket-Channel. Die Websocket URL, sowie ein Access Token können mittels [`$get-ws-binding-token` Operation](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/OperationDefinition-backport-subscription-get-ws-binding-token.html)  vom Server abgerufen werden.

## Abgrenzung zu 'Patient merge'
Das Mergen von Patientendaten ist Aufgabe des bestätigungsrelevanten Systems (d.h. hier des patientenführenden Systems / KIS). 
Ein externes Starten eines Patient merge - bspw. durch die [$patient-merge Operation aus R5](https://hl7.org/fhir/R5/patient-operation-merge.html) - MUSS von einem bestätigungsrelevanten System NICHT unterstützt werden.

**Hinweis**: Die Patienten-Ressource, die nicht weiter verwendet werden soll, nennen wir im Folgenden die "obsolete Ressource". Die Ressource, die erhalten bleiben soll, nennen wir "resultierende Ressource".

### Obsolete Patienten-Ressource
Es gelten keine gesonderten Anforderungen an eine obsolete Patienten-Ressource über die ISiKPatient Profilanforderungen hinaus. 

Allerdings KANN das patientenführende System die obsolete Patienten-Ressource weiter vorhalten. Ein Entfernen der obsoleten Ressource ist ebenfalls erlaubt.

Falls die obsolete Ressource nach einem merge weiter vorgehalten wird, SOLLEN die Elemente der obsoleten Ressource folgendermaßen befüllt werden, um sicherzustellen, dass die obsolete Ressource auf die resultieren Ressource verweist und dass die obsolete Ressource als inaktiv gekennzeichnet ist:
- .active = false
- .link.other = Reference(auf “resultierenden” Patient)
- .link.type = “replaced-by”

### Resultierende Patienten-Ressource
Es gelten keine gesonderten Anforderungen an eine obsolete Patienten-Ressource über die ISIKPatient Profilanforderungen hinaus.

Allerdings SOLL das patientenführende System nach einem merge die Elemente der resultierenden Ressource folgendermaßen befüllen, um sicherzustellen, dass die resultierende Ressource auf die obsolete Ressource verweist:
- .link.other = Reference.identifier (logische Referenz mittels Patientennummer Identifier auf “obsoleten” Patient)
- .link.type = “replaces”

Siehe auch: {{pagelink:Patient-Profil, text:Patienten Profil }}

### Referenzen auf das Patientenobjekt
Es gilt folgende Annahme: Das patientenführende System SOLL sicherstellen, dass alle auf die obsolete Ressource referenzierenden FHIR-Ressourcen nach dem Patient merge auf die resultierende Ressource referenzieren.

## Hinweise zum Client-System

### Recovery Mechanismus
Ein Recovery Mechanismus wird benötigt, damit im Falle einer ausgebliebenen Patient merge Notification ein Client die aktuelle Patienteninstanz auffinden und erneut referenzieren kann.

Folgender Hinweis dient der Einhaltung eines Recovery Mechanismus:

Client-Systeme SOLLEN den Status einer gecachten Patienteninstanz vor der Interaktion mit einem patientenführenden System per READ auf das Patientenobjekt überprüfen.
Sollte die Patienten-Ressource nicht mehr bereitstehen, oder die Ressource den status `active=false` haben, kann das Patientenobjekt mittels Suche auf einen bekannten und stabilen Identifier, bspw. die gesetzliche Krankenversichertennummer, neu geladen werden.


### Datensicherheit Client

**Hinweis**: Die "patient-merge Subscription-Notification" kann personenbezogene Daten versenden, falls man "full-resource" als Content-Code gewählt hat. Für den REST-Hook sollte daher stets ein HTTPS-Endpunkt genutzt werden. Zusätzlich kann Subscription.channel.header genutzt werden, um einen Autorisierungs-Header an den Endpunkt zu übertragen.   
Siehe auch: [Safety and Security, Subscription Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/safety_security.html)

In jedem Fall sind auch Client-seitig die notwendigen Maßnahmen zu ergreifen, um eine sichere Kommunikation personenbezogener Daten zu gewährleisten.

### Websocket

Hier muss sich der Client per [`$get-ws-binding-token` Operation](https://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition-backport-subscription-get-ws-binding-token.html) einen Token zum Zugriff auf den Websocket-Endpunkt des patientenführenden Systems holen. In der Operation-Response sind zusätzlich die Expiration-Dauer, sowie der Websocket-Endpunkt enthalten.  
Siehe auch: [Subscriptions R5 Backport IG, Websocket](https://hl7.org/fhir/uv/subscriptions-backport/channels.html#websockets)

## Beispiele
Die Patient merge Notification kann folgendermaßen illustriert werden: 

Es existieren fälschlicherweise zwei Instanzen im patientenführenden System, die sich lediglich hinsichtlich der organisationsspezifischen Patienten-ID unterscheiden.
Diese sind:

"Quell" Patienten-Ressource:  
{{json:DorisQuelle}}

und

"Ziel" Patienten-Ressource:  
{{json:DorisZiel}}

Mittels eines Patient merge wird die "Ziel" Patienten-Ressource ausgewählt und beide Ressourcen entsprechend modifiziert. Daraus entsteht die resultierende Patienten-Instanz:
{{json:Resources/static/Patient-DorisResultat.json}}

Da sich ein Client am patientenführenden System für das dedizierte SubscriptionTopic (http://hl7.org/SubscriptionTopic/patient-merge) registriert hat, erhält der Client eine Benachrichtigung in Form eines Bundles mit Verweis auf die resultierende Ressource.

