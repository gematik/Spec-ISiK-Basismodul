---
topic: UebergreifendeFestlegungen-KompatibilitaetDerGematikSpezifikation-IHE
---
## Kompatibilität zu IHE-Profilen

Die ISiK-Spezifikationen werden basierend auf folgenden IHE-Profilen entwickelt:
* [PDQm (Patient Demographic Query for mobile)](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_PDQm.pdf)
* [QEDm (Query for Existing Data for mobile)](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_QEDm.pdf)

Das [Modul Dokumentenaustausch](https://simplifier.net/guide/isik-dokumentenaustausch-v4/ImplementationGuide-markdown-UebergreifendeFestlegungen-Kompatibilitaet?version=current) basiert zudem auf:
* [MHD (Mobile access to Health Documents)](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_MHD.pdf)

Hierbei ist anzumerken, dass der Zusatz "for mobile" seitens IHE irreführend sein kann.
Konkret fasst IHE unter diesem Begriff nicht nur Systeme zusammen, die "Plattform- und Ressourcenbeschränkt sind, wie z.B. Tablets, Smartphones und Embedded Devices, sondern auch größere Systeme in Umgebungen, in denen die Interoperabilitätsanforderungen einfach sind (z.B. Anzeige der aktuellen Übersicht eines Patienten)" (Quelle: IHE QEDm - Introduction)

Die im Folgenden genannten IHE-Spezifikationen beschreiben lediglich Interaktionen zwischen den Systemen und machen verbindliche Vorgaben zum Ablauf, Format und zu den unterstützten Such-Parametern, jedoch keine inhaltlichen Vorgaben. So beschreibt PDQm beispielsweise den Ablauf einer Suche nach Patientendaten, enthält aber keine Vereinbarungen, wie die zurückgelieferte Patientenressource konkret auszusehen hat (Pflichtfelder, Terminologien, Constraints).

Der Mehrwert der ISiK-Spezifikation besteht darin, dass die genannten IHE-Interaktionen um Festlegungen zu den auszutauschenden Inhalten ergänzt werden, die zugeschnitten sind auf die Anforderungen des Datenaustausches zwischen Systemen innerhalb einer Einrichtung, basierend auf den Deutschen Basisprofilen von HL7 Deutschland e.V. Zudem wird ein beständiger Abgleich mit den Festlegungen der KBV zu den Inhalten der elektronischen Patientenakte (MIOs) sowie den Spezifikationen der Medizininformatik-Initiative angestrebt.


Die Darstellungen der in diesen IHE-Profilen festgelegten Interaktionen und Use Cases sind den oben verlinkten Dokumenten zu entnehmen.

### IHE PDQm

#### Umfang
PDQm unterstützt das Abfragen von demografischen Patientendaten.
Damit fällt dieser Anwendungsfall vollständig in den Umfang der Festlegungen von ISiK.

#### Akteure
PDQm definiert die Kommunikation zwischen zwei Akteuren:
1. dem *Patient Demographics Consumer* und
2. dem *Patient Demographics Supplier*

Im ISiK Kontext nehmen die bestätigungsrelevanten Systeme die Rolle des *Patient Demographics Supplier* ein.
Die *Pediatric Demographics Option* liegt außerhalb des Abdeckungsbereiches von ISiK.

#### Transaktionen
PDQm definiert die Transaktion *ITI-78 (Mobile Patient Demographics Query)*, deren Grundlagen identisch sind mit den in ISiK definierten Interaktionen auf dem Datenobjekt "Patient".
Der Unterschied zwischen PDQm und ISiK besteht lediglich darin, dass ISiK nicht alle in PDQm spezifizierten Suchparameter zwingend erfordert.
Suchparameter, die in PDQm obligatorisch sind, in ISiK jedoch optional, sind in diesem Leitfaden mit einem entsprechenden Hinweis versehen.


### IHE QEDm

#### Umfang
QEDm unterstützt das Abfragen klinischer Informationen wie zum Beispiel Diagnosen, Beobachtungen (u.a. Vitalparameter), Messdaten und Allergien unter Verwendung des FHIR-Standards.
Damit überlappt der Anwendungsfall von QEDm in großen Teilen mit den Festlegungen von ISiK.

#### Akteure
QEDm definiert die Kommunikation zwischen zwei Akteuren:
1. dem *Clinical Data Consumer* und
2. der *Clinical Data Source*

Im ISiK Kontext nehmen die bestätigungsrelevanten Systeme die Rolle der *Clinical Data Source* mit folgenden Optionen ein:

* Conditions Option
* Procedures Option
* Encounters Option

Alle weiteren Optionen liegen außerhalb des Abdeckungsbereiches von ISiK in Hinblick auf den Scope der aktuellen Veröffentlichung.

Die Aufgabe der Clinical Data Source liegt in der Beantwortung der Anfragen nach Informationen durch die Rückgabe von FHIR-Ressourcen, die den gegebenen Suchparametern entsprechen.

#### Transaktionen
QEDm definiert die Transaktion *PCC-44 (Mobile Query for Existing Data)*, deren Grundlagen identisch sind mit den in ISiK definierten Interaktionen auf den Datenobjekten "Diagnose" "Prozedur" und "Kontakt/Fall".
Der Unterschied zwischen QEDm und ISiK besteht lediglich darin, dass ISiK über die Vorgaben von PDQm hinaus die Implementierung weiterer Suchparameter fordert.

So beschränkt sich QEDm zum Beispiel auf die Encounter-Suchparameter `patient` und `date`, während ISiK auch die Suche nach der Fallnummer (`identifier`) und weiteren, für die einrichtungsinterne Kommunikation relevanten Kriterien unterstützt.

### Abweichungen
Hersteller, die die ISiK-Vorgaben implementiert haben, können erwarten, dass ihre Systeme damit die Anforderungen von QEDm im Rahmen der oben genannten Optionen sowie PDQm vollständig erfüllen.

Sollten sich Abweichungen ergeben in dem Sinne, dass Hersteller, die ISiK implementiert und erfolgreich bestätigt haben *zusätzliche* Funktionen implementieren müssen, um QEDm- bzw. PDQm-konform zu sein, so werden diese hier aufgelistet:

* PDQm fordert die Implementierung des Suchparameters `address-state`. Dieser ist nicht Bestandteil der ISiK-Spezifikation
* IHE fordert von Clinical Data Source- sowie Patient Demographic Supplier-Akteuren die Implementierung der Spezifikationen ATNA Secure Node oder ATNA Secure Application. Diese sind nicht Bestandteil des ISiK-Bestätigungsverfahrens.
