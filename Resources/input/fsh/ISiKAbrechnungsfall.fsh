Profile: ISiKAbrechnungsfall
Parent: Account
Id: ISiKAbrechnungsfall
Description: "Dieses Profil ermöglicht die Gruppierung von medizinischen Leistungen zu einem gemeinsamen Abrechnungskontext.  
### Motivation
Komplementär zum Datenobjekt &quot;Kontakt - Encounter&quot; können Fälle, im Sinne einer Gruppierung von medizinischen Leistungen 
innerhalb eines gemeinsamen Kontextes, zu einem Abrechnungsfall zusammengefasst werden.
Ein solcher Abrechnungsfall kann mehrere Kontakte umfassen (z.B. vorstationärer Besuch, stationärer Aufenthalt und nachstationärer Besuch).  

Gemeinsam mit dem Einrichtungskontakt bildet der Abrechnungsfall einen wichtigen Einstiegspunkt in die Dokumentation der Behandlungsleistungen der Patienten.
Als Bindeglied zwischen den Kontakten und dem Versicherungsverhältnis erfolgt eine feingranulare Auflistung, 
in welchen Zeiträumen ein Behandlungskontext zwischen einer Gesundheitseinrichtung und der Patienten bestand.
Zudem werden Diagnosen abschließend / nachträglich dokumentiert, sodass eine Übersicht von relevanten (DRG)-Diagnosen ermöglicht wird, 
ohne die Gesamtheit aller Kontakte betrachten zu müssen.

In FHIR wird der Abrechnungsfall mit der `Account`-Ressource repräsentiert.

### Kompatibilität
* zum Zeitpunkt der Veröffentlichung sind keine abweichenden Modellierungen der Account-Ressource bekannt.

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
* insert Meta
* extension MS
* extension contains http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur named AbrechnungsDiagnoseProzedur 0..* MS
* extension[AbrechnungsDiagnoseProzedur]
  * ^short = "Abrechnungsdiagnose /-prozedur"
  * ^comment = "Insbesondere bei Abrechnungen im DRG-Kontext muss eine Diagnose als Hauptdiagnose und 
  ggf. weitere Diagnosen als abrechnungsrelevante Nebendiagnosen klassifiziert werden. Diese Extension ermöglicht es, diese Qualifikation im Abrechnungskontext vorzunehmen, 
  unabhängig von der *medizinischen* Relevanz, die in `Encounter.diagnosis` erfolgt."
  * extension[Use] 1..1 MS
  * extension[Referenz] 1..1 MS
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Abrechnungsnummer 1..1 MS
* identifier[Abrechnungsnummer] only IdentifierAbrechnungsnummer
  * ^short = "Abrechnungsfallnummer"
  * ^comment = "Im DRG-Kontext werden häufig sämtliche Besuche (`Encounter`), die unter einen gemeinsamen Abrechnungskontext zusammengefasst werden, 
  unter einer &quot;Fallnummer&quot; geführt. In dieser Konstellation sind die Begriffe &quot;Fallnummer&quot; und &quot;Abrechnungsfallnummer&quot; gleichbedeutend.  
  Dies ist insbesondere im Kontext des Mappings zwischen HL7 V2 und HL7 FHIR zu beachten, da es in V2 Usus ist, 
  die Fallnummer (eigentlich Identifier des Abrechnungsfalles) im `PV1`-Segment (Patient Visit) zu übermitteln. 
  Es handelt sich dabei jedoch *nicht* um den Identifier des Besuchs (`Encounter`) sondern den des Abrechnungsfalles (`Account`), 
  da der Identifier oft für die Gruppierung mehrerer Besuche (z.B. vorstationär + stationär + nachstationär) mit gemeinsamem (DRG)-Kontext verwendet wird.  
  Die Abrechnungsfallnummer in `Account.identifier` muss identisch sein mit dem Identifier, 
  der bei den Encountern, die unter diesem Account gruppiert werden, unter `Encounter.account.identifier` angegeben ist."
  * ^patternIdentifier.type = $v2-0203#AN
  * type MS
    * coding
      * ^short = "Codierte Darstellung des Identifier-Typs"
      * system 1.. MS
        * ^short = "Codier-Schema"
        * ^comment = "Hier ist stets der Wert `http://terminology.hl7.org/CodeSystem/v2-0203` anzugeben." 
      * code 1.. MS
        * ^short = "Code"
        * ^comment = "Hier ist stets der Wert `AN` anzugeben."
  * system MS
    * ^short = "Namensraum des Identifiers"
    * ^comment = "Hier ist stets der eindeutige Name (URL) des Namensraums anzugeben, 
    aus dem der Identifier stammt. 
    Hinweise zur Festlegung der URLs für lokale Namensräume sind in den 
    [Deutschen Basisprofilen](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Terminologie-Namensraeume?version=current) beschrieben.  
    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
  * value MS
    * ^comment = "Enthält den eigentlichen Wert des Identifiers.  
    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden."

* status MS
  * ^short = "Status"
  * ^comment = "Zeigt den aktuellen Status der Ressource an.     
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch `active` und `inactive`.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."

//* type 1.. MS
//* type from ISiKAccountType (required)

* subject only Reference(Patient)
* subject 1..1 MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* coverage MS
  * ^short = "Versicherungs-/Zahlungsverhältnis"
  * ^comment = "Auflistung aller Versicherungs- und oder (Selbst-/Fremd-)zahlerverhältnisse, die zur Abrechnung der in diesem Kontext erbrachten Leistungen herangezogen werden können."
  * priority MS
    * ^short = "Priorität"
    * ^comment = "**Begründung des MS:** Wenn ein Primärsystem mehrere Kostenträger angibt, 
    sollte für lesende Systeme ersichtlich sein, welches der Hauptkostenträger ist.   
    **Historie:**  
    Diskussionstand der ISIK-Arbeitsgruppe vom 28.5.: Die Abbildung über einen Integer ist wünschenswert. 
    Eine binäre Einteilung in Hauptkostenträger (1) und alle anderen (2) wird der Komplexität der Priorisierung zur Kostenträgerschaft nicht gerecht. 
    Eine Ausdifferenzierung ist wünschenswert und sollte angestrebt werden."
  * extension 1..1 MS
  * extension contains http://fhir.de/StructureDefinition/ExtensionAbrechnungsart named Abrechnungsart 1..1 MS
  * extension[Abrechnungsart]
    * ^short = "Abrechnungsart"
    * ^comment = "Art der Abrechnung, für die das Versicherungsverhältnis herangezogen wird."
  * coverage MS
    * reference 1.. MS
      * ^short = "Coverage-Link"
      * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Coverage-Ressource dient der technischen Zuordnung zwischen Abrechnungsfall und Versicherungsverhältnis
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."

Instance: AbrechnungsfallDRG
InstanceOf: ISiKAbrechnungsfall
Usage: #example
* extension[+]
  * url = "http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur"
  * extension[+].url = "Use"
  * extension[=].valueCoding = http://fhir.de/CodeSystem/KontaktDiagnoseProzedur#hospital-main-diagnosis "Krankenhaus Hauptdiagnose"
  * extension[+].url = "Referenz"
  * extension[=].valueReference = Reference(Condition/DiagnoseSelteneErkrankung)
* identifier[Abrechnungsnummer]
  * system = "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer"
  * value = "0123456789"
* status = #active
* type = $v3-ActCode#IMP
* subject = Reference(PatientinMusterfrau)
* coverage
  * extension[Abrechnungsart]
    * valueCoding = $Abrechnungsart#DRG "Diagnosebezogene Fallgruppen"
  * coverage = Reference(CoverageGesetzlich)
