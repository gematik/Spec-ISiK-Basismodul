Profile: ISiKKontaktGesundheitseinrichtung
Parent: Encounter
Id: ISiKKontaktGesundheitseinrichtung
Description: "
Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.
### Motivation
Informationen über die Besuche des Patienten entlang seines 
Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil 
des einrichtungsinternen Datenaustausches. 
Sie ermöglichen die Unterscheidung von stationären und ambulanten 
sowie aufgenommenen und entlassenen Patienten. 
Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort 
des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. 
Klinische Ressourcen werden in FHIR durch Verlinkung auf die 
Encounter-Ressource in einen Kontext zum Besuch gestellt. 
Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen 
und Abrechnungsprozessen.  

Zu Beginn der meisten klinischen Workflows steht die Auswahl 
des Besuchskontextes. 
Dies geschieht bspw. durch das Suchen der Encounter-Ressource 
anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. 
Daraufhin werden die zutreffenden Suchergebnisse angezeigt 
und der gewünschte Besuch ausgewählt.

In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.

### Kompatibilität
Für das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität 
mit folgenden Profilen angestrebt; 
allerdings kann nicht sichergestellt werden, dass Instanzen, 
die gegen ISiKKontaktGesundheitseinrichtung valide sind, 
auch valide sind gegen:

* Profil [Kontakt mit einer Gesundheitseinrichtung 
der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."


* insert Meta
* obeys ISiK-enc-1 and ISiK-enc-2 and ISiK-enc-3 and ISiK-enc-4 and ISiK-enc-5 and ISiK-enc-6 and ISiK-enc-7 and ISiK-enc-8
* extension MS
* extension contains ExtensionAufnahmegrund named Aufnahmegrund 0..1 MS
* extension[Aufnahmegrund]
  * ^short = "Aufnahmegrund"
  * ^comment = "Aufnahmegrund nach § 301 Abs. 3 SGB V."
  * extension[ErsteUndZweiteStelle] MS
    * ^short = "Aufnahmegrund: 1. & 2. Stelle"
    * ^comment = "1. und 2. Stelle des Aufnahmegrunds nach § 301 Abs. 3 SGB V."
  * extension[DritteStelle] MS
    * ^short = "Aufnahmegrund: 3. Stelle"
    * ^comment = "3. Stelle des Aufnahmegrunds nach § 301 Abs. 3 SGB V."
  * extension[VierteStelle] MS
    * ^short = "Aufnahmegrund: 4. Stelle"
    * ^comment = "4. Stelle des Aufnahmegrunds nach § 301 Abs. 3 SGB V."
 
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate named plannedStartDate 0..1 MS
* extension[plannedStartDate]
  * ^short = "geplantes Aufnahmedatum"
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate named plannedEndDate 0..1 MS
* extension[plannedEndDate]
  * ^short = "geplantes Entlassdatum"
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer 0..1 MS
* identifier[Aufnahmenummer] ^patternIdentifier.type = $v2-0203#VN
  * type 1.. MS
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains vn-type 1..1 MS
    * coding[vn-type] = $v2-0203#VN 
      * ^short = "Codierte Darstellung des Identifier-Typs"
      * system 1.. MS
        * ^short = "Codier-Schema"
        * ^comment = "Hier ist stets der Wert `http://terminology.hl7.org/CodeSystem/v2-0203` anzugeben." 
      * code 1.. MS
        * ^short = "Code"
        * ^comment = "Hier ist stets der Wert `VN` anzugeben."
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
* status from EncounterStatusDe (required)
  * ^short = "Status"
  * ^comment = "Zeigt den aktuellen Status der Ressource an.     
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch die Werte `in-progress`, `finished` und `cancelled`.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.  
  **Historie:** Die Reduktion der zulässigen Status-Werte im Vergleich zur FHIR-Kernspezifikation 
  erfolgt im Vorgriff auf eine entsprechende Anpassung in FHIR R5."
  * ^binding.description = "Eingeschränkter Status vgl. FHIR R5"
* class MS
* class from EncounterClassDE (required)
  * ^short = "Fallart"
  * ^comment = "Die Klassifikation von Encountern nach Fallarten folgt den internationalen Vorgaben und 
  dient der groben Unterscheidung von Besuchen mit und ohne Bettendisposition (ambulant/stationär). 
  Die in Deutschland übliche Fallklassifikation anhand von unterschiedlichen 
  regulatorischen und abrechnungrelevanten Rahmenbedingungen, erfolgt in `type`.  
  Für ein korrektes Mapping der in Deutschland gebräuchlichen Fallarten auf `class` siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-AmbulanterStationaererFall?version=current)"
* type MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type contains
    Kontaktebene 1..1 MS and
    KontaktArt 0..1 MS
* type[Kontaktebene] from http://fhir.de/ValueSet/kontaktebene-de (required)
  * ^patternCodeableConcept.coding = $Kontaktebene#abteilungskontakt
  * ^binding.description = "Kontaktebene"
  * ^short = "Kontaktebene"
  * ^comment = "Das Konzept der 'Kontaktebene' stammt aus dem Fallmodell der Medizininformatik-Initiative, 
  das bei Encountern zwischen 'Einrichtungskontakten', 'Fachabteilungskontakten' und 'Versorgungsstellenkontakten' unterscheidet.
  Im Kontext dieses Moduls werden lediglich Encounter der Ebene 'Fachabteilungskontakt' abgebildet.
  **Begründung Pflichtfeld:** Die Abteilungsebene muss aus Kompatibilitätsgründen angegeben werden."
  * coding
    * ^short = "Codierte Darstellung der Kontaktebene"
    * system 1.. MS
      * ^short = "Codier-Schema"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/CodeSystem/Kontaktebene` anzugeben." 
    * code 1.. MS
      * ^short = "Code"
      * ^comment = "Hier ist stets der Wert `abteilungskontakt` anzugeben."
* type[KontaktArt] from KontaktartDe (required)
  * ^short = "Kontaktart"
  * ^comment = "Die Kontaktart dient der feingranularen Differenzierung unterschiedlicher stationärer 
  und ambulanter Fallarten gemäß der in Deutschland üblichen regulatorischen 
  und abrechnungsrelevanten Rahmenbedingungen.  
  Für ein korrektes Mapping der in Deutschland gebräuchlichen Fallarten auf `type` siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-AmbulanterStationaererFall?version=current)"
  * ^patternCodeableConcept.coding.system = "http://fhir.de/CodeSystem/kontaktart-de"
  * coding
    * ^short = "Codierte Darstellung der Kontaktart"
    * system 1.. MS
      * ^short = "Codier-Schema"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/CodeSystem/kontaktart-de` anzugeben." 
    * code 1.. MS
      * ^short = "Code"
      * ^comment = "vorstationaer | nachstationaer | begleitperson | tagesklinik | +"
* serviceType 0..1 MS
  * coding 1.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
    Fachabteilungsschluessel 0..1 MS and 
    ErweiterterFachabteilungsschluessel 0..1 MS
  * coding[Fachabteilungsschluessel] from $FachabteilungsschluesselVS (required)
    * ^patternCoding.system = $FachabteilungsschluesselCS
    * ^short = "Fachabteilungsschlüssel"
    * ^comment = "Fachabteilungen gemäß Anhang 1 der BPflV"
  * coding[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
    * ^patternCoding.system = $FachabteilungsschluesselErweitertCS
    * ^short = "Fachabteilungsschlüssel"
    * ^comment = "Fachabteilungen gemäß Anhang 1 der BPflV inkl. Spezialisierungen"
* subject 1.. MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten 
      und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* period 0.. MS
  * ^short = "Aufenthaltszeitraum"
  * ^comment = "**WICHTIGER Hinweis für Implementierer:** 
  * Das Aufnahmedatum  MUSS angegeben werden, 
  wenn der `status` des Encounters impliziert, dass dieser bereits begonnen hat.
  * Das Entlassdatum MUSS angegeben werden, 
  wenn der `status` des Encounters impliziert, dass dieser beendet ist.  
  Siehe hierzu die Übersicht der Invarianten in diesem Profil. "
  * start 0.. MS
    * ^short = "Aufnahmedatum"
    * ^comment = "Hier ist stets das *tatsächliche* Aufnahmedatum anzugeben.
    *Geplante* Aufnahmedaten müssen über die Extension `plannedStartDate` erfasst werden."
  * end MS
    * ^short = "Entlassdatum"
    * ^comment = "Hier ist stets das *tatsächliche* Entlassdatum anzugeben.
    *Geplante* Entlassdaten müssen über die Extension `plannedEndDate` erfasst werden."
  
* diagnosis 
  * ^short = "Falldiagnosen/-prozeduren"
  * ^comment = "Verweis auf Diagnosen/Prozeduren, die eine besondere Rolle im Kontext eines Encounters einnehmen, z.B. &quot;Aufnahmediagnose&quot;   
  **WICHTIGER Hinweis für Implementierer:**   Der Fallbezug von Diagnosen und Prozeduren wird über das jeweilige `encounter`-Element 
  der Condition bzw. Procedure-Ressource hinreichend etabliert.  Die *zusätzliche* Rückverlinkung von `Encounter.diagnosis` auf Condition/Procedure wird *nur dann* verwendet, 
  wenn einer Diagnose bzw. Prozedur *im Kontext eines Aufenthaltes* eine besondere Rolle zugewiesen werden soll, z.B. Haupt-/Neben-/Aufnahme- oder Überweisungsdiagnose).  
  Hier werden Diagnosen und Prozeduren nur nach ihrer *medizinschen* Relevanz bezüglich eines Aufenthaltes qualifiziert. 
  Die Qualifikation von Diagnosen und Prozeduren im Kontext der *Abrechnung* erfolgt in der `Account`-Ressource!" 
  * condition MS
    * ^short = "Verweis auf Diagnose/Prozedur"
    * reference 1.. MS
      * ^short = "Condition/Procedure-Link"
      * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf die Condition/Procedure-Ressource dient der technischen Zuordnung des Encounters zur Condition/Precedure 
  und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
  * use 1.. MS 
    * ^short = "Bedeutung der Diagnose/Prozedur"
    * ^comment = "Bedeutung der Diagnose/Prozedur im Encounter-Kontext"
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
      Diagnosetyp 1..1 MS and 
      DiagnosesubTyp 0.. MS
    * coding[Diagnosetyp] from http://fhir.de/ValueSet/DiagnoseTyp (required)
      * ^short = "Diagnosetyp"
      * ^comment = "International standardisierte, grobgranulare Unterscheidung zwischen extern gestellten Diagnosen (`referral-diagnosis`) und intern gestellten Diagnosen (`treatment-diagnosis`)"
    * coding[DiagnosesubTyp] from http://fhir.de/ValueSet/Diagnosesubtyp (required)
      * ^short = "Diagnosesubtyp"
      * ^comment = "An deutschen Kodierrichtlinien orientierte, feingranulare Unterscheidung von Diagnose-Rollen, 
      z.B. &quot;Fachabteilungshauptdiagnose&quot;, &quot;Todesursache&quot; etc."
  * rank MS
* account 0.. MS
  * ^short = "Abrechnungskontext"
  * ^comment = "Der Bezug zu einem Account stellt den Abrechnungskontext für einen oder mehrere Encounter her.
  Mittels der Account-Referenz können zum Beispiel ein vorstationärer, ein stationärer 
  und ein nachstationärer Besuch zu einem 'DRG-Fall' zusammengefasst werden.  
  **WICHTIGER Hinweis für Implementierer:** Im Deutschen Sprachgebrauch ist unter dem Begriff 'Fall' 
  meist der Abrechnungskontext gemeint, nicht der einzelne Besuch. Die 'Fallnummer' ist daher nicht der Identifier des Encounters, 
  sondern der des Accounts auf den der Encounter referenziert. 
  Auf diesem Wege können mehrere Besuche einer Fallnummer zugeordnet werden.  
  Da die Fallnummer ein häufig verwendetes Suchkriterium darstellt, 
  ist diese hier als logische Referenz (`account.identifier`) zu hinterlegen.
  Damit wird sichergestellt, dass diese als Suchparameter für die Suche nach Encountern zur Verfügung steht, 
  auch wenn einzelne Systeme kein Chaining unterstützen oder einzelne Benutzer keine Sichtberechtigung auf Abrechnungsdaten haben,
  im Versorgunskontext aber dennoch Encounter anhand der assoziierten Fallnummer suchen möchten."
  * identifier 1.. MS
    * ^short = "(Abrechnungs-)Fallnummer"
    * system 1.. MS
      * ^short = "Namensraum des Identifiers"
      * ^comment = "Hier ist stets der eindeutige Name (URL) des Namensraums anzugeben, 
      aus dem der Identifier stammt. 
      Hinweise zur Festlegung der URLs für lokale Namensräume sind in den 
      [Deutschen Basisprofilen](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Terminologie-Namensraeume?version=current) beschrieben.  
      **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
    * value 1.. MS
      * ^comment = "Enthält den eigentlichen Wert des Identifiers.  
        **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden."
  * reference 0.. MS
    * ^short = "Account-Link"
    * ^comment = "**Begründung MS:** Die Verlinkung auf eine Account-Ressource dient der technischen Zuordnung des Besuchs zu einem Abrechnungskontext 
  und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* hospitalization ..1 MS
  * ^short = "Details zum Aufenthalt"
  * ^comment = "Details zu einem stationären Aufenthalt"
  * admitSource 0..1 MS
  * admitSource from AufnahmeanlassVS (extensible)
    * ^short = "Aufnahmeanlass"
    * ^comment = "Anlass der stationären Aufnahme, z.B. &quot;Einweisung&quot;, &quot;Notfall&quot; etc.  
      Begründung MS: Zur Harmonisierung den Festlegungen der Medizininformatik-Initiative"
  * dischargeDisposition MS
    * ^short = "Entlassungsart bzw. -grund"
    * extension contains ExtenstionEntlassungsgrund named Entlassungsgrund 0..1 MS and ExtensionISiKRehaEntlassung named RehaEntlassung 0..1 MS
    * extension[Entlassungsgrund]
      * ^short = "Entlassungsgrund"
      * ^comment = "Entlassungsgrund nach § 301 Abs. 3 SGB V  
        **Einschränkung MS:** Der Entlassungsgrund muss nur implementiert werden,
         wenn das bestätigungsrelevante System in der Akutversorgung eingesetzt wird."
    * extension[RehaEntlassung]
      * ^short = "Entlassungsgrund Reha"
      * ^comment = "Entlassungsgrund nach §301 (Abs. 4 und 4a) SGB V  
      **Einschränkung MS:** Der Entlassungsgrund Reha muss nur implementiert werden,
        wenn das bestätigungsrelevante System in der Reha-Versorgung eingesetzt wird"
  * extension contains $WahlleistungExtension named Wahlleistung 0.. MS
  * extension[Wahlleistung]
    * ^short = "Wahlleistung"
    * ^comment = "**Begründung MS:**  Vom Patienten gebuchte Wahlleistungen (z.B. Chefarztbehandlung, Einzelzimmer) 
    sind häufig system- und abteilungsübergreifend zu beachten und sollten daher über die Schnittstelle kommuniziert werden können."  
* location MS
  * physicalType from ISiKLocationPhysicalType (extensible)
* location ^slicing.discriminator[+].type = #pattern
* location ^slicing.discriminator[=].path = "physicalType"
* location ^slicing.discriminator[+].type = #pattern
* location ^slicing.discriminator[=].path = "status"
* location ^slicing.rules = #open
* location 
  * ^short = "Aufenthaltsorte des Patienten"
* location contains  Zimmer 0..1 MS and Bettenstellplatz 0..1 MS and Station 0..1 MS
* location[Station]
  * location 1.. MS
    * ^short = "Aufenthaltsort"
    * ^comment = "**Begründung MS:** die Kenntnis des aktuellen Aufenthaltsortes ist häufig systemübergreifend relevant (z.B. für Küchen- und Logistiksysteme) und sollte daher über die Schnittstelle kommuniziert werden können."
    * reference MS
      * ^short = "Location-Link"
      * ^comment = "**Begründung MS:** Die Verlinkung auf eine Location-Ressource dient der technischen Zuordnung des Besuchs zu einem Aufenthaltsort 
  und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
    * identifier 1.. MS
      * ^short = "Identifier des Aufenthaltsortes"
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
    * display 1.. MS
      * ^short = "(Menschenlesbarer) Name des Aufenthaltsortes"
  * physicalType 1..1 MS
  * physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa
    * ^short = "Art des Aufenthaltsortes (hier: Station)"
    * coding
      * ^short = "Codierte Darstellung der Art des Aufenthaltortes"
      * system 1.. MS
        * ^short = "Codier-Schema"
        * ^comment = "Hier ist stets der Wert `http://terminology.hl7.org/CodeSystem/location-physical-type` anzugeben." 
      * code 1.. MS
        * ^short = "Code"
        * ^comment = "Hier ist stets der Wert `wa` anzugeben."
  * status MS
  * status = #active
* location[Zimmer]
  * location 1.. MS
    * ^short = "Aufenthaltsort"
    * reference MS
      * ^short = "Location-Link"
      * ^comment = "**Begründung MS:** Die Verlinkung auf eine Location-Ressource dient der technischen Zuordnung des Besuchs zu einem Aufenthaltsort 
  und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
    * identifier 1.. MS
      * ^short = "Identifier des Aufenthaltsortes"
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
    * display 1.. MS
      * ^short = "(Menschenlesbarer) Name des Aufenthaltsortes"
  * physicalType 1..1 MS
  * physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#ro
    * ^short = "Art des Aufenthaltsortes (hier: Zimmer)"
    * coding
      * ^short = "Codierte Darstellung der Art des Aufenthaltortes"
      * system 1.. MS
        * ^short = "Codier-Schema"
        * ^comment = "Hier ist stets der Wert `http://terminology.hl7.org/CodeSystem/location-physical-type` anzugeben." 
      * code 1.. MS
        * ^short = "Code"
        * ^comment = "Hier ist stets der Wert `ro` anzugeben."  
  * status MS
  * status = #active
* location[Bettenstellplatz]
  * location 1.. MS
    * ^short = "Aufenthaltsort"
    * reference MS
      * ^short = "Location-Link"
      * ^comment = "**Begründung MS:** Die Verlinkung auf eine Location-Ressource dient der technischen Zuordnung des Besuchs zu einem Aufenthaltsort 
  und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
    * identifier 1.. MS
      * ^short = "Identifier des Aufenthaltsortes"
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
    * display 1.. MS
      * ^short = "(Menschenlesbarer) Name des Aufenthaltsortes"
  * physicalType 1..1 MS
  * physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd
    * ^comment = "Die Kodierung in diesem Slice entstammt folgendem Valueset - gelistet unter .location.(All slices.)physicalType: https://gematik.de/fhir/isik/ValueSet/ISiKLocationPhysicalType"
    * ^short = "Art des Aufenthaltsortes (hier: Bettenstellplatz)"
    * coding
      * ^short = "Codierte Darstellung der Art des Aufenthaltortes"
      * system 1.. MS
        * ^short = "Codier-Schema"
        * ^comment = "Hier ist stets der Wert `http://terminology.hl7.org/CodeSystem/location-physical-type` anzugeben." 
      * code 1.. MS
        * ^short = "Code"
        * ^comment = "Hier ist stets der Wert `bd` anzugeben."
  * status MS
  * status = #active
* serviceProvider MS
  * identifier 1.. MS
  * display 1.. MS

Extension: ExtensionISiKRehaEntlassung
Id: ExtensionISiKRehaEntlassung
Description: "Extension zur Dokumentation von Informationen nach §301 (4 und 4a) SGB V, entsprechend dem ärztliche Reha-Entlassungsbericht"
Context: Encounter.hospitalization.dischargeDisposition
* insert Meta
* extension contains
    Entlassform ..1 MS and
    BesondereBehandlung ..1 MS and
    BehandlungsergebnisReha ..1 MS and
    UnterbrechnungReha ..1 MS
* extension[Entlassform]
  * value[x] only Coding
  * valueCoding from ISiKEntlassformReha (extensible)
* extension[BesondereBehandlung]
  * value[x] only Coding
  * valueCoding from ISiKBesondereBehandlungsformReha (required)
* extension[BehandlungsergebnisReha]
  * value[x] only Coding
  * valueCoding from ISiKBehandlungsergebnisReha (required)
* extension[UnterbrechnungReha]
  * value[x] only Coding
  * valueCoding from ISiKUnterbrechnungReha (required)

Instance: Fachabteilungskontakt
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
* extension.url = "http://fhir.de/StructureDefinition/Aufnahmegrund"
* extension.extension[0].url = "ErsteUndZweiteStelle"
* extension.extension[=].valueCoding = $AufnahmegrundErsteUndZweiteStelle#01 "Krankenhausbehandlung, vollstationär"
* extension.extension[+].url = "DritteStelle"
* extension.extension[=].valueCoding = $AufnahmegrundDritteStelle#0 "Anderes"
* extension.extension[+].url = "VierteStelle"
* extension.extension[=].valueCoding = $AufnahmegrundVierteStelle#1 "Normalfall"
* identifier.type = $v2-0203#VN
* identifier.system = "https://test.krankenhaus.de/fhir/sid/besuchsnummer"
* identifier.value = "0123456789"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* type[KontaktArt] = $Kontaktart-de#operation
* serviceType = $FachabteilungsschluesselCS#0100
* subject = Reference(PatientinMusterfrau)
* period.start = "2021-02-12"
* period.end = "2021-02-13"
* diagnosis.condition = Reference(BehandlungsDiagnoseFreitext)
* diagnosis.use = http://fhir.de/CodeSystem/KontaktDiagnoseProzedur#treatment-diagnosis
* account = Reference(AbrechnungsfallDRG)
* account.identifier
  * value = "XZY"
  * system = "https://test.krankenhaus.de/fhir/sid/fallnummer"
* hospitalization.admitSource = $Aufnahmeanlass#E
* hospitalization.dischargeDisposition.extension.url = "http://fhir.de/StructureDefinition/Entlassungsgrund"
* hospitalization.dischargeDisposition.extension.extension[0].url = "ErsteUndZweiteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundErsteUndZweiteStelle#01 "Behandlung regulär beendet"
* hospitalization.dischargeDisposition.extension.extension[+].url = "DritteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundDritteStelle#1 "arbeitsfähig entlassen"
* location.physicalType = $LocationPhysicalType#bd "Bed"
* location.status = #active
* location.location.identifier.system = "https://test.krankenhaus.de/fhir/sid/locationid"
* location.location.identifier.value = "123"
* location.location.display = "Bettenstellplatz 123"
* serviceProvider.identifier.system = "https://test.krankenhaus.de/fhir/sid/fachabteilungsid"
* serviceProvider.identifier.value = "XYZ"
* serviceProvider.display = "Fachabteilung XYZ"

Invariant: ISiK-enc-1
Description: "Abgeschlossene, ambulante Kontakte sollten einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'finished' and class = 'AMB' implies period.start.exists()"

Invariant: ISiK-enc-2
Description: "Abgeschlossene, stationäre Kontakte sollten einen Start- und End-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'finished' and class = 'IMP' implies period.start.exists() and period.end.exists()"

Invariant: ISiK-enc-3
Description: "Geplante Kontakte sollten keinen Start- oder End-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'planned' implies period.exists().not()"

Invariant: ISiK-enc-4
Description: "Geplante Kontakte sollten die Extensions für den geplanten Start- oder End-Zeitpunkt verwenden"
Severity: #warning
Expression: "status = 'planned' implies extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate').exists()"

Invariant: ISiK-enc-5
Description: "In-Durchführung befindliche Kontakte sollten einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'in-progress' implies period.start.exists()"

Invariant: ISiK-enc-6
Description: "Kontakte mit Abwesenheitsstatus sollten einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'onleave' implies period.start.exists()"

Invariant: ISiK-enc-7
Description: "Kontakte mit unbekannten Status sollten einen Start-Zeitpunkt angeben"
Severity: #warning
Expression: "status = 'unknown' implies period.start.exists()"

Invariant: ISiK-enc-8
Description: "Die Rolle der assoziierten Diagnose(n) darf nicht 'Billing' sein"
Severity: #error
Expression: "diagnosis.use.all(coding.code != 'billing')"


Instance: Encounter-date-start
InstanceOf: SearchParameter
Usage: #definition
* description = "The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values."
* insert MetaInstance
* name = "date-start"
* code = #date-start
* base = #Encounter
* type = #date
* expression = "Encounter.period.start"
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #ge
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap

Instance: Encounter-end-date
InstanceOf: SearchParameter
Usage: #definition
* description = "The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values."
* insert MetaInstance
* name = "end-date"
* code = #end-date
* base = #Encounter
* type = #date
* expression = "Encounter.period.end"
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #ge
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap