Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: http://fhir.de/StructureDefinition/coverage-de-sel
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien.  
### Motivation
ISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden.
In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.  
In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.

### Kompatibilität
Das Profil ISiKVersicherungsverhaeltnisSelbstzahler basiert auf dem [Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel). 
Instanzen, die gegen ISiKVersicherungsverhaeltnisSelbstzahler valide sind, sind auch valide gegen

* [Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel)

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
  Die Angabe der Versicherungsart `SEL` dient der Kennzeichnung dieser Coverage-Ressource als Selbszahler-Verhältnis.  
  **Begründung Pflichtfeld:** Die Angabe der Versicherungsart dient der Unterscheidung, wenn zu einem Patienten mehrere Coverage-Ressourcen hinterlegt sind, 
  z.B. gesetzliche Versicherung + Selbszahlerverhältnis und als Suchkriterium, um gezielt nach der in einem konkreten Kontext relevanten Coverage suchen zu können.  
  **Historie:**  
  28.07.2017 (zulip): TC Konsens bzgl. Verwendung eines eigenen ValueSets anstelle des im Standard definierten preferred bindings, da die dortigen Codes nicht passen."
  * coding[VersicherungsArtDeBasis] 
    * ^short = "Codierte Darstellung der Versicherungsart"
    * system 1.. MS
      * ^short = "Codier-Schema"
      * ^comment = "Hier ist stets der Wert `http://fhir.de/CodeSystem/versicherungsart-de-basis` anzugeben." 
    * code 1.. MS
      * ^short = "Code"
      * ^comment = "Hier ist stets der Code `SEL` anzugeben."
/* * subscriber MS
  * display 1.. MS
  * reference MS
    * ^comment = "Motivation für MS: Da ein ISIK-Profil besteht, sollte dies ggf. referenziert werden." */
* beneficiary only Reference(Patient)
* beneficiary MS
  * reference 1.. MS

* beneficiary MS
  * ^short = "Begünstigte Person"
  * ^comment = "Hier handelt es ich konkret um den Patienten, für den die Kostenübernahme gilt."
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."  

* payor only Reference(Patient or RelatedPerson or Organization)
* payor MS
  * ^short = "Kostenträger"
  * ^comment = "Der Kostenträger in einem Selbstzahlerverhältnis kann der Patient selbst sein, ein Angehöriger (z.B. Elter) oder eine Organisation (z.B. Botschaft/Amt).
  **Hinweis:** In der Regel sind `payor`und `subscriber` bei Selbstzahlerverhältnissen identisch (die Person , die die Kostenübernahme unterschreibt/zusichert, übernimmt auch die Kosten).
  Es kann jedoch Ausnahmen geben, z.B. der Kostenträger ist eine Organisation, die Kostenübernahme wird jedoch durch eine Person (Vertreter der Organisation) unterzeichnet."
  * reference MS
    * ^short = "Personen-Link"
    * ^comment = "Ist der Kostenträger eine Person (entweder der Patient selbst oder ein Angehöriger), dann MUSS ein Link auf `Patient`, bzw. `RelatedPerson` angegeben werden.  
    Ist der Kostenträger eine Organisation, dann KANN ein Link auf `Organization` angegeben werden.  
    Die Verlinkung dient der technischen Zuordnung der Dokumentation zu einer Person 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."  
  * display MS
    * ^short = "Organisations-Bezeichnung"
    * ^comment = "Ist der Kostenträger eine Organisation und wurde kein Link auf eine `Organization`-Ressource angegeben,
     dann MUSS die Bezeichnung der Organisation angegeben werden."  
  


Instance: CoveragePrivat
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(PatientinMusterfrau)
* payor = Reference(PatientinMusterfrau)