Profile: SD_MII_ICU_Zentralvenoeser_Blutdruck
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-zentralvenoeser-blutdruck
Title: "SD MII ICU Zentralvenoeser Blutdruck"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#71420008
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#60985-9
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150084
* valueQuantity = $unitsofmeasure#mm[Hg] "millimeter Mercury column"
  * unit 1..
* bodySite = $sct#73829009

Instance: Zentralvenoeser-Blutdruck
InstanceOf: SD_MII_ICU_Zentralvenoeser_Blutdruck
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#60985-9 "Central venous pressure (CVP)"
  * coding[sct] = $sct#71420008 "Central venous pressure (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#150084 "Central venous pressure"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 12 'mm[Hg]' "millimeter Mercury column"
* bodySite = $sct#73829009 "Right atrial structure"