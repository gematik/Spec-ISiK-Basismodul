Profile: SD_MII_ICU_Monitoring_Und_Vitaldaten
Parent: Observation
Id: sd-mii-icu-monitoring-und-vitaldaten
Title: "SD MII ICU Monitoring und Vitaldaten"
* insert Meta
* obeys vs-de-2
* identifier MS
* basedOn MS
  * ^short = "maximal Kardinalität bei Übernahme aus MII-Kerndatensatz-ICU entfernt"
* partOf only Reference(Procedure)
* status MS
  * ^comment = "Motivation MS: Observation.status ist bereits durch die Kardinalität der Basisklasse Observation erzwungen. Dieses Feld dient der Präzisierung des Status der Untersuchung"
* category MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* category contains
    vs-cat 1..1 MS and
    loinc-fhir-core 0..1 MS
* category[vs-cat] = $observation-category#vital-signs
  * coding MS
    * system 1.. MS
    * code 1.. MS
* category[loinc-fhir-core] = $loinc#85353-1
  * coding MS
    * system 1.. MS
    * code 1.. MS
* code MS
  * obeys code-coding-icu
  * coding 1..
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      sct 0..* MS and
      loinc 0..* MS and
      IEEE-11073 0..* MS
  * coding[sct] from VS_MII_ICU_Code_Monitoring_und_Vitaldaten_SNOMED (required)
    * system 1.. MS
    * code 1.. MS
  * coding[loinc] from VS_MII_ICU_Code_Monitoring_und_Vitaldaten_LOINC (required)
    * system 1.. MS
    * code 1.. MS
  * coding[IEEE-11073] from VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073 (required)
    * system 1.. MS
    * code 1.. MS
* subject 1.. MS
* subject only Reference(Patient)
* encounter MS
* effective[x] 1.. MS
* effective[x] only dateTime or Period
* value[x] only Quantity
* value[x] MS
  * ^patternQuantity.system = "http://unitsofmeasure.org"
  * value 1.. MS
  * unit MS
  * system 1.. MS
  * code 1.. MS
* dataAbsentReason MS
  * obeys mii-icu-1
* interpretation MS
* bodySite MS
* bodySite from VS_MII_ICU_BodySite_Observation_Monitoring_und_Vitaldaten (extensible)
* device MS
* referenceRange MS
* component MS
  * code MS
  * value[x] only Quantity
  * valueQuantity MS
  * dataAbsentReason MS
  * interpretation MS
  * referenceRange MS
* performer MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"
* method MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"