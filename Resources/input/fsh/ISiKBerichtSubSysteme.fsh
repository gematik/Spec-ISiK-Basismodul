Profile: ISiKBerichtSubSysteme
Parent: Composition
Id: ISiKBerichtSubSysteme
Description: 
"Dieses Profil ermöglicht die krankenhaus-interne Übermittlung eines Berichtes bestehend aus beliebien strukturierten FHIR-Ressourcen 
sowie einer textuellen HTML-Repräsentation (Narrative) an einen ISiK-Basis-kompatiblen Server.
### Motivation
In der heterogenen Systemlandschaft im Krankenhaus sind eine Vielzahl spezialisierter Subsysteme im Einsatz. Die Ergebnisse aus diesen Subsystemen sind aktuell jedoch häufig nicht in den Primärsystemen des Krankenhauses verfügbar, denn es bestehen folgende Herausforderungen:

Die Daten in Subsystemen sind sehr heterogen und können hochspezialisiert sein.
Bei der Nutzung dieser Subsysteme besteht häufig ein Interesse, auf die menschenlesbare Repräsentation der strukturierten Daten einwirken zu können.
Künftig ist mit Szenarien zu rechnen, bei denen Befunde aus Subsystemen in eine elektronische Patientenakte übertragen werden sollen.
Aktuell werden Befunde, obwohl diese in den Subsystemen in hochstrukturierter Form vorliegen, nur als PDF an das Primärsystem übermittelt. Oft weil kein strukturiertes Format spezifiziert ist, das sowohl versendendes Subsystem als auch empfangendes Primärsystem implementiert haben.
Der Umfang, in dem eine Datenübernahme in ein Primärsystem möglich ist, variiert stark zwischen den Systemen oder Installationen, z.B. abhängig davon, ob ein Modul für Vitalparameter installiert ist.
Die ISiK-Spezifikation begegnet diesen Herausforderungen, indem sie die Übermittlung von Ergebnissen aus Subsystemen an die Primärsysteme in Form von strukturierten Dokumenten erfordert, die über eine menschenlesbare Repräsentation verfügen. Diese strukturierten Dokumente werden im ISiK-Kontext als Berichte bezeichnet. Dabei sind die strukturierten Inhalte der Berichte harmonisiert mit den verbreiteten Formaten für Primärsysteme.

(Semi-)Strukturierte Dokumente werden in FHIR mit der `Composition`-Ressource repräsentiert, 
die die Dokumentenmetadaten sowie die textuelle Repräsentation des Dokumentes enthält.
Die Composition referenziert auf beliebige weiter FHIR-Ressourcen, die die strukturierten Komponenten des Dokumentes darstellen.

Für den Transport wird die Composition zusammen mit allen direkt oder indirekt referenzierten Ressourcen in eine `Bundle`-Ressource
 vom Typ `document` aggregiert. 
Das Document-Bundle trägt alle Eigenschaften eines Dokumentes: Abgeschlossenheit, Unveränderbarkeit, Signierbarkeit.  

Es obliegt dem empfangenden System, ob dieses Dokument lediglich in seiner Gesamtheit persistiert wird, oder ob darüber hinaus einzelne Bestandteile (Ressourcen) 
als strukturierte Daten automatisch oder auf Veranlsassung eines Benutzers in die Patientenakte übernommen werden. 

In der aktuellen Ausbaustufe von ISiK ist lediglich die Übernahme und Anzeige der Dokument-Metadaten (z.B. Dokumenttyp, Dokumentdatum, Quelle) und der menschenlesbaren HTML-Repräsentation in die Primärsysteme erforderlich.  

In weiteren Ausbaustufen von ISiK soll darüber hinaus eine Übernahme der strukturierten Anteile der Dokumente möglich sein, die den ISiK-Spezifikationen entsprechen, z.B. Diagnosen und Prozeduren.  

### Kompatibilität  
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* text 1.. MS
  * ^short = "Narrativ"
  * ^comment = "HTML-Repräsentation des Dokumenten-Headers.   
    Bitte Hinweise unter [Document Presentation](https://hl7.org/fhir/documents.html#presentation) beachten.  
    Der DokumentenHeader muss mindestens die folgenden Informationen enthalten:
* `Composition.subject:Patient.name.family`
* `Composition.subject:Patient.birthDate`
* `Composition.subject:Patient.identifier:pid`
* `Composition.status`
* `Composition.type.text`
* `Composition.date`
* `Composition.title`
* `Composition.author.display`"
  * status = #extensions (exactly)
  * status MS
  * div MS
* identifier 1.. MS
  * ^short = "Eindeutige Dokumenten-ID"
  * ^comment = """Eine vom erzeugenden Subsystem vergebene, eindeutige DokumentenID.  
  Wenn es sich bei dem verwendeten Identifier um eine OID oder UUID handelt, so ist hier der Wert `urn:ietf:rfc:3986` anzugeben und in `Identifier.value` das jeweilige Präfix `urn:uuid:` bzw. `urn:oid:` zu verwenden.  
  Beispiel:
```xml  
<identifier> 
    <system value="urn:ietf:rfc:3986">  
    <value value="urn:oid:2.16.840.1.113883.6.96"> 
</identifier>
```
"""
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
* status = #final (exactly)
  * ^short = " Status des Dokumentes"
  * ^comment = "Im Kontext diese Moduls ist nur der Austausch finaler Berichte vorgesehen. 
  Ein Mechanismus zur Änderung oder Ersetzung bereits übermittelter Daten ist derzeit nicht spezifiziert. 
  Hier ist stets der Wert `final` anzugeben."
* status MS
* type MS
  * ^short = "Dokumenttyp"
  * ^comment = "Das Dokument KANN z.B. mittels LOINC, KDL oder IHE-D-XDS-Typecodes klassifiziert werden.  
  Derzeit MUSS lediglich eine textuelle Beschreibung des Dokumenttyps angegeben werden."
  * text 1.. MS
    * ^short = "Dokumenttyp (Freitext)"
    * ^comment = "Freitextliche Beschreibung oder assoziierter Displaywert der primären Codierung des Dokumenttyps."
* type.coding 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* type.coding contains
    LOINC 0..1 MS and
    KDL 0..1 MS and
    IHE 0..1 MS
* type.coding[LOINC] = $loinc#55112-7
  * system 1..
  * system = $loinc
  * code 1..
* type.coding[KDL] ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1..
  * system = "http://dvmd.de/fhir/CodeSystem/kdl" (exactly)
  * code 1..
    * obeys kdl-1
* type.coding[IHE] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode" (exactly)
  * code 1..
* category MS
  * ^short = "Dokument-Kategorie"
  * ^comment = "Das Dokument KANN z.B. mittels LOINC oder IHE-D-XDS-Classcodes klassifiziert werden. " 
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* category.coding contains
    LOINC 0..1 MS and
    IHE 0..1 MS
* category.coding[LOINC]
  * system 1..
  * system = $loinc
  * code 1..
* category.coding[IHE]
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDSclassCode" (exactly)
  * code 1..
* subject 1.. MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung des Dokumentes zu einem Patienten 
  und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.    
    **WICHTIGER Hinweis für Implementierer:** Die Zuordnung MUSS auf auf einen Encounter der Ebene &quot;Abteilungskontakt&quot; (siehe hierzu {{pagelink:Fall}}) erfolgen. 
    Bei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)&quot;Fallnummer&quot; (hier: `Encounter.account`) 
    unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten.)"
* date MS
  * ^short = "Dokumentendatum"
  * ^comment = "Datum der letzten Änderung des Dokumentes"
* author MS
  * ^short = "Verfasser/Ersteller des Dokumentes (Person oder Subsystem/Gerät)"
  * ^comment = "In der aktuellen Ausbaustufe von ISiK ist die Verwendung der textuellen Repräsentation (display) 
  von Autor und Subsystem ausreichend. 
  Die darüber hinausgehende Verlinkung auf Practitioner bzw. Device-Ressourcen 
  KANN implementiert werden."
* author only Reference(PractitionerRole or Device or Organization or RelatedPerson or Patient or Practitioner)
  * display 1.. MS
    * ^short = "Bezeichnung des Verfassers (Freitext)"
    * ^comment = "Freitextliche Bezeichnung des Verfassers (Person oder Subsystem/Gerät)"
* title MS
  * ^short = "Dokumentenbezeichnung"
  * ^comment = "Die Dokumentenbezeichnung dient der Darstellung des Dokumentes in einer Übersicht, 
  z.B. in einer Patientenakte, und KANN der schnellen Auffindbarkeit 
  eines gesuchten Dokumentes dienen. 
  Geeignete Bezeichnungen sind zum Beispiel:  
* &quot;Kleines Blutbild vom 13.10.2020&quot;
* &quot;Pathologiebefund (Abstrich) vom 13.10.2020&quot;
* &quot;Blutgasmessung vom 13.10.2020 14:14h&quot;"
* section 1.. MS
  * ^short = "Kapitel"
  * ^comment = "Das Dokument kann in mehrere Kapitel und Unterkapitel gegliedert werden."
  * title 1.. MS
    * ^short = "Kapitelbezeichnung"
  * text 1.. MS 
    * ^short = "Narrativ"
    * ^comment = "menschenlesbare HTML-Repräsentation des Inhalts dieses Kapitels.  
    Hinweise: Für Aggregation einer vollständigen menschenlesbaren Repräsentation 
    MÜSSEN die Repräsentationen der einzelnen Kapitel an die Repräsentation 
    der Metadaten (Composition.text) angehängt werden. 
    Für die Separierung KÖNNEN einfache &lt;div&gt;-Tags verwendet werden. 
    Es ist zu beachten, dass Kapitel auch Unterkapitel enthalten KÖNNEN 
    (Composition.section.section), die bei der Aggregation entsprechend 
    berücksichtigt werden MÜSSEN.  
Die Mindestanforderungen an den Inhalt der menschenlesbaren Repräsentation umfasst folgende Informationen:
* `section.title` + Freitext oder
* `section.title` + `Resource.text` der referenzierten Ressource oder
* `section.title` + eine aggregierte Repräsentation von `Resource.text`,
    wenn in einer Section mehrere Ressourcen referenziert werden 
    (z.B. eine tabellarische Auflistung mehrere Blutdruckmesswerte, Diagnosen oder Allergien)."
  * section MS
    * ^short = "Unterkapitel"

Instance: composition-blutdruck
InstanceOf: ISiKBerichtSubSysteme
Usage: #example
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">  <p> Familienname:Fürstin von Musterfrau</p>   <p> Geburtsdatum:1964-08-12</p>   <p> PID:TestPID</p>   <p> Bericht-Status:final</p>   <p> Bericht-Typ:Berichtzusammenfassung / Document Summary</p>   <p> Datum:03.05.2022</p>   <p> Titel:Blutdruckmessung vom 3.5.2022</p>   <p> Autor:Gerät XY, Fa. Z, Modell T</p></div>"
* identifier[0].type = $v2-0203#FILL
* identifier[=].system = "https://fhir.krankenhaus.example/sid/system-a/berichtnummer"
* identifier[=].value = "0123456789"
* status = #final
* type = $loinc#55112-7 
* type.text = "Kurzbericht"
* subject.reference = "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
* encounter.reference = "urn:uuid:74b46c1a-6fc9-11ed-a1eb-0242ac198765"
* date = "2022-05-03"
* author.type = "Device"
* author.display = "Gerät XY, Fa. Z, Modell T"
* title = "Blutdruckmessung vom 3.5.2022"
* section[0].title = "Messung"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b> Systolisch</b></td><td><b> Diastolisch</b></td><td><b> Einheit</b></td><td><b> Uhrzeit</b></td></tr><tr><td> \r\n\t\t\t\t\t\t\t140\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t110\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\tmmHG\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t17:15h\r\n\t\t\t\t\t\t</td></tr></table></div>"

Invariant: kdl-1
Description: "KDL-Code ungültig"
Severity: #warning
Expression: "matches('^[A-Z]{2}[0-9]{6}$')"