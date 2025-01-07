Profile: SD_MII_ICU_Linksventrikulaerer_Herzindex_Durch_Indikatorverduennung
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-linksventri-herzindex-durch-indikatorverduennung
Title: "SD MII ICU Linksventrikulaerer Herzindex durch Indikatorverduennung"
* insert Meta
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8751-0
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* valueQuantity 1..
  * ^patternQuantity.system = "http://unitsofmeasure.org"
  * unit 1..
  * code from VS_MII_ICU_Unit_equivalent_UCUM_L_per_minute_and_squaremeter (required)

Instance: Linksventrikulaerer-Herzindex-Durch-Indikatorverduennung
InstanceOf: SD_MII_ICU_Linksventrikulaerer_Herzindex_Durch_Indikatorverduennung
Usage: #example
* status = #final
* code = $loinc#8751-0 "Left ventricular Cardiac index by Indicator dilution"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 3 'L/min/m2' "liter per minute and square meter"