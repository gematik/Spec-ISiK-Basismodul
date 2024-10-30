Profile: ISiKProzedur
Parent: Procedure
Id: ISiKProzedur
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Behandlungen/Prozeduren eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.
### Motivation
Die Möglichkeit auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.

In FHIR werden Prozeduren mit der Procedure-Ressource repräsentiert.

Da die Prozeduren in klinischen Primärsystemen, in der Regel, in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.

### Kompatibilität
Für das Profil ISIKProzedur wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKProzedur valide sind, auch valide sind gegen:

* [Profil Prozedur](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) der Medizininformatik Initiative  
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* obeys proc-ISiK-1 and proc-ISiK-2
* . ^constraint[5].source = Canonical(ISiKProzedur)
* extension MS
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains ExtensionProzedurDokumentationsdatum named Dokumentationsdatum 0..1 MS
* extension[Dokumentationsdatum]
  * ^short = "Dokumentationsdatum"
  * ^comment = "Datum, an dem die Prozedur dokumentiert wurde.  
  Es handelt sich hierbei um das fachliche Dokumentationsdatum, nicht zu verwechseln mit dem Datum der technischen Anlage des Datensatzes im Primärsystem. 
  Diese beiden Daten *können* jedoch identisch sein."
* status MS
  * ^short = "Status"
  * ^comment = "Zeigt den aktuellen Status der Prozedur an.     
  **WICHTIGER Hinweis für Implementierer:  
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch die Werte `completed` und `unknown`.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Prozeduren mit dem status `entered-in-error` und Ausgrauen von Prozeduren, die noch nicht stattgefunden haben, o.ä."
* category MS
  * ^short = "Kategorie"
  * ^comment = "Die Kategorisierung erfolg vorzugsweise auf Basis von SNOMED. Für OPS-codierte Prozeduren MUSS die Kategorie angegeben werden: Sie kann ermittelt werden, 
  indem das erste Zeichen des OPS-Codes mit Hilfe einer [ConceptMap](http://fhir.de/ConceptMap/OPS-SNOMED-Category) auf die zutreffende SNOMED-Kategorie gemappt wird.
  **Begründung MS:** Die Kategorisierung dient der Verbesserung von Suche und Darstellung."
  * coding ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains SNOMED-CT 0..1 MS
  * coding[SNOMED-CT] only ISiKSnomedCTCoding
  * coding[SNOMED-CT] from $ProzedurenKategorieSCT (preferred)
* code 1.. MS
  * ^short = "Prozeduren-Code"
  * ^comment = "Prozeduren SOLLEN mindestens entweder mit einem OPS-Code oder einem SNOMED-Code aus dem angegebenen ValueSet codiert werden. 
  Ist keine Codierung möglich, MUSS statt dessen eine textuelle Beschreibung der Prozedur angegeben werden.  
  **Begründung Pflichtfeld:** Ist *weder* eine Codierung *noch* eine textuelle Beschreibung vorhanden, besitzt diese Ressource keine medizinische Aussagefähigkeit."
  * obeys sct-ops-1 and proc-ISiK-3
  * ^constraint[1].source = Canonical(ISiKProzedur)
  * coding MS
    * ^short = "Codierte Darstellung der Prozedur"
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains
      OPS 0..1 MS and
      SNOMED-CT 0..1 MS
  * coding[OPS] only CodingOPS
  * coding[OPS] from OpsVS (required)
    * ^short = "OPS-codierte Darstellung der Prozedur"
    * extension[Seitenlokalisation] MS
      * ^short = "Seitenlokalisation"
      * ^comment = "**Begründung MS:** Bei OPS-codierten Prozeduren an paarigen Organen oder Körperteilen müssen die Zusatzkennzeichen für die Seitigkeit (R, L oder B) angeben werden"
    * system MS
      * ^short = "Namensraum des Prozeduren-Codes"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/CodeSystem/bfarm/ops` anzugeben."
    * version MS
      * ^short = "Die Jahresversion des OPS Kataloges. Angegeben wird immer die vierstellige Jahreszahl (z.B. `2017`)"
      * ^comment = "**Begründung Pflichtfeld:** Bei Verwendung von OPS ist die Angabe der Version zwingend erforderlich. 
      Hierdurch wird der Tatsache Rechnung getragen, dass jede der jährlich neu erscheinenden Fassung von OPS ein neues Codesystem darstellt."
    * code MS
      * ^short = "OPS-Code"
      * ^comment = "Hier ist der OPS-Code ohne jegliche Zusatzkennzeichen (z.B. Seitenlokalisation) oder Versionsnummern anzugeben."
  * coding[SNOMED-CT] only ISiKSnomedCTCoding
  * coding[SNOMED-CT] from $ProzedurenCodesSCT (required)
    * ^short = "SNOMED-codierte Darstellung der Prozedur"
  * text MS
    * ^short = "Freitextiche Beschreibung der Prozedur"
    * ^comment = "Die freitextliche Beschreibung kann ergänzend oder anstelle einer codierten Angabe der Prozedur erfolgen."
* subject MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.    
    **WICHTIGER Hinweis für Implementierer:** Die Zuordnung MUSS auf auf einen Encounter der Ebene &quot;Abteilungskontakt&quot; (siehe hierzu {{pagelink:Fall}}) erfolgen. 
    Bei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)&quot;Fallnummer&quot; (hier: `Encounter.account`) 
    unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten.)"
* performed[x] 1.. MS
  * ^short = "Durchführungsdatum oder -Zeitraum"
  * ^comment = "Es muss mindestens entweder ein (partielles) Durchführungsdatum oder der Beginn des Durchführungszeitraumes angegeben werden.
  **Begründung Pflichtfeld:** Die zeitliche Einordnung einer Prozedur ist in vielen Fällen maßgeblich für deren medizinische Relevanz."
* performed[x] only dateTime or Period
* note MS
  * ^short = "Notizen"
  * ^comment = "Ergänzende Hinweise und Anmerkungen zur Prozedur"

Instance: Appendektomie
InstanceOf: ISiKProzedur
Usage: #example
* extension.url = "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum"
* extension.valueDateTime = "2020-04-23"
* status = #completed
* category = $sct#387713003 "Surgical procedure (procedure)"
* code.coding[0] = $sct#80146002 "Excision of appendix (procedure)"
* code.coding[+].version = "2020"
* code.coding[=] = $ops#5-470 "Appendektomie"
* code.text = "Entfernung des Blinddarms"
* subject = Reference(PatientinMusterfrau)
* performedDateTime = "2020-04-23"
* note.text = "Testnotiz"

Invariant: proc-ISiK-1
Description: "Falls die Prozedur per OPS kodiert wird, MUSS eine SNOMED-CT kodierte Category abgebildet werden"
Severity: #error
Expression: "code.coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists() implies category.coding.where(system = 'http://snomed.info/sct').exists()"

Invariant: proc-ISiK-2
Description: "Falls eine codierte Prozedur vorliegt MUSS eine kodierte Category abgebildet werden"
Severity: #error
Expression: "code.coding.exists() implies category.coding.exists()"

Invariant: sct-ops-1
Description: "Falls die Prozedur kodiert vorliegt, SOLL mindestens ein OPS oder SNOMED-CT Code angegeben werden."
Severity: #error
Expression: "coding.exists() implies coding.where(system = 'http://snomed.info/sct').exists() or coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists()"

Invariant: proc-ISiK-3
Description: "Entweder MUSS eine kodierte Prozedur vorliegen oder eine textuelle Beschreibung. Stattdessen nur Extensions hinzuzufügen (vgl. https://www.hl7.org/fhir/element.html - ele-1), ist explizit nicht erlaubt."
Severity: #error
Expression: "coding.exists().not() implies text.exists()"