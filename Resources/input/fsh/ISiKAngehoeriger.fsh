Profile: ISiKAngehoeriger
Parent: RelatedPerson
Id: ISiKAngehoeriger
Description: "Dieses Profil ermöglicht die Darstellung von Angehörigen in ISiK Szenarien.  
### Motivation
Der Angehörige wird vor allem im Zusammenhang mit Anwendungsszenarien verwendet,
 in denen das Versicherungsverhältnis eine Rolle spielt. 
 Hier können Angehörige, bspw. der hauptversicherte Elternteil 
 eines minderjährigen Kindes, in der Familienversicherung sein. 
 In Selbstzahler-Szenarien können Angehörige die Zahler für eine 
 im Krankenhaus erbrachte Leistung sein.
In FHIR werden Angehörige von Patienten mit der RelatedPerson-Ressource repräsentiert.

### Kompatibilität
Für das Profil ISiKAngehoeriger wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* obeys relatedp-de-1
* patient 1..1 MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Information zu einem Patienten 
  und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* relationship MS
  * ^short = "Verwandtschaftsverhältnis"
  * ^comment = "**Begründung MS:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)"
* telecom MS
  * ^short = "Telekommunikationsverbindung"
  * ^comment = "Telekommunikationsverbindung (z.B. Telefonnummer, eMail-Adresse)  
  **Begründung MS:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)"
  * system 1.. MS
    * ^short = "Art der Telekommunikationsverbindung"
    * ^comment = "**Begründung Pflichtfeld:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)"
  * value 1.. MS
    * ^short = "Telekommunikations-Endpunkt"
    * ^comment = "**Begründung Pflichtfeld:** Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)"


* name MS
* name only HumannameDeBasis
  * ^short = "Offizieller Name der angehörigen Person"
  * ^comment = "Aufgrund der primären Nutzung von Angehörigen-Informationen im ISiK-Kontext als Brief- und Rechnungsempfänger, 
  ist die Angabe des offiziellen Namens relevant.
  Wenn kein Name vorliegt, MUSS die [data-absent-reason-Extension](https://www.hl7.org/fhir/R4/extension-data-absent-reason.html) eingesetzt werden.   
  **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Name)"
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* name contains
    Name 1..1 MS 
* name[Name]    
  * use MS
    * ^short = "Verwendungszweck"
    * ^comment = "Verwendungszweck des Namens. Der präferierte Namen für die Brief- und Rechnungszustellung SOLLTE als `official`
    gekennzeichnet werden und mindestens über einen Vor- und Nachnamen verfügen.    
    **Begründung MS:** Dient als Unterscheidungs- und Auswahlkriterium"  
  * family  MS
    * ^short = "Nachname"
    * ^comment = "Vollständiger Nachname bzw. Familienname der Person, einschließlich Vor- und Zusätze.  
      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind."   
  * given  MS
    * ^short = "Vorname "
    * ^comment = "Kann mehrfach verwendet werden, um den Rufnamen sowie weitere Vornamen, Mittelnamen oder Mittel-Initialen abzubilden.
      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind."   
  * prefix MS
    * ^short = "Präfix"
    * ^comment = "Präfix, z.B. akademischer Titel od. militärischer Rang"   
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
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
    * extension[Postfach] 0..1 
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
  * ^comment = "Wohn- oder Aufenthaltsort des Angehörigen"
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
    * extension[Strasse] 0..1 
      * ^short = "Strassenname "
      * ^comment = "Strassenname (ohne Hausnummer).
        Bei Angabe einer Strasse in dieser Extension muss diese auch in Address.line angegeben werden,
        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.  
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
    * extension[Hausnummer] 0..1 
      * ^short = "Hausnummer "
      * ^comment = "Hausnummer, sowie Zusätze (Appartmentnummer, Etage...). 
        Bei Angabe einer Hausnummer in dieser Extension muss diese auch in Address.line angegeben werden,
        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.   
        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten."
    * extension[Adresszusatz] 0..1 
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


Instance: ISiKAngehoerigerMustermann
InstanceOf: ISiKAngehoeriger
Usage: #example
* patient = Reference(PatientinMusterfrau)
* name.family = "Mustermann"
* name.given = "Maxine"
* address.type = #both
* address.line = "Milchstr. 42"
* address.city = "Beispielstadt"
* address.postalCode = "78143"
* address.country = "DE"
* relationship = RoleCode#DAUC

Invariant: relatedp-de-1
Description: "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden"
Severity: #error
Expression: "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()"