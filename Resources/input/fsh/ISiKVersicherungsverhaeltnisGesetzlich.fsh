Profile: ISiKVersicherungsverhaeltnisGesetzlich
Parent: http://fhir.de/StructureDefinition/coverage-de-basis
Id: ISiKVersicherungsverhaeltnisGesetzlich
Description: "Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien.  
### Motivation
ISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden.
In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.  
In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKVersicherungsverhaeltnisGesetzlich basiert auf dem [GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). 
Instanzen, die gegen ISiKVersicherungsverhaeltnisGesetzlich valide sind, sind auch valide gegen

* [GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis)

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
* insert Meta
* status MS
  * ^short = "Status"
  * ^comment = "Zeigt den aktuellen Status der Ressource an.     
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch den Wert `active`.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."
* type MS
  * ^short = "Versicherungsart"
  * ^comment = "
  Die Angabe der Versicherungsart `GKV` dient der Kennzeichnung dieser Coverage-Ressource als gesetzliches Versicherungsverhältnis.  
  **Begründung Pflichtfeld:** Die Angabe der Versicherungsart dient der Unterscheidung, wenn zu einem Patienten mehrere Coverage-Ressourcen hinterlegt sind, 
  z.B. gesetzliche Versicherung + Selbszahlerverhältnis und als Suchkriterium, um gezielt nach der in einem konkreten Kontext relevanten Coverage suchen zu können.  
  **Historie:**  
  28.07.2017 (zulip): TC Konsens bzgl. Verwendung eines eigenen ValueSets anstelle des im Standard definierten preferred bindings, da die dortigen Codes nicht passen."
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains VersicherungsArtDeBasis 1..1 MS
  * coding[VersicherungsArtDeBasis] = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV
    * ^short = "Codierte Darstellung der Versicherungsart"
    * system 1.. MS
      * ^short = "Codier-Schema"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/CodeSystem/versicherungsart-de-basis` anzugeben." 
    * code 1.. MS
      * ^short = "Code"
      * ^comment = "Hier ist stets der Code `GKV` anzugeben."
* subscriber MS
  * ^short = "Hauptversicherte Person"
  * ^comment = "Die hauptversicherte Person kann der Patient selbst sein, oder (z.B. im Falle einer Familienversicherung) auch ein Angehöriger (`RelatedPerson`)
  **Begründung MS: Die Information über die hauptversicherte Person ist insbesondere im Kontext der Korrespondenz von Bedeutung, 
  da z.B. bei familienversicherten Kindern i.d.R. über die hauptversicherte Person korrespondiert wird.  

  **Hinweis:** Die Angabe der VersichertenID des Hauptversicherten in `subscriber.identifier` ist verpflichtend. 
  Weitere Angaben zum Versicherten (Name, Adresse) können in einer `RelatedPerson`-Resource hinterlegt werden, auf die hier referenziert wird."
  * reference 1.. MS
    * ^comment = "Die Verlinkung auf eine Patienten- oder RelatedPerson-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten/Angehörigen 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
 /*  * identifier 1.. MS // Das MS Flag dient der Übernahme von 'identifier' aus der Patienten-Instanz.
  * identifier only IdentifierKvid10
    * ^short = "Lebenslange Krankenversichertennummer der Hauptversicherten"
    * ^comment = "Die als 'KVZ10' kodierte Versichertennummer ist der 10-stellige, 
      unveränderbare Teil der Versichertennummer, 
      der lesbar auf die Elektronische Gesundheitskarte aufgedruckt ist.
      Er gilt für alle Krankenversichertennummern, 
      unabhängig davon, ob es sich um GKV, PKV oder Sonderkostenträger handelt.  
      **Weitere Hinweise:** siehe [Deutschen Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-LebenslangeKrankenversichertennummer10-stelligeKVID-Identifier?version=current)"
    * system MS
      * ^short = "Namensraum der Versichertennummer"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/sid/gkv/kvid-10` anzugeben.  
      **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
    * value MS 
      * ^short = "Lebenslange Krankenversichertennummer"
      * ^comment = "Der 10-stellige, unveränderbare Teil der Versichertennummer."  
  * display MS
    * ^short = "Name des Hauptversicherten"
    * ^comment = "**Begründung MS:** Da das die Versichertennummer nicht zur Darstellung für den Anwender geeignet ist, 
    sollte ergänzend der Name des Versicherten angegeben werden."
 */
* beneficiary MS
  * ^short = "Versicherte Person"
  * ^comment = "Hier handelt es ich konkret um den Patienten, der unter diesem Versicherungsverhältnis behandelt wird."
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* payor ..1 MS
* payor only Reference(Organization)
  * ^short = "Kostenträger"
  * ^comment = "Die Angabe der IK-Nummer in `payor.dentifier` sowie des Namens der Versicherung in `payor.display` ist zwingend erforderlich.  
  Die Referenz auf eine Resource vom Typ `Organization` in `payor.reference`, die weitere Details zur Versicherung enthalten kann (z.B. Adresse, Kontaktdaten) ist optional.  

  Die Angabe der IK-Nummer des Versicherers in payor.identifier ist verpflichtend. 
  Weitere Angaben zum Versicherer (Name, Adresse) können in einer Organization-Resource hinterlegt werden, auf die hier referenziert wird."
  * identifier only IdentifierIknr
    * ^short = "Institutskennzeichern der Versicherung"
    * ^comment = "**Begründung Pflichtfeld:** Als eindeutiger Identifikator der Versicherung ist in vielen Fällen das Institutskennzeichen ausreichend."
  * identifier 1.. MS
    //* type 1.. MS ...wieso Pflichtfeld!?
    * system 1.. MS
      * ^short = "Namensraum der IK-Nummer"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/sid/arge-ik/iknr` anzugeben.  
      **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
    * value 1.. MS
      * ^short = "IK-Nummer"
      * ^comment = "Das Institutskennzeichen der Versicherung"  
  * display 1.. MS
    * ^short = "Name der Versicherung"
    * ^comment = "**Begründung Pflichtfeld:** Da das Institutskennzeichen nicht zur Darstellung für den Anwender geeignet ist, 
    muss ergänzend der Name der Versicherung angegeben werden."

Instance: CoverageGesetzlich
InstanceOf: ISiKVersicherungsverhaeltnisGesetzlich
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#GKV
* beneficiary = Reference(PatientinMusterfrau)
* payor.identifier.type = $v2-0203#XX
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "260326822"
* payor.display = "Eine Gesundheitskasse"
