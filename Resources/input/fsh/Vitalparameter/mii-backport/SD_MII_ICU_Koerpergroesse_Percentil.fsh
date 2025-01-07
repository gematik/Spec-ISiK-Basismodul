Profile: SD_MII_ICU_Koerpergroesse_Percentil_Altersabhaengig
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-koerpergroesse-percentil-altersabhaengig
Title: "SD MII ICU Koerpergroesse Percentil"
* insert Meta
* category contains sct 0..*
* category[sct] = $sct#248326004
  * coding MS
    * system 1.. MS
    * code 1.. MS
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#1153605006
  * coding[loinc] 0..0
    * ^patternCoding.system = $loinc
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* valueQuantity = $unitsofmeasure#% "percent"
  * unit 1..

Instance: Koerpergroesse-Percentil
InstanceOf: SD_MII_ICU_Koerpergroesse_Percentil_Altersabhaengig
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#1153605006 "Body height for age percentile (observable entity)"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 50 '%' "percent"