Profile: ISiKAllergieUnvertraeglichkeit
Parent: AllergyIntolerance
Id: ISiKAllergieUnvertraeglichkeit
Description: "
Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.
### Motivation

Die Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit.
Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).

In FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.

### Kompatibilität

Für das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:
* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta

/* 
hier sollte genauer spezifiziert werden, welche Statuswerte  für clincial- und verificationStatus implementiert werden müssen, z.B. durch Hinzufügen folgenden Kommentars:    
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch <t.b.d>.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.

Alternativ: hier einen Sermon analog zu Condition.clincalStatus einfügen.
Bitte auch beachten, dass verificationStatus bei Condition derzeit KEIN MS-Flag hat!
*/
* clinicalStatus MS
  * ^short = "klinischer Status"
  * coding 1..1 MS
    * system 1..1 MS
    * code 1..1 MS
* verificationStatus MS
  * ^short = "Verifikationsstatus"
  * coding 1..1 MS
    * system 1..1 MS
    * code 1..1 MS
* type MS
  * ^short = "Type (Allergie oder Unverträglichkeit)"
* category MS
  * ^short = "Kategorie"
* criticality MS
  * ^short = "Kritikalität"
* code 1.. MS
  * ^short = "Benennung der Allergie/Unverträglichkeit"
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains
      snomed-ct 1..1 MS and
      ask 0..1 MS and
      atc 0..1 MS
  * coding[snomed-ct] MS
  * coding[snomed-ct] only ISiKSnomedCTCoding
  * coding[ask] MS
  * coding[ask] only CodingASK
    * system MS
    * code MS
    * display MS
  * coding[atc] MS
  * coding[atc] only CodingATC
    * system MS
    * version MS
    * code MS
    * display MS
  * text MS
* patient MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation 
    zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * ^comment = "Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."

* onset[x] MS
  * ^short = "Beginn-Zeitpunkt"
* onsetDateTime MS
* onsetAge MS
* onsetString MS
* recordedDate MS
  * ^short = "Datum an dem die Allergie/Unverträglichkeit aufgezeichnet wurde"
* recorder MS
  * ^short = "Person/Rolle, die die Information dokumentiert"
  * reference MS
  * display MS
* asserter MS
  * ^short = "Person/Rolle, die die Allergie/Unverträglichkeit festgestellt hat"
  * reference MS
  * display MS
* note MS
  * author[x] MS
  * author[x] only Reference
  * authorReference MS
    * reference MS
    * display MS
  * time MS
  * text MS
* reaction MS
  * ^short = "Unerwünschte Reaktion"
  * manifestation MS
    * ^short = "Manifestation der Reaktion"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "system"
      * ^slicing.rules = #open
    * coding contains
        snomed-ct 0..1 MS
    * coding[snomed-ct] MS
    * coding[snomed-ct] only ISiKSnomedCTCoding
    * text MS
  * severity MS
    * ^short = "Schweregrad der Reaktion"
  * exposureRoute MS
    * ^short = "Expositionsweg"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "system"
      * ^slicing.rules = #open
    * coding contains
        snomed-ct 0..1 MS
    * coding[snomed-ct] MS
    * coding[snomed-ct] only ISiKSnomedCTCoding
    * text MS

Instance: ISiKAllergieUnvertraeglichkeitBeispiel1
InstanceOf: ISiKAllergieUnvertraeglichkeit
Usage: #example
* clinicalStatus = $vsAllergyIntoleranceClinicalStatus#active
* verificationStatus = $vsAllergyIntoleranceVerificationStatus#confirmed
* type = #allergy
* category = #environment
* criticality = #low
* code = $sct#256262001 "Betula pendula pollen"
* patient = Reference(PatientinMusterfrau)
* onsetDateTime = "1987"
* recordedDate = 2011-05-12
* recorder.display = "Dr. Martin Mustermann"
* asserter.display = "Dr. Berta Beispiel"
* note
  * authorReference = Reference(PractitionerWalterArzt)
  * time = 2024-02-20T14:34:12+01:00
  * text = "Patientin berichtet von einer leichten Verschlimmerung in den letzten 3 Jahren."
* reaction
  * manifestation = $sct#162367006 "Sneezing symptom"
  * severity = #moderate
  * exposureRoute = $sct#14910006 "Inspiration"
