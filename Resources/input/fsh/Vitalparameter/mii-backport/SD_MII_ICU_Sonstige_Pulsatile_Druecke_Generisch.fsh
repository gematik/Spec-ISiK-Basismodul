Profile: SD_MII_ICU_Sonstige_Pulsatile_Druecke_Generisch
Parent: Observation
Id: sd-mii-icu-sonstige-pulsatile-druecke-generisch
Title: "SD MII ICU Sonstige pulsatile Druecke Generisch"
* insert Meta
* identifier MS
* basedOn ..1
* status MS
  * ^comment = "Motivation MS: Observation.status ist bereits durch die Kardinalität der Basisklasse Observation erzwungen. Dieses Feld dient der Präzisierung des Status der Untersuchung"
* category MS
* code MS
  * coding MS
    * system 1.. MS
    * code 1.. MS
    * display MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains sct-generic 1..1 MS and sct 1..1 MS
  * coding[sct-generic] = $sct#75367002
* subject MS
* encounter MS
* effective[x] MS
* value[x] ..0 MS
* dataAbsentReason ..0 MS
* interpretation MS
* bodySite MS
* bodySite from VS_MII_ICU_BodySite_Observation_Blutdruck (extensible)
  * ^binding.description = "Codes describing anatomical locations. May include laterality. Subset of ValueSet for Monitoring und Vitaldaten."
* method MS
* method from VS_MII_ICU_Method_Observation_Blutdruck (extensible)
  * coding MS
    * system MS
    * code MS
* device MS
* referenceRange ..0 MS
* component MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
* component contains
    SystolicBP 0..1 MS and
    DiastolicBP 0..1 MS and
    meanBP 0..1 MS
  * code 1.. MS
* component[SystolicBP] obeys vs-de-3
  * code = $loinc#8480-6
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        loinc 1..1 MS and
        sct 0..1 MS and
        IEEE-11073 0..* MS
    * coding[loinc] = $loinc#8480-6
      * system 1.. MS
      * code 1.. MS
      * display MS
    * coding[sct] = $sct#271649006
      * system 1.. MS
      * code 1.. MS
      * display MS
    * coding[IEEE-11073] ^patternCoding.system = $IEEE11073
      * system 1.. MS
      * code 1.. MS
      * display MS
  * value[x] only Quantity
  * valueQuantity = $unitsofmeasure#mm[Hg] "millimeter Mercury column"
  * valueQuantity MS
    * value 1.. MS
    * unit 1.. MS
    * system 1.. MS
    * code 1.. MS
  * dataAbsentReason MS
* component[DiastolicBP] obeys vs-de-3
  * code = $loinc#8462-4
  * code MS
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        loinc 1..1 MS and
        sct 0..1 MS and
        IEEE-11073 0..* MS
    * coding[loinc] = $loinc#8462-4
      * system 1.. MS
      * code 1.. MS
      * display MS
    * coding[sct] = $sct#271650006
      * system 1.. MS
      * code 1.. MS
      * display MS
    * coding[IEEE-11073] ^patternCoding.system = $IEEE11073
      * system 1.. MS
      * code 1.. MS
      * display MS
  * value[x] only Quantity
  * valueQuantity = $unitsofmeasure#mm[Hg] "millimeter Mercury column"
  * valueQuantity MS
    * value 1.. MS
    * unit 1.. MS
    * system 1.. MS
    * code 1.. MS
  * dataAbsentReason MS
* component[meanBP] obeys vs-de-3
  * code = $loinc#8478-0
  * code MS
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        loinc 1..1 MS and
        sct 0..1 MS and
        IEEE-11073 0..* MS
    * coding[loinc] = $loinc#8478-0
      * system 1.. MS
      * code 1.. MS
      * display MS
    * coding[sct] = $sct#6797001
      * system 1.. MS
      * code 1.. MS
      * display MS
    * coding[IEEE-11073] ^patternCoding.system = $IEEE11073
      * system 1.. MS
      * code 1.. MS
      * display MS
  * value[x] only Quantity
  * valueQuantity = $unitsofmeasure#mm[Hg] "millimeter Mercury column"
  * valueQuantity MS
    * value 1.. MS
    * unit 1.. MS
    * system 1.. MS
    * code 1.. MS
* performer MS
  * ^comment = "Motivation MS: Dieses Feld stellt eine präzisierende Angaben zum Zweck der Qualitätsbewertung bereit"

