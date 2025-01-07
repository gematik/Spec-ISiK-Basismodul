Profile: SD_MII_ICU_Koerpertemperatur_Lendenwirbelsaeule
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-lendenwirbelsaeule
Title: "SD MII ICU Koerpertemperatur Lendenwirbelsaeule"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#364429006
  * coding[loinc] ..0
    * ^patternCoding.system = "http://loinc.org"
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#122496007

Instance: Koerpertemperatur-Lendenwirbelsaeule
InstanceOf: SD_MII_ICU_Koerpertemperatur_Lendenwirbelsaeule
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#364429006 "Temperature of lumbar spine (observable entity)"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#122496007 "Structure of lumbar vertebral column (body structure)"