# Aufgabenstellungen Anfänger Track

## User Story
Anna Müller, 67 Jahre, mit der Diagnose primäre Gonarthrose, beidseitig (ICD M17.0), die durch ihre Orthopädin (Frau Dr. Peters) gestellt wurde, möchte durch die geplante Implantation einer Knie-Endoprothese (OPS 5-822) in einem spezialisierten Krankenhaus ihre Mobilität und Lebensqualität verbessern.

- **Name**: Anna Müller
- **Alter**: 67 Jahre (14.11.1957)
- **Geschlecht**: Weiblich
- **Familienstand**: Verheiratet, 2 erwachsene Kinder
- **Beruflicher Hintergrund**: Früher Sekretärin, nun in Rente
- **Wohnort**: Demmin in Mecklenburg-Vorpommern , lebt in einem Einfamilienhaus mit Garten → Sollen 
- **Krankenversichertennummer**: A1234567890
- **Hobbys und Interessen**: Gartenarbeit, Spaziergänge, Treffen mit Freunden, Zeit mit den Enkeln verbringen
- **Bezeichnung**: Primäre Gonarthrose
- **ICD-10 Code**: M17.0
- **Diagnostiziert von**: Frau Dr. Peters
- **Diagnostiziert am**: 21.10.2024

## Teil 1 - Beispiele erstellen
### Aufgabe 1: Patientin anlegen
Laden Sie die json Datei mit dem Namen  [Patient-PatientinAnnaMueller_Ausschnitt.json](https://wiki.gematik.de/download/attachments/606557316/Patient-PatientinAnnaMueller_Ausschnitt.json?version=1&modificationDate=1731596482272&api=v2) herunter. Diese Datei ist eine FHIR Repräsentation der unten aufgeführten Informationen. Bitte befüllen Sie diese Instanz mit allen fehlenden Informationen.  Achtung: Einige der unten aufgeführten Informationen können nicht im Profil abgebildet werden und müssen dementsprechend nicht überführt werden.

### Aufgabe 2: Condition anlegen
Laden Sie die json Datei mit dem Namen  [Condition-PrimaereGonarthrose_Ausschnitt.json](https://wiki.gematik.de/download/attachments/606557316/Condition-PrimaereGonarthrose_Ausschnitt.json?version=1&modificationDate=1731596519747&api=v2) herunter. Diese Datei ist eine FHIR Repräsentation der unten aufgeführten Informationen. Bitte befüllen Sie diese Instanz mit allen fehlenden Informationen.  

## Teil 2 - Serverabfragen

Die API Plattform Postman kann verwendet werden, um FHIR-Ressourcen zu senden und zu empfangen; er ist sowohl als Browser-Erweiterung als auch als App verfügbar. Mit einem Post-Client lassen sich Server-Anfragen über das Hypertext Transfer Protocol (HTTP) erstellen. FHIR liefert die Antwort als Rohdaten (XML oder JSON) an, daher ist ein HTTP-Client wie Postman notwendig, um die Daten abzurufen und anzuzeigen.

Lade und installiere Postman oder greife über den Browser auf Postman zu und registriere dich. Alternative REST-Clients können auch verwendet werden, sofern die Teilnehmenden mit deren Handhabung vertraut sind. Die Erstellung eines Accounts ist nur bei der Nutzung der Browser-Erweiterung notwendig.

### Aufgabe 1: 

Wir wollen nun verschiedene REST-Interaktionen üben. Dazu verwenden wir den Testserver **X**. Setze im Header-Tab von Postman den Accept-Header auf das gewünschte Antwortformat (*application/fhir+json*) und den Content-Type-Header auf das Format der gesendeten Daten (*application/fhir+json*), damit der Server die Inhalte richtig verarbeiten kann. Importiere folgende Collection in Postman und bearbeite dort die Aufgaben.

1. Erstelle das Patientenprofil von Frau Dr. Peters. Notiere dir die ID.
2. Erstelle das Patientenprofil von Frau Müller. Notiere dir die ID.
4. Erstelle nun eine Condition-Ressource in Postman für Primäre Gonarthrose für Frau Müller.
5. Verwende die ID von Frau Müller, um ihr Patientenprofil zu erhalten.
6. Frau Müller hat Herrn Maier geheiratet und seinen Nachnamen angenommen. Pass den Nachnamen im Patientenprofil an.
7. Rufe die Historie der Ressource ab, die du in der vorherigen Übung erstellt hast
8. Suche nach allen weiblichen Patientinnen, die älter als Anna Müller sind.
9. Suche nach allen Patientinnen, die eine Primäre Gonarthrose haben.
10. Fordere eine Kurz-Zusammenfassung der Daten von Anna Müller an.
11. Kopiere das Patientenprofil von Frau Müller und erstelle damit ein neues Patientenprofil mit deinem Vor- und Nachnamen.
12. Lösche nun das Profil mit deinem Namen wieder.

