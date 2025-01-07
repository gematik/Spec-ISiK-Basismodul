
Profile: ISiKPatient
Parent: Patient
Id: ISiKPatient
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik.
### Motivation  
Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung.  
In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource 'Patient' in einen Patientenkontext gestellt.  
Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, 
die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.  

### Kompatibilität
Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:

* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)  

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* obeys isik-pat-1
* . ^constraint[5].source = Canonical(ISiKPatient)
* identifier MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    VersichertenId 0..1 MS and
    VersichertenId-GKV 0..1 MS and
    Patientennummer 1..* MS and
    Versichertennummer_PKV 0..1
* identifier[VersichertenId] only IdentifierKvid10
  * ^patternIdentifier.type = $identifier-type-de-basis#KVZ10
  * ^short = "Lebenslange Krankenversichertennummer"
  * ^comment = "Die als 'KVZ10' kodierte Versichertennummer ist der 10-stellige, 
    unveränderbare Teil der Versichertennummer, 
    der lesbar auf die Elektronische Gesundheitskarte aufgedruckt ist.
    Er gilt für alle Krankenversichertennummern, 
    unabhängig davon, ob es sich um GKV, PKV oder Sonderkostenträger handelt.  
    **Weitere Hinweise:** siehe [Deutschen Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-LebenslangeKrankenversichertennummer10-stelligeKVID-Identifier?version=current)"
  * type 1.. MS
    * ^short = "Art des Identifiers"
    * ^comment = "Hier ist stets der Code `KVZ10` 
    aus dem CodeSystem `http://fhir.de/CodeSystem/identifier-type-de-basis` anzugeben.  
    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen"  
  * system MS
    * ^short = "Namensraum der Versichertennummer"
    * ^comment = "Hier ist stets der Wert `http://fhir.de/sid/gkv/kvid-10` anzugeben.  
    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
  * value MS 
    * ^short = "Lebenslange Krankenversichertennummer"
    * ^comment = "Der 10-stellige, unveränderbare Teil der Versichertennummer."  
* identifier[VersichertenId-GKV] only IdentifierKvid10
  * ^patternIdentifier.type = $identifier-type-de-basis#GKV
  * ^short = "Gesetzliche Krankenversichertennummer"
  * ^comment = "**WARNUNG**: Die Verwendung der 'GKV'-Kodierung einer Versichertennummer ist abgekündigt,
  da die lebenslangen Versichertennummer ab 2024 auch für PKV oder Sonderkostenträger eingeführt wird. 
  Bitte statt dessen künftig den 'VersichertenId'-Slice verwenden."
  * type 1.. MS
    * ^short = "Art des Identifiers"
    * ^comment = "Hier ist stets der Code `GKV` 
    aus dem CodeSystem `http://fhir.de/CodeSystem/identifier-type-de-basis` anzugeben.  
    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen"
  * system MS
    * ^short = "Namensraum der Versichertennummer"
    * ^comment = "Hier ist stets der Wert `http://fhir.de/sid/gkv/kvid-10` anzugeben.  
    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
  * value MS
    * ^comment = "Enthält den eigentlichen Wert des Identifiers.  
    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden."
* identifier[Patientennummer] only IdentifierPid
  * ^patternIdentifier.type = $v2-0203#MR
  * ^short = "Organisationsinterner Patienten-Identifier (PID)"
  * ^comment = "Organisationsintere Patienten-Identifier werden von z.B. von KIS-Systemen vergeben 
  und dienen innerhalb einer Einreichtung meist als primäres Identifikationsmerkmal für Patienten, 
  u.A. in der HL7 V2-Kommunikation.  
  **Weitere Hinweise:** siehe [Deutschen Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-OrganisationsinternerPatienten-Identifier?version=current)"
  * type MS
    * ^short = "Art des Identifiers"
    * ^comment = "Hier ist stets der Code `MR` 
    aus dem CodeSystem `http://terminology.hl7.org/CodeSystem/v2-0203` anzugeben.  
    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen"
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

* identifier[Versichertennummer_PKV] only IdentifierPkv
  * ^patternIdentifier.type = $identifier-type-de-basis#PKV
  * ^mustSupport = false
  * ^short = "Private Krankenversichertennummer"
  * ^comment = "Für Privatpatienten, die noch nicht über eine lebenslange, unveränderliche Krankenversichertennummer (KVNR) verfügen,
  können bis auf weiteres noch die versicherungsspezifischen PKV-Nummern angegeben werden. 
  Da bei diesen der Bezeichner des vom Kostenträger verwendeten Namensraums mest nicht ermittelt werden kann,
  ist statt dessen der Name des Kostenträgers in `assigner` anzugeben.  
  **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-PrivateKrankenversichertennummer-Identifier?version=current)"
  * use MS
    * ^short = "Verwendungszeck des Identifiers"
    * ^comment = "Hier ist stets der Wert `secondary` anzugeben."
  * type 1.. MS
    * ^short = "Art des Identifiers"
    * ^comment = "Hier ist stets der Code `PKV` 
    aus dem CodeSystem `http://fhir.de/CodeSystem/identifier-type-de-basis` anzugeben.  
    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen"
  * value MS
    * ^short = "Private Krankenversichertennummer"
    * ^comment = "Enthält den eigentlichen Wert des Identifiers.  
    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden."  
  * assigner MS
    * identifier.system MS
      * ^short = "Namensraum des Identifiers"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/sid/arge-ik/iknr` anzugeben."
    * identifier.value MS
      * ^short = "IK-Nummer des Kostenträgers"
      * ^comment = "IK-Nummer des Kostenträgers, aus dessen Nummernkreis die PKV-Nummer stammt."
    * display MS
      * ^short = "Name des Kostenträgers"
      * ^comment = "Name des Kostenträgers, aus dessen Nummernkreis die PKV-Nummer stammt."
* active MS
  * ^short = "Status des Datensatzes"
  * ^comment = "
  `true` = Der Datensatz befindet sich in Verwendung/kann verwendet werden  
  `false`= Der Datensatz wurde storniert (z.B. bei Dubletten, Merge) oder archiviert  
  **Einschränkung der übergreifenden MS-Definition:**  
  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Aktivitätsstatus einer Patienten-Ressource, 
  so MUSS dieses System die Information NICHT abbilden. 
  Das System SOLL jedoch den Aktivitätsstatus hart kodieren in der Patienteninstanz 
  (Patient.active auf 'true'), sodass Clients nicht missverständlich mit einer inaktiven 
  Patient-Ressource interagieren."
* name MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  //* ^comment = "In order to maintain the differentiations of name parts as given in the VSDM dataset or qualify prefixes as academic titles, vendors can opt to support the extensions specified in the German HumanName Base Profile https://simplifier.net/basisprofil-de-r4/humannamedebasis\r\nThis is however not required within the scope of this specification."
* name contains
    Name 1..1 MS and
    Geburtsname 0..1 MS
* name[Name] only HumannameDeBasis
  * ^patternHumanName.use = #official
  * ^short = "Offizieller Name"
  * ^comment = "Offizieller Name des Patienten, wie er z.B. in Ausweis oder Versicherungsdokumenten erscheint. 
  **Begründung Pflichtfeld:** Der offizielle Name des Patienten ist unerlässlich, um Verwechlungen zu vermeiden und den Patienten im Versorgungskontext korrekt anzusprechen.
  Wenn kein Name vorliegt, MUSS die [data-absent-reason-Extension](https://www.hl7.org/fhir/R4/extension-data-absent-reason.html) eingesetzt werden.   
  **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Name)"
  * use 1.. MS
    * ^short = "Verwendungszweck"
    * ^comment = "Hier ist stets der Wert `official` anzugeben.  
      **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium"  
  * family 1.. MS
    * ^short = "Nachname"
    * ^comment = "Vollständiger Nachname bzw. Familienname der Person, einschließlich Vor- und Zusätze.  
      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind."   
    * extension[namenszusatz] 0..1 MS
      * ^short = "Namenszusatz"
      * ^comment = "Enthält ehem. Adelstitel wie z.B. 'Graf', 'Baronesse', 'Freiherr'...  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
    * extension[nachname] 0..1 MS
      * ^short = "Nachname"
      * ^comment = "Nachname ohne Vor- und Zusätze.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."   
    * extension[vorsatzwort] 0..1 MS
      * ^short = "Vorsatzwort "
      * ^comment = "Enthält Vorsätze, die vor dem Nachnamen stehen, z.B. 'von', 'van', 'zu'...  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."    
  * given 1.. MS
    * ^short = "Vorname "
    * ^comment = "Kann mehrfach verwendet werden, um den Rufnamen sowie weitere Vornamen, Mittelnamen oder Mittel-Initialen abzubilden.
      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind."   
  * prefix MS
    * ^short = "Präfix"
    * ^comment = "Präfix, z.B. akademischer Titel od. militärischer Rang"   
    * extension[prefix-qualifier] 0..1 MS
      * ^short = "Extension, um das Präfix als akademischen Titel zu qualifizieren"
      * ^comment = "Hier ist stets der Wert `AC` anzugeben.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."    
    * extension[prefix-qualifier].value[x] = #AC (exactly)
* name[Geburtsname] only HumannameDeBasis
  * ^patternHumanName.use = #maiden
  * ^short = "Geburtsname"
  * ^comment = "Familienname zum Zeitpunkt der Geburt, sofern abweichend vom offiziellen Namen."
  * use 1.. MS
    * ^short = "Verwendungszweck"
    * ^comment = "Hier ist stets der Wert `maiden` anzugeben.  
      **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium"  
  * family 1.. MS
    * ^short = "Nachname"
    * ^comment = "Vollständiger Nachname bzw. Familienname des Patienten, einschließlich Vor- und Zusätze.  
      **Begründung Pflichtfeld:** Ist der Nachname zum Zeitpunkt der Geburt nicht bekannt, sollte der gesamte Slice weggelassen werden."
    * extension[namenszusatz] 0..1 MS
      * ^short = "Namenszusatz"
      * ^comment = "Enthält ehem. Adelstitel wie z.B. 'Graf', 'Baronesse', 'Freiherr'...  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
    * extension[nachname] 0..1 MS
      * ^short = "Nachname"
      * ^comment = "Nachname ohne Vor- und Zusätze.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."   
    * extension[vorsatzwort] 0..1 MS
      * ^short = "Vorsatzwort "
      * ^comment = "Enthält Vorsätze, die vor dem Nachnamen stehen, z.B. 'von', 'van', 'zu'...  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."   
  * given ..0
  * prefix ..0
* telecom.system 1..
* telecom.value 1..
* gender 1.. MS
  * ^short = "Administratives Geschlecht " 
  * ^comment = "Für die Geschlechtskennzeichen 'unbestimmt' und 'divers' ist der international vereinbarte code `other` zu verwenden.
    Zur weiteren Differenzierung kann dann die Extension `Geschlecht-Admnistrativ` verwendet werden.
    **Begründung Pflichtfeld:** Die Geschlechtsangabe ist für viele Versorgungsprozesse unerlässlich, z.B.  
* Bettendisposition
* Ermittlung von Referenzwerten
* korrekte Anrede des Patienten  
    **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Geschlecht)"
  * extension contains GenderOtherDE named Geschlecht-Administrativ 0..1 MS
  * extension[Geschlecht-Administrativ]
    * ^short = "Extension zur Differenzierung des Geschlechtskennzeichens "
    * ^comment = "Diese Extension darf nur in Verbindung mit dem Geschlechtskennzeichen `other` verwendet werden
      und dient der Differenzierung zwischen den in Deutschland möglichen Geschlechtskennzeichen `D` (divers) und `X`(unbestimmt)"
* birthDate 1.. MS
  * extension contains $data-absent-reason named Data-Absent-Reason 0..1 MS
  * extension[Data-Absent-Reason]
    * ^short = "Begründung für fehlende Information"
    * ^comment = "ToDo"
    * value[x] = #unknown (exactly)
    * value[x] MS
  * ^short = "Geburtsdatum "
  * ^comment = "Tages-, monats- oder jahresgenaues Geburtsdatum.  
    **Begründung Pflichtfeld:** Das Geburstdatum dient - in Verbindung mit dem Namen - als wichtiges Such- und Unterscheidungskriterium.  
    **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Geburtsdatum)"
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  //* ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * ^short = "Postfachadresse"
  * ^comment = "Adresse, die nur für postalische Zustellung genutzt werden kann."
  * obeys address-cnt-2or3-char
  * ^patternAddress.type = #postal
  * type 1.. MS
    * ^short = "Adresstyp"
    * ^comment = "Hier ist stets der Wert `postal` anzugeben.  
    **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium"  
  * line 1.. MS
    * ^short = "Adresszeile"
    * ^comment = "Diese Komponente enthält die Postfachadresse als String der Form 'Postfach: 12345'.
    Bei Verwendung der Postfach-Extension, um die Postfachnummer strukturiert zu übermitteln, 
    müssen diese Informationen stets vollständig auch in der line-Komponente, 
    die sie erweitern, enthalten sein, um es Systemen, die diese Extensions nicht verwenden zu ermöglichen, 
    auf diese Informationen zugreifen zu können.  
    **Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.  
    **Begründung für Reduktion der max. Kardinalität:** Die maximale Kardinalität wurde in Übereinstimmung mit der 
    DIN-Norm 5008 (Schreib- und Gestaltungsregeln für die Text- und Informationsverarbeitung) auf 3 beschränkt."
    * extension[Strasse] 0..0 
    * extension[Hausnummer] 0..0 
    * extension[Adresszusatz] 0..0 
    * extension[Postfach] 0..1 MS
      * ^short = "Postfachnummer"
      * ^comment = "Postfach-Adresse. Bei Angabe eines Postfaches in dieser Extension muss das Postfach auch in Address.line angegeben werden,
        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden. 
        Eine Postfach-Adresse darf nicht in Verbindung mit Address.type `physical` oder `both` verwendet werden.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
  * city 1.. MS
    * ^short = "Stadt"
    * ^comment = "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar."
  * postalCode 1.. MS
    * ^short = "Postleitzahl "
    * ^comment = "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar."
  * country 1.. MS
    * ^short = "Land"
    * ^comment = "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar."
* address[Strassenanschrift] only AddressDeBasis
  * ^short = "Straßenanschrift"
  * ^comment = "Wohn- oder Aufenthaltsort des Patienten"
  * obeys address-cnt-2or3-char
  * extension[Stadtteil] MS
  * ^patternAddress.type = #both
  * type 1.. MS
    * ^short = "Adresstyp"
    * ^comment = "Hier ist stets der Wert `both` anzugeben.  
    **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium"  
  * line 1.. MS
    * ^short = "Adresszeile"
    * ^comment = "Diese Komponente kann Straßennamen, Hausnummer, Appartmentnummer, c/o 
    sowie weitere Zustellungshinweise enthalten. 
    Die Informationen können in mehrere line-Komponenten aufgeteilt werden. 
    Bei Verwendung der Extensions, um Straße, Hausnnummer und Postleitzahl strukturiert zu übermitteln, 
    müssen diese Informationen stets vollständig auch in der line-Komponente, 
    die sie erweitern, enthalten sein, um es Systemen, die diese Extensions nicht verwenden zu ermöglichen, 
    auf diese Informationen zugreifen zu können.  
    **Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.  
    **Begründung für Reduktion der max. Kardinalität:** Die maximale Kardinalität wurde in Übereinstimmung mit der 
    DIN-Norm 5008 (Schreib- und Gestaltungsregeln für die Text- und Informationsverarbeitung) auf 3 beschränkt."
    * extension[Strasse] 0..1 MS
      * ^short = "Strassenname "
      * ^comment = "Strassenname (ohne Hausnummer).
        Bei Angabe einer Strasse in dieser Extension muss diese auch in Address.line angegeben werden,
        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
    * extension[Hausnummer] 0..1 MS
      * ^short = "Hausnummer "
      * ^comment = "Hausnummer, sowie Zusätze (Appartmentnummer, Etage...). 
        Bei Angabe einer Hausnummer in dieser Extension muss diese auch in Address.line angegeben werden,
        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.   
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
    * extension[Adresszusatz] 0..1 MS
      * ^short = "Adresszusatz "
      * ^comment = "Zusätzliche Informationen, wie z.B. '3. Etage', 'Appartment C'.
        Bei Angabe einer Zusatzinformation in dieser Extension muss diese auch in Address.line angegeben werden,
        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
    * extension[Postfach] 0..0
      * ^short = "Postfachnummer"
      * ^comment = "Postfach-Adresse. Bei Angabe eines Postfaches in dieser Extension muss das Postfach auch in Address.line angegeben werden,
        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden. 
        Eine Postfach-Adresse darf nicht in Verbindung mit Address.type `physical` oder `both` verwendet werden.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
  * city 1.. MS
    * ^short = "Stadt"
    * ^comment = "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar."
  * postalCode 1.. MS
    * ^short = "Postleitzahl "
    * ^comment = "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar."
  * country 1.. MS
    * ^short = "Land"
    * ^comment = "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar."
* link MS
  * ^short = "Link"
  * ^comment = "Dieses und untergeordnete Elemente KÖNNEN bei einem erfolgten Patient merge entsprechend der Festlegungen unter {{pagelink:Patient-merge}} befüllt werden. 
  Da das Element der Unterstützung der Patient merge Notification dient, 
  MUSS es im Rahmen des Bestätigungsverfahrens NICHT unterstützt werden (Stand: Stufe 4)."
  * other MS
    * identifier MS
      * ^comment = "Logischer Verweis auf Identifier[Patientennummer]"
  * type MS

Instance: PatientinMusterfrau
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].type = $identifier-type-de-basis#KVZ10
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A123456789"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "TestPID"
* identifier[Versichertennummer_PKV].use = #secondary
* identifier[Versichertennummer_PKV].type = $identifier-type-de-basis#PKV
* identifier[Versichertennummer_PKV].value = "1234567890"
* identifier[Versichertennummer_PKV].assigner.display = "Test PKV AG"
* active = true
* name[Name]
  * family = "Fürstin von Musterfrau"
    * extension[0].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
    * extension[=].valueString = "Fürstin"
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    * extension[=].valueString = "Musterfrau"
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
    * extension[=].valueString = "von"
  * given = "Erika"
  * prefix = "Dr."
    * extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
    * extension.valueCode = #AC
* name[Geburtsname]
  * family = "Gabler"
    * extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    * extension.valueString = "Gabler"
* gender = #female
* birthDate = "1964-08-12"
* address[0].type = #both
* address[=].line[0] = "Musterweg 2"
* address[=].line[+] = "3. Etage"
* address[=].line[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[=].line[=].extension[=].valueString = "Musterweg"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[=].line[=].extension[=].valueString = "2"
* address[=].line[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[=].line[=].extension.valueString = "3. Etage"
* address[=].city = "Musterhausen"
* address[=].postalCode = "98764"
* address[=].country = "DE"
* address[+].type = #postal
* address[=].line = "Postfach 8 15"
  * extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
  * extension.valueString = "Postfach 8 15"
* address[=].city = "Musterhausen"
* address[=].postalCode = "98764"
* address[=].country = "DE"


Invariant: isik-pat-1
Description: "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden"
Severity: #error
Expression: "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()"

Invariant: address-cnt-2or3-char
Description: "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2."
Severity: #warning
Expression: "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))"

