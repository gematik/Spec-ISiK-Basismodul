---
topic: ImplementationGuide-markdown-Motivation
---
# Motivation

Die Landschaft informationstechnischer Systeme in Krankenhäusern ist enorm heterogen. Für die Patientenverwaltung und -abrechnung, die medizinische Dokumentation, die Laborverwaltung, die Blutbank bis hin zum Dokumentenarchiv werden verschiedene, auf das jeweilige Fachgebiet spezialisierte Systeme verwendet. Es besteht daher der Bedarf, diese Systeme über ihren Primärzweck hinaus sinnvoll zu integrieren. Ein Szenario ist beispielsweise die Abrechnung der im Krankenhaus erbrachten Leistungen. Aus den ursprünglich in verschiedenen Spezialsystemen erfassten Informationen werden die für die Abrechnung relevanten Informationen an ein Abrechnungssystem gesendet und dort zur Rechnungslegung weiterverarbeitet.

Herausforderungen stellen dabei die Vielzahl der Schnittstellen von informationstechnischen Systemen im Krankenhaus sowie zusätzliche Anforderungen für die Nutzung in mobilen Anwendungen dar. Durch die Festlegung und Verwendung von offenen und standardisierten Schnittstellen können diese Herausforderungen effizienter angenommen werden. 

Im Folgenden leiten wir - die gematik GmbH - her, warum die bestehenden Integrationsansätze im Krankenhaus noch unzureichend sind und durch die im Bestätigungsverfahren „Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus“ (ISiK) spezifizierten Ansätze ergänzt werden, um die Vielzahl sinnvoller Integrationsszenarien effizient abzudecken.

## Reaktiver Datenaustausch im Krankenhaus

Der aktuell in Krankenhäusern vorherrschende Integrationsansatz nach dem Standard HL7 Version 2 (HL7v2) sieht vor, dass fachdomänenspezifische Systeme Nachrichten versenden, sobald für andere Systeme interessante Ereignisse eintreten. Bei Anlegen einer Diagnose in einem System für medizinische Dokumentation wird beispielsweise eine entsprechende Nachricht versendet, die vom Abrechnungssystem konsumiert und in der Rechnungslegung berücksichtigt wird. Für diesen Ansatz ist es nötig, dass die konsumierenden Systeme direkt auf die für sie passenden Nachrichten reagieren können. Leider werden dieselben Inhalte in verschiedenen Krankenhäusern oft unterschiedlich in HL7v2-Nachrichten kodiert. Darum wird häufig ein Kommunikationsserver verwendet, der die krankenhausspezifischen Nachrichten in ein Format übersetzt, dass die konsumierenden Systeme verarbeiten können. Erst wenn diese Übersetzung der HL7v2 Nachrichten eingerichtet ist, können Daten zwischen den Systemen ausgetauscht werden.

Daraus ergeben sich einige relevante Nachteile:

1. Es ist nur eine im Voraus definierte Datenverarbeitung möglich. Es müssen Verarbeitungsregeln im Kommunikationsserver festgelegt werden, die empfangene HL7v2-Nachrichten zur Weiterverarbeitung in ein geeignetes Format überführen.
2. Es können keine HL7v2-Nachrichten genutzt werden, die vor Aktivierung der Verarbeitungsregeln im Krankenhaus versandt wurden. Damit bleibt ein großer Teil der verfügbaren Daten des Krankenhauses ungenutzt.
3. Gerade große Krankenhäuser müssen tausende dieser Verarbeitungsregeln verwalten. Dies erschwert den Überblick und nicht mehr benötigte Regeln belasten den Kommunikationsserver.

Daher hat der Gesetzgeber im Patientendaten-Schutzgesetz (PDSG) der gematik den Auftrag erteilt, offene und standardisierte Schnittstellen zu spezifizieren, die über den reaktiven Datenaustausch hinaus einen bedarfsgerechten Datenaustausch ermöglichen. Die Einhaltung dieser Spezifikation wird in dem ISiK Bestätigungsverfahren geprüft. Die Beschreibung des Bestätigungsverfahrens ist nicht Inhalt dieses Implementierungsleitfadens und ist im Fachportal der gematik beschrieben (<https://fachportal.gematik.de/informationen-fuer/isik/bestaetigungsverfahren-isik>).

## Bedarfsgerechter Datenaustausch im Krankenhaus

Um die oben skizzierten Nachteile zu vermeiden, wird in diesem Leitfaden ein bedarfsgerechter Datenaustausch im Krankenhaus spezifiziert. Benötigte Daten werden zum gewünschten Zeitpunkt im nötigen Umfang angefragt und zur Verfügung gestellt. So sind prinzipiell alle Daten eines Krankenhauses nutzbar, auch wenn sie lange vor dem Bedarf zur Nachnutzung erhoben wurden. Es müssen keine statischen Verarbeitungsregeln in einer Drittsoftware - dem Kommunikationsserver - verwaltet werden. Diese Art des bedarfsgerechten Datenaustausches wird in ISiK durch den internationalen HL7-Standard FHIR in seiner aktuellen Version R4 realisiert. Dabei folgt die Kommunikation dem Architekturstil Representational State Transfer (REST), auf dem auch wesentliche Teile der Kommunikation im Internet und mit mobilen Geräten im Besonderen basieren.

## Anwendungsfälle und Interaktionen

Mit ISiK und insbesondere dem Basismodul sollen eine Vielzahl digital unterstützter Anwendungsfälle im Krankenhaus realisiert werden. Dabei soll nicht die Vielfalt an möglichen Anwendungsfällen im Voraus komplett spezifiziert werden. Damit würde die Implementierung von ISiK durch zu enge und komplexe Vorgaben eher verhindert werden, gerade mit Blick auf zu erwartende zukünftige Anwendungsfälle.
Das Ziel von ISiK ist es, digitale Interaktionen in den Anwendungsfällen zu identifizieren, für die eine Standardisierung besonders wertstiftend ist. Wertstiftend sind Interaktionen, die bspw. viele Anwendungsfälle unterstützen oder in einem Anwendungsfall einen besonders aufwändigen manuellen Schritt automatisieren.
