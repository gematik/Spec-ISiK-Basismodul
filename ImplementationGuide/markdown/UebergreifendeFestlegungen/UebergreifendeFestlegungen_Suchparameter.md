---
topic: UebergreifendeFestlegungen-UebergreifendeFestlegungen-Suchparameter
---
## Allgemeine Hinweise zu Suchparametern
Originäre ISiK Use Cases sind versorgungsorientiert und patientenorientiert. Dies resultiert darin, dass in der Profilierung der ISiK-Datenobjekte das Vorhandensein einer Referenz auf ISiKPatient (Patient) und ISiKKontaktGesundheitseinrichtung (Encounter) wo möglich gefordert wird. Entsprechend sind Abfragen durch Clients auf Basis von bekannten Informationen aus *einer* Patient- und/oder Encounter-Ressource zu begrenzen (Abfragen auf Patientenkohorten oder sonstige Forschungsabfragen sind nicht im Fokus von ISiK).
Auf Basis dieser grundsätzlichen Design-Entscheidung können Clients davon ausgehen, dass alle vorliegenden referenzierten bzw. referenzierenden Ressourcen aus dem Kontext der genannten Ressourcen-Typen abrufbar sind. Durch das Vorliegen der Referenzen erfolgt die Dokumentation aller Datenobjekte stets im korrekten Patientenkontext. Zudem liegen für den jeweiligen Kontext relevante Informationen zur Interpretation der Dokumentation und Sicherstellung der Datenintegrität vor. 

Innerhalb der jeweiligen Abschnitte 'Interaktionen' (Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/Datenobjekte.md}}) werden für alle innerhalb dieses Implementierungsleitfadens spezifizierten FHIR-Ressourcen Suchparameter bestimmt, welche im Rahmen des Bestätigungsverfahrens von ISiK unterstützt werden MÜSSEN.

Ein Server MUSS sicherstellen, dass nicht unterstützte oder leere Suchparameter ignoriert werden und **nicht** zu einem Fehler führen. Siehe [FHIR RESTful Search - Handling Errors](https://www.hl7.org/fhir/R4/search.html#errors).
Alle vom Server für eine konkrete Suche verwendeten Parameter MÜSSEN im Self-Link des Searchset-Bundles angegeben sein, siehe [Self-Link](https://hl7.org/fhir/R4/search.html#selflink).

Alle Suchparameter in FHIR entsprechen einem von neun definierten [Such-Parameter-Typen](https://hl7.org/fhir/R4/search.html):

* Number
* Date/DateTime
* String
* Token
* Reference
* Composite
* Quantity
* URI
* Special

Des Weiteren werden zusätzlich sogenannte 'Modifier' pro Suchparameter-Typ definiert. Eine Übersicht findet sich unter ["Search Modifiers"](https://hl7.org/fhir/R4/search.html#modifiers).

Für die im Rahmen dieses Leitfadens relevanten Typen gelten folgende allgemeinen Festlegungen:

### Date/DateTime

Die Präfixe `lt`,`le`,`gt`,`ge`,`eq` MÜSSEN für jeden Suchparameter vom Typ 'date/dateTime' unterstützt werden.

Begründung: Die Funktionalität datums-eingeschränkt suchen zu können ist essentiell.

Hinweis: Die Abfragemöglichkeit arbeitet ungewollten Massendatenabfragen entgegen, da sich sonst Suchen zwangsläufig über den gesamten Zeitraum erstrecken würden.



**Beispiele**:

```[base]/Encounter?date=eq2024-01-01&patient=Patient/Test``` <br>
Suche nach allen Kontakten mit einem Datum am 2024-01-01T00:00 im Patientenkontext "Test".

```[base]/Condition?recorded-date=eq2024-01-01&patient=Patient/Test``` <br>
Suche nach allen Diagnosen mit einem Dokumentationsdatum von 2024-01-01T00:00 bis (aber nicht einschließlich) 2024-01-02T00:00 im Patientenkontext "Test".

Es ist zu beachten, dass jedes Datum einen impliziten Werte-Bereich besitzt. Siehe https://hl7.org/fhir/R4/search.html#date.

### String

Der Modifier `:contains` MUSS für alle spezifizierten Suchparameter vom Typ 'String' unterstützt werden.

**Beispiele**:

```[base]/Patient?address:contains=Berlin``` <br>
Diese Suchanfrage gibt alle Patienten zurück zum Client, welche in einem Adress-Bestandteil den String 'Berlin' enthält (z.B. alle Berliner Adressen unabhängig von konkreten Bezirken).

### Token

Der Modifier `:not` MUSS für alle spezifizierten Suchparameter vom Typ 'Token' unterstützt werden, sofern diese auf die Datentypen "code", "Coding" oder "CodeableConcept" verwendet werden.

Der Modifier `:text` MUSS für alle spezifizierten Suchparameter vom Typ 'Token' unterstützt werden, sofern diese auf die Datentypen "Coding" oder "CodeableConcept" verwendet werden.

**Beispiele**:

```[base]/Condition?code:text=Freitext``` <br>
Diese Suche gibt alle Condition-Ressourcen zurück zum Client, welche innerhalb `Condition.code.text` das Wort "Freitext" enthält. Es ist zu beachten, dass hier ein partielles Matching erfolgen MUSS (es ist implizit der Modifier :contains anzunehmen).

```[base]/Condition?code:not=Test``` <br>
Diese Suche gibt alle Condition-Ressourcen zurück zum Client, welche innerhalb `Condition.code.coding` NICHT den Code 'Test' enthält. Es ist zu beachten, dass dies auch alle Ressourcen beinhaltet, die keinen kodierten Wert für `Condition.code` enthalten.

### Reference

Der Modifier `:identifier` KANN für alle spezifizierten Suchparameter vom Typ 'Reference' unterstützt werden.

Der Modifier :identifier MUSS implementiert werden, wenn die entsprechende Reference eine 1..1-Kardinalität oder ein MS-Flag auf Reference.identifier hat.

Dies gilt beispielsweise für Encounter.account - also die Referenz zwischen ISiKKontaktGesundheitseinrichtung und ISiKAbrechnungsfall. Encounter MÜSSEN anhand der Fallnummer gesucht werden können, ohne dass Clients Zugriffsberechtigungen auf Accounts haben müssen, bzw. ohne dass Account zwingend implementiert/referenziert werden muss. Der Suchabruf erfolgt entsprechend dann nur über die logische Referenz.

Begründung: Die Unterstützung dieser Suchparameter-Typen ist essentiell für Abfragen mit [Chaining](https://hl7.org/fhir/r4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/r4/search.html#has). Innerhalb der Spezifikation ist für jedes Datenobjekt spezifiziert weshalb eine solche Abfrage versorgungsrelevant ist.


**Beispiele**:

```[base]/Coverage?Payor:identifier=http://fhir.de/sid/arge-ik/iknr|123456``` <br>
Diese Suche gibt alle Coverage-Ressourcen zurück zum Client, welche innerhalb `Coverage.payor` eine logische Referenz auf den Versicherer mit der IK-Nummer "123456" enthält.

Für Suchparameter vom Typ 'Reference' sind nur teilweise die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) verpflichtend zu implementieren (siehe "Verkettete Suchparameter").

**Beispiele**:

``[base]/Procedure?subject.name=Test``
Diese Suche gibt alle Prozeduren zurück zum Client, welche innerhalb `Procedure.subject` auf einen Patienten verweist mit dem Namen "Test".

``[base]/Condition?_has:Encounter:diagnosis:identifier=https://example.org/fhir/sid/aufnahmenummer|1234``
Diese Suche gibt alle Diagnosen zurück, die im Kontext des Kontakts mit der Aufnahmenummer '1234' dokumentiert worden sind.

## Verpflichtende Suchparameter (Alle Datenobjekte)

Folgende Suchparameter MÜSSEN für alle bestätigungsrelevanten Datenobjekte implementiert werden:

* ``_id``

    - Beispiele: ``GET [base]/Patient?_id=103270``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).
    - Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend.

* ``_tag``

    - Beispiele: ``GET [base]/Patient?_tag=https://example.org/codes|needs-review``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_tag" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all) und [FHIR-Basisspezifikation - Abschnitt "Tags"](https://www.hl7.org/fhir/R4/resource.html#simple-tags).

* ``_count``

    - Beispiele: ``GET [base]/Patient?_count=100``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_count" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Page Count"](https://www.hl7.org/fhir/R4/search.html#count).

    Hieraus ergibt sich, dass durch ein [Paging entsprechend der FHIR-Kernspezifikation](https://www.hl7.org/fhir/R4/http.html#paging) unterstützt werden MUSS.
    Für die URIs in den Link-Relationen "first", "last", "next", sowie "prev" MUSS sichergestellt werden, dass NICHT die ursprünglich verwendeten Suchparameter, sowie anderweitig sensitive Informationen enthalten, welche in der Suchanfrage an das bestätigungsrelevante System versendet wurden.
    Der "self"-Link innerhalb des Such-Bundles MUSS entsprechend der Vorgaben aus [FHIR Kernspezifikation - 3.1.1.6 - Server Conformance](https://www.hl7.org/fhir/R4/search.html#conformance) strukturiert sein.

    Der ```:iterate``` Modifier KANN unterstützt werden.

Die aufgelisteten Suchparameter MÜSSEN entsprechend der Vorgaben für das CapabilityStatement pro Ressource aufgelistet werden.

## Verkettete Suchparameter (Fokus auf Patient und Encounter)

Für Suchparameter namens 'patient' und 'encounter' MÜSSEN die Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) verpflichtend implementiert werden.

* ``Chaining``

    - Beispiel für Chaining mit Referenz auf einen Patienten:  ``GET [base]/Encounter?patient.identifier=1234``
    - Hinweis: Die Patient-Instanz ist für die Abfrage zentral, weshalb diese Form der Suchabfrage hier notwendig erscheint (siehe einleitenden Absatz dieses Abschnitts). Analog gilt dies für den Fallkontakt (Encounter).

Für Suchparameter KÖNNEN die Festlegungen für [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) implementiert werden.

* ``Reverse Chaining``

    - Beispiel für Reverse Chaining mit Referenz auf einen Patienten aus einem Observation-Kontext:GET [base]/Patient?_has:Observation:patient:code=1234-5
    - Hinweis: Diese Form der Suchanfrage dient im Wesentlichen dem Auffinden von Patienten (z.B. unter angabe einer BEsondern Diagnose, beobachtung Prozedur etc.) oder Fallkontakten (z.B. zum Ermitteln des Kontextes einer Prozedur)

Folgende Suchparameter MÜSSEN verpflichtend für Suchparameter implementiert werden, für die auch Chaining erforderlich ist ('patient' und 'encounter'):

* ``_include``

    - Beispiele: ``GET [base]/Encounter?_include=Encounter:patient``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_include" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Including other resources in result"](https://www.hl7.org/fhir/R4/search.html#revinclude).
    - Für alle Referenzen, für die ein Chaining unterstützt wird, MUSS auch der _include-Parameter implementiert werden. Alle unterstützten Include-Referenzen MÜSSEN im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchInclude``` angegeben werden. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}.

* ``_revinclude``

    - Beispiele: ``GET [base]/Patient?_revinclude=Encounter:subject``
    - Anwendungshinweise: Weitere Informationen zur Suche nach "_revinclude" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Including other resources in result"](https://www.hl7.org/fhir/R4/search.html#revinclude).
    - Alle Referenzen für die ein Chaining unterstützt wird MUSS auch der _revinclude-Parameter implementiert werden. Alle unterstützten Revinclude-Referenzen MÜSSEN im CapabilityStatement unter ```CapabilityStatement.rest.resource.searchRevInclude``` angegeben werden. Siehe {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md}}.

Im Kontext dieser Spezifikation (einschließlich weitere ISIK Module) werden - wo notwendig - weitere Festlegungen für [Chaining](https://hl7.org/fhir/R4/search.html#chaining) und [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has) getroffen.

Mehrfach-Chaining ist generell nicht gefordert, es sei denn es wird in einem Modul für einzelne Parameter explizit verlangt.


## Best-Practice-Empfehlungen für Standard-Suchfilter

Diese grundlegenden Best-Practice-Empfehlungen beziehen sich auf die korrekte Verwaltung des Suchprozesses seitens des Servers, mit Bezug auf Sicherheit im klinischen Umfeld. Unstimmigkeiten in den Erwartungen zwischen Client und Server können dazu führen, dass mehr Ressourcen als erwartet oder angemessen gefunden werden, oder, dass Ressourcen in den Suchergebnissen fehlen, die eigentlich vorhanden sein sollten. Im Folgenden werden daher Empfehlungen für Standard-Suchfilter genannt, die ein Grundmaß an Sicherheit im klinischen Umfeld bereitstellen sollen.

- Der Server SOLLTE dafür sorgen, dass Clients die benötigten Informationen finden können, auch bei Inhalten, die sich über mehrere FHIR-Ressourcen hinweg strecken.

- Wenn der Inhalt eines Suchparameters leer ist, SOLLTE der Server diesen ignorieren.

- Wenn der Inhalt eines Suchparameters syntaktisch falsch ist, SOLLTE der Server einen Fehler zurückgeben. Handelt es sich jedoch um eine logische Bedingung (z.B. einen Code), SOLLTE der Server die Suche verarbeiten, einschließlich des Parameters. Als Ergebnis wird in diesem Fall eine leere Suchmenge zurückgegeben, da der Parameter nicht erfüllt werden kann. In solchen Fällen kann zusätzlich ein OperationOutcome mit Hinweisen und Warnungen über den Suchprozess in das Ergebnis aufgenommen werden. Dieses wird in die Suchergebnisse als Eintrag mit [search mode](https://www.hl7.org/fhir/R4/bundle-definitions.html#Bundle.entry.search.mode) = [`outcome`](https://www.hl7.org/fhir/R4/valueset-search-entry-mode.html) aufgenommen. Clients können diese Informationen nutzen, um zukünftige Suchen zu verbessern.

- Wenn der Server geeignete Standardfilter bei der Suche auf der Grundlage des Patientenkontextes (z.B. das Herausfiltern von fehlerhaften Datensätzen oder inaktiven und verstorbenen Patienten) enthält, SOLLTEN diese angemessen und eindeutig dokumentiert sein (vorzugsweise durch Aufnahme in den 'self link' für eine Suche).

- Weitere Hinweise können in der [FHIR Spezifikation im Abschnitt `Search`](https://www.hl7.org/fhir/R4/search.html#errors) eingesehen werden.
