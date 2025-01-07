Profile: SD_MII_ICU_Ideales_Koerpergewicht
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-ideales-koerpergewicht
Title: "SD MII ICU Ideales Koerpergewicht"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#170804003
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#50064-5
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188796
* valueQuantity = $unitsofmeasure#kg "kilogram"
  * unit 1..

Instance: Ideales-Koerpergewicht
InstanceOf: SD_MII_ICU_Ideales_Koerpergewicht
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#50064-5 "Ideal body weight"
  * coding[sct] = $sct#170804003 "Ideal body weight (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#188796 "MDC_MASS_BODY_EST_IBW"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 70 'kg' "kilogram"