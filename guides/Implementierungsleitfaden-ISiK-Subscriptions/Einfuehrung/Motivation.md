---
topic: ImplementationGuide-markdown-Motivation
---

# Motivation

Die Einführung von FHIR Subscriptions im Rahmen des ISiK-Standards zielt darauf ab, den
eventbasierten FHIR-Datenaustauschmechanismus zwischen verschiedenen Systemen im Krankenhaus (z.B.
KIS, Patientenportale, Dokumentenserver, PDMS, ...) zu standardisieren und zu verbessern. Bislang
stellt Polling die einzige Option für Clientsysteme dar, um Updates zeitnah zu erhalten. Dieses
Verfahren ist jedoch ineffizient, da es regelmäßige Anfragen an den Server erfordert, auch wenn
keine neuen Daten vorhanden sind. Dies führt zu unnötigem Netzwerkverkehr und Serverlast. Durch
Subscriptions können Systeme stattdessen gezielt über relevante Änderungen informiert werden,
wodurch Ressourcen geschont und die Reaktionszeiten verbessert werden.

Die Verwendung des Subscription Backport Implementation Guides ermöglicht die Nutzung moderner FHIR
R5-Subscription-Features bereits in FHIR R4-Umgebungen. Während FHIR R4 nur eine grundlegende
Subscription-Funktionalität bietet, führt FHIR R5 erweiterte Konzepte wie SubscriptionTopics ein,
die eine gezieltere und flexiblere Steuerung der Benachrichtigungen ermöglichen. Zusätzlich bieten
R5-Notification-Bundles eine strukturierte und kontextbezogene Bereitstellung von Änderungen. Die
Verwendung des Subscription Backport IGs ermöglicht eine standardisierte Nutzung von FHIR R5
Features in R4 und ermöglicht eine zukunftssichere Implementierung eines eventbasierten
Datenaustauschmechanismus.

## Beispielhafte Anwendungsfälle

### 1. Benachrichtigung im Patientenportal

* **Statusänderung bei Terminen:** Wenn ein Termin (Appointment) verschoben oder abgesagt wird,
  erhält das Patientenportal eine automatische Benachrichtigung. Patientinnen und Patienten werden
  daraufhin per E-Mail, App-Push-Nachricht oder SMS informiert.
* **Neue Dokumente:** Sobald ein Entlassbrief (DocumentReference) oder ein Laborbericht vorliegt,
  werden Subscriptions getriggert und das Portal kann gezielt den Patienten informieren und das
  Dokument zur Verfügung stellen.

### 2. Benachrichtigung an medizinisches Fachpersonal

* **Workflow-Management:** Pflegekräfte oder Ärztinnen/Ärzte können sich über neue Patientenzugänge,
  geänderte Anordnungen (Order), Konsile oder Notfallaufnahmen automatisch benachrichtigen lassen.
* **Aktualisierung von Ressourcen:** Änderungen an Coverage-Daten oder Versicherungsstatus können
  automatisiert an die Abrechnung oder Aufnahme weitergeleitet werden.

### 3. Integration mit externen Services

* **Externe Terminverwaltungs-Systeme:** Ein Terminverwaltungsportal abonniert Änderungen an
  Appointment- oder Slot-Ressourcen. Bei neu erstellten Slots kann es automatisiert Patientinnen und
  Patienten freie Termine anbieten.
* **Apps von Drittanbietern:** Drittanbieter-Apps können mithilfe von FHIR Subscriptions aktiv über
  aktuelle Daten (z.B. Vitalwerte, Medikationspläne) informiert werden und aktiv Benachrichtigungen
  versenden, sobald es zu Änderungen kommt.

### 4. Automatisierte Prozesssteuerung

* **Event-getriebene Trigger:** Bei Ankunft eines Patienten (Encounter.start) wird automatisch ein
  Check-in-Prozess angestoßen, der weitere Systeme informiert und ggf. Folgeprozesse aktiviert (z.B.
  Aufnahmegespräch, Unterbringung).
* **Proaktive Informationsweiterleitung:** Bei Entlassung (Encounter.end) werden weitere
  Stakeholder (z.B. Physiotherapie oder Nachsorgeeinrichtungen) automatisch informiert, um die
  Nachsorge ohne Zeitverzug zu starten.

## Stakeholder

Die Spezifikation richtet sich insbesondere an Softwarehersteller von 1)
Krankenhausinformationssystemen (KIS), 2) zugehörigen Modulen und Subsystemen, die mit FHIR
Subscriptions arbeiten, sowie 3) eigenständigen, aber im Ökosystem integrierten Systemen, die
innerhalb eines Krankenhauses oder darüber hinaus eingesetzt werden.

Es handelt sich um eine technische Spezifikation, sodass keine weiteren medizinischen Fachexperten
konsultiert werden müssen. Die medizinische und fachliche Bewertung der Daten bleibt weiterhin in
der Verantwortung der jeweiligen Systeme.
