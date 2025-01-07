RuleSet: Meta
* ^status = #active
* ^experimental = false
* ^version = "4.0.1"
* ^publisher = "gematik GmbH"
* ^date = "2024-12-04"

RuleSet: Meta-CapabilityStatement
* status = #active
* experimental = false
* version = "4.0.1"
* publisher = "gematik GmbH"
* date = "2024-12-04"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Vitalparameter|4.0.1"

RuleSet: supporteProfile-SHALL(canonical, expectation)
* rest.resource[=].supportedProfile[+] = Canonical({canonical})
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #{expectation}

RuleSet: supportedLaborProfile
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungSerumkreatinin
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungPCT
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungCRP
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungHb
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $iSiKLaboruntersuchungTroponin
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $ISiKLaboruntersuchungGFR
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $ISiKLaboruntersuchungThrombozyten
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = $ISiKLaboruntersuchungTSH
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = #SHALL

RuleSet: ISiKVitalsignCommons
* insert Meta
* status MS
  * ^comment = "**WICHTIGER Hinweis für Implementierer:**  
* Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch `final`.
* Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."
  * ^short = "Untersuchungsstatus"
* category MS
  * ^comment = "Motivation MS: Dieses Feld erlaubt die Sortierung und Abfrage anhand der Kategorie der Untersuchung"
  * ^short = "Untersuchungskategorie"
* code MS
  * ^comment = "Motivation MS: Die Observation wird anhand des Codes identifiziert."
  * ^short = "Code"
  * coding MS
    * ^comment = "Motivation MS: Semantische Kodierung"
    * ^short = "Coding"
  * coding[loinc] MS
    * ^short = "LOINC Kodierung"
    * ^comment = "Motivation MS: Kodierung des Vitalparameters mittels LOINC."
  * coding[snomed] MS
    * ^short = "SNOMED CT Kodierung"
    * ^comment = "Motivation MS: Kodierung des Vitalparameters mittels SNOMED CT."
* subject MS
  * ^comment = "Motivation MS: Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
  * ^short = "Patient"
* encounter MS
  * ^comment = "Motivation MS: Der Behandlungskontext ist für die Interpretation der Untersuchungsergebnisse relevant"
  * ^short = "Aufenthaltsbezug"
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * ^comment = """**Begründung Pflichtfeld:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.  
**WICHTIGER Hinweis für Implementierer:** Die Zuordnung MUSS auf auf einen Encounter der Ebene "Abteilungskontakt" (siehe hierzu Basismodul > UseCases > Abbildung des Konstruktes "Fall") erfolgen.  
Bei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)"Fallnummer" (hier: `Encounter.account`) unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten.)"""
* effective[x] MS
  * ^comment = "Motivation MS: Das Datum und die Uhrzeit der Untersuchung sind für die Interpretation der Untersuchungsergebnisse relevant"
  * ^short = "Datum und Uhrzeit der Untersuchung"
* performer MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"
  * ^short = "Untersuchender"
* method MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"
  * ^short = "Untersuchungsmethode"
* device MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"
  * ^short = "Gerät"
* dataAbsentReason MS
  * ^comment = "Motivation MS: Dieses Feld erlaubt die Angabe von Gründen für fehlende Untersuchungsergebnisse"
  * ^short = "Grund für fehlende Untersuchungsergebnisse"
* value[x] MS
  * ^comment = "Motivation MS: Der Wert des Vitalparameters ist das zentrale Ergebnis der Untersuchung"
  * ^short = "Untersuchungsergebnis"

RuleSet: Quantity-MS
* valueQuantity MS
  * ^comment = "Motivation MS: valueQuantity muss für VitalSigns unterstützt werden"
  * ^short = "quantitatives Untersuchungsergebnis"
* valueQuantity.value MS
  * ^comment = "Motivation MS: Eine Quantity soll einen Wert enthalten"
  * ^short = "Wert"
* valueQuantity.unit MS
  * ^comment = "Motivation MS: Eine Quantity soll eine Einheit enthalten"
  * ^short = "Einheit"
* valueQuantity.system MS
  * ^comment = "Motivation MS: Eine Quantity soll ein System mit dem die Einheit kodiert wird enthalten"
  * ^short = "CodeSystem aus dem die Einheit stammt"
* valueQuantity.code MS
  * ^comment = "Motivation MS: Eine Quantity soll einen Code der die Einheit kodiert enthalten"
  * ^short = "Code der Einheit"

RuleSet: CodeableConcept-MS
* coding MS
  * ^comment = "Motivation MS: Semantische Kodierung."
  * ^short = "Coding"
  * code MS
    * ^comment = "Motivation MS: Kodierter Wert aus einem CodeSystem."
    * ^short = "Code"
  * system MS
    * ^comment = "Motivation MS: URL des CodeSystems des kodierten Wertes."
    * ^short = "System"

RuleSet: Component-MS
* ^comment = "Motivation MS: Erfassung der Komponenten eines Vitalparameters" 
* ^short = "Vitalparameter-Komponente"
* insert Component-Slice-MS

RuleSet: Component-Slice-MS
* code MS
  * ^comment = "Motivation MS: Die Komponente wird anhand des Codes identifiziert."
  * ^short = "Code"
  * coding MS
    * ^comment = "Motivation MS: Semantische Kodierung"
    * ^short = "Coding" 
* value[x] MS
  * ^comment = "Motivation MS: Der Wert der Komponente ist ein Ergebnis der Untersuchung"
  * ^short = "Wert der Komponente"

RuleSet: Observation-category-VSCat-MS
* category[VSCat] MS
  * ^comment = "Motivation MS: Die Kategorie 'vital-signs' dient der Kategorisierung von Vitalparametern"
  * ^short = "Vitalparameterkategorie"