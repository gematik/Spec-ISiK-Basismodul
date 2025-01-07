Profile: SD_MII_ICU_Koerpertemperatur_Blut
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-blut
Title: "SD MII ICU Koerpertemperatur Blut"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#1222808002
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#60834-9
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188436


Instance: Koerpertemperatur-Blut
InstanceOf: SD_MII_ICU_Koerpertemperatur_Blut
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#60834-9 "Blood temperature"
  * coding[sct] = $sct#1222808002 "Core body temperature measured in blood (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#188436 "Blood temperature"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"