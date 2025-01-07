Profile: SD_MII_ICU_Koerpergewicht_Percentil_Altersabhaengig
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-koerpergewicht-percentil-altersabhaengig
Title: "SD MII ICU Koerpergewicht Percentil Altersabhaengig"
* insert Meta
* category contains sct 0..*
* category[sct] = $sct#248326004
  * coding MS
    * system 1.. MS
    * code 1.. MS
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#1153592008
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8336-0
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* valueQuantity = $unitsofmeasure#% "percent"
  * unit 1..

Instance: Koerpergewicht-Percentile-altersabhaengig
InstanceOf: SD_MII_ICU_Koerpergewicht_Percentil_Altersabhaengig
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8336-0 "Body weight [Percentile] Per age"
  * coding[sct] = $sct#1153592008 "Weight for age percentile (observable entity)"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 50 '%' "percent"