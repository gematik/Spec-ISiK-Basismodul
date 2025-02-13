---
topic: ImplementationGuide-markdown-UseCasesAnwendung-UseCases
---
# Use Cases - Übersicht

## 1. Patient oder Fall Merge

* **Zusammenführung von Patientendaten:** Wenn zwei Patientenakten aufgrund einer fehlerhaften
  doppelten Erfassung zusammengeführt werden, können relevante Systeme (z. B. KIS,
  Abrechnungssysteme, Labor) automatisch über die Änderung informiert werden. Dies verhindert
  Dateninkonsistenzen und ermöglicht eine einheitliche Patientenhistorie.

* **Fall-Zusammenführung:** Falls mehrere Krankenhausaufenthalte eines Patienten in einem Fall
  zusammengeführt werden, erhalten nachgelagerte Systeme eine Benachrichtigung, um Abrechnungen und
  medizinische Dokumentationen korrekt zu aktualisieren.

## 2. Benachrichtigung bei Korrektur von Daten

* **Laborbefunde:** Falls ein bereits übermittelter Laborbefund korrigiert oder aktualisiert wird,
  informiert die Subscription automatisch alle betroffenen Systeme (z. B. KIS, PDMS,
  Patientenportal), sodass Patientinnen und Patienten sowie medizinisches Fachpersonal stets über
  die neuesten Befunde verfügen.

* **Diagnose- oder Medikationsänderungen:** Wird eine Diagnose oder Medikation geändert oder
  zurückgezogen, erhalten relevante Systeme eine Benachrichtigung, um Entscheidungen in der
  Patientenversorgung auf Basis der korrekten Daten zu treffen.

## 3. Benachrichtigung im Patientenportal

* **Statusänderung bei Terminen:** Wenn ein Termin (Appointment) verschoben oder abgesagt wird,
  erhält das Patientenportal eine automatische Benachrichtigung. Patientinnen und Patienten werden
  daraufhin per E-Mail, App-Push-Nachricht oder SMS informiert.
* **Neue Dokumente:** Sobald ein Entlassbrief (DocumentReference) oder ein Laborbericht vorliegt,
  werden Subscriptions getriggert und das Portal kann gezielt den Patienten informieren und das
  Dokument zur Verfügung stellen.

## 4. Integration mit externen Services

* **Externe Terminverwaltungs-Systeme:** Ein Terminverwaltungsportal abonniert Änderungen an
  Appointment- oder Slot-Ressourcen. Bei neu erstellten Slots kann es automatisiert Patientinnen und
  Patienten freie Termine anbieten.
* **Apps von Drittanbietern:** Drittanbieter-Apps können mithilfe von FHIR Subscriptions aktiv über
  aktuelle Daten (z.B. Vitalwerte, Medikationspläne) informiert werden und aktiv Benachrichtigungen
  versenden, sobald es zu Änderungen kommt.

## 5. Automatisierte Prozesssteuerung

* **Event-getriebene Trigger:** Bei Ankunft eines Patienten (Encounter.start) wird automatisch ein
  Check-in-Prozess angestoßen, der weitere Systeme informiert und ggf. Folgeprozesse aktiviert (z.B.
  Aufnahmegespräch, Unterbringung).
* **Proaktive Informationsweiterleitung:** Bei Entlassung (Encounter.end) werden weitere
  Stakeholder (z.B. Physiotherapie oder Nachsorgeeinrichtungen) automatisch informiert, um die
  Nachsorge ohne Zeitverzug zu starten.