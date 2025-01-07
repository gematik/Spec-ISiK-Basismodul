Profile: SD_MII_ICU_Koerpertemperatur_Stirn
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-stirn
Title: "SD MII ICU Koerpertemperatur Stirn"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#415922000
  * coding[loinc] ..0
    * ^patternCoding.system = "http://loinc.org"
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#52795006

Instance: Koerpertemperatur-Stirn
InstanceOf: SD_MII_ICU_Koerpertemperatur_Stirn
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#415922000 "Temperature of forehead (observable entity)"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#52795006 "Forehead structure (body structure)"