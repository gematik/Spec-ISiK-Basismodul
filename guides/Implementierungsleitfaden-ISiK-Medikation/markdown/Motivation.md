# Motivation

Die Verordnung, Abgabe und Verabreichung von Medikamenten stellt eine der Kerntätigkeiten der Medizin dar.

Eine möglichst medienbruch-freie Kommunikation innerhalb dieses Workflows zwischen Behandelnden, Apotheken und Patienten kann zur Effizienz der Behandlungsprozesse beitragen und gleichzeitig die Therapiequalität sichern und verbessern (Stichworte: interne Qualitätssicherung, Arzneimitteltherapiesicherheit, Übernahme der Daten bei Verlegung zwischen Stationen, insbesondere zwischen Normal- und Intensivstation).

Dies gilt ebenso für die Dokumentation und Weiterverarbeitung der Aufnahme- bzw. Entlassmedikation (Medikationsplan), die derzeit noch häufig in Form von manueller und somit fehleranfälliger Übertragung der Medikationsangaben umgesetzt wird.

Das ISiK-Modul "Medikation" möchte diese Daten-Integration ermöglichen und stellt in dieser Ausbaustufe strukturierte Kommunikationsmöglichkeiten auf Basis einer RESTful API zum Austausch von Medikationsinformationen ("Medikationsplan") sowie Verordnungs- und Verabreichungsdaten zur Verfügung. Derzeit nicht berücksichtigt ist das Apothekenwesen.

Diese Spezifikation lehnt sich an die entsprechenden Teile des IHE-Profils HMW (Hospital Medication Workflow) sowie partiell auch an das IHE-Profil CMPD (Community Medication Prescription and Dispense) an. Weiterhin erfolgte ein Abgleich mit den aktuell in Deutschland bestehenden Spezifikationen im Bereich Medikation.

Der Fokus dieser Spezifikation liegt auf den Festlegungen zum Datenaustausch innerhalb einer Einrichtung, jedoch ist diese offen in dem Sinn, dass auch eine Nutzung in anderen Kontexten möglich ist.