Profile: SD_MII_ICU_Koerpertemperatur_Halswirbelsaeule
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-halswirbelsaeule
Title: "SD MII ICU Koerpertemperatur Halswirbelsaeule"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#364419004
  * coding[loinc] ..0
    * ^patternCoding.system = "http://loinc.org"
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#122494005

Instance: Koerpertemperatur-Halswirbelsaeule
InstanceOf: SD_MII_ICU_Koerpertemperatur_Halswirbelsaeule
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#364419004 "Temperature of cervical spine (observable entity)"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#122494005 "Structure of cervical vertebral column (body structure)"