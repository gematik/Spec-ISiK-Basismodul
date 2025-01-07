Profile: SD_MII_ICU_Linksventrikulaerer_Schlagvolumenindex_Durch_Indikatorverduennung
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-linksventri-schlagvolumenindex-durch-indikatorverd
Title: "SD MII ICU Linksventrikulaerer Schlagvolumenindex Durch Indikatorverduennung"
* insert Meta
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8791-6
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* valueQuantity = $unitsofmeasure#mL/m2 "milliliter per square meter"
  * unit 1..

Instance: Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung
InstanceOf: SD_MII_ICU_Linksventrikulaerer_Schlagvolumenindex_Durch_Indikatorverduennung
Usage: #example
* status = #final
* code = $loinc#8791-6 "Left ventricular Stroke volume index by Indicator dilution"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 40 'mL/m2' "milliliter per square meter"