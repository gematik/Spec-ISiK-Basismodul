Profile: SD_MII_ICU_Linksventrikulaeres_Schlagvolumen_Durch_Indikatorverduennung
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung
Title: "SD MII ICU Linksventrikulaeres Schlagvolumen Durch Indikatorverduennung"
* insert Meta
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8771-8
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* valueQuantity = $unitsofmeasure#mL "milliliter"
  * unit 1..

Instance: Linksventrikulaeres-Schlagvolumen-Durch-Indikatorverduennung
InstanceOf: SD_MII_ICU_Linksventrikulaeres_Schlagvolumen_Durch_Indikatorverduennung
Usage: #example
* status = #final
* code = $loinc#8771-8 "Left ventricular Stroke volume by Indicator dilution"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 70 'mL' "milliliter"