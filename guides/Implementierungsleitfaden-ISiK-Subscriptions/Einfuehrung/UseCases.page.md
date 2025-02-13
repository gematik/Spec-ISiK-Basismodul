---
topic: ImplementationGuide-markdown-UseCasesAnwendung-UseCases
---
# Use Cases - Übersicht

## 1. Benachrichtigung im Patientenportal

* **Statusänderung bei Terminen:** Wenn ein Termin (Appointment) verschoben oder abgesagt wird,
  erhält das Patientenportal eine automatische Benachrichtigung. Patientinnen und Patienten werden
  daraufhin per E-Mail, App-Push-Nachricht oder SMS informiert.
* **Neue Dokumente:** Sobald ein Entlassbrief (DocumentReference) oder ein Laborbericht vorliegt,
  werden Subscriptions getriggert und das Portal kann gezielt den Patienten informieren und das
  Dokument zur Verfügung stellen.

## 2. Benachrichtigung an medizinisches Fachpersonal

* **Workflow-Management:** Pflegekräfte oder Ärztinnen/Ärzte können sich über neue Patientenzugänge,
  geänderte Anordnungen (Order), Konsile oder Notfallaufnahmen automatisch benachrichtigen lassen.
* **Aktualisierung von Ressourcen:** Änderungen an Coverage-Daten oder Versicherungsstatus können
  automatisiert an die Abrechnung oder Aufnahme weitergeleitet werden.

## 3. Integration mit externen Services

* **Externe Terminverwaltungs-Systeme:** Ein Terminverwaltungsportal abonniert Änderungen an
  Appointment- oder Slot-Ressourcen. Bei neu erstellten Slots kann es automatisiert Patientinnen und
  Patienten freie Termine anbieten.
* **Apps von Drittanbietern:** Drittanbieter-Apps können mithilfe von FHIR Subscriptions aktiv über
  aktuelle Daten (z.B. Vitalwerte, Medikationspläne) informiert werden und aktiv Benachrichtigungen
  versenden, sobald es zu Änderungen kommt.

## 4. Automatisierte Prozesssteuerung

* **Event-getriebene Trigger:** Bei Ankunft eines Patienten (Encounter.start) wird automatisch ein
  Check-in-Prozess angestoßen, der weitere Systeme informiert und ggf. Folgeprozesse aktiviert (z.B.
  Aufnahmegespräch, Unterbringung).
* **Proaktive Informationsweiterleitung:** Bei Entlassung (Encounter.end) werden weitere
  Stakeholder (z.B. Physiotherapie oder Nachsorgeeinrichtungen) automatisch informiert, um die
  Nachsorge ohne Zeitverzug zu starten.