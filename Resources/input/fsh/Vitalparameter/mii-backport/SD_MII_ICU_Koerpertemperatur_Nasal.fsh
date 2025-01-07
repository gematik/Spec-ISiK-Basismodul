Profile: SD_MII_ICU_Koerpertemperatur_Nasal
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-nasal
Title: "SD MII ICU Koerpertemperatur nasal"
* insert Meta
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#76010-8
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188504
* bodySite = $sct#45206002

Instance: Koerpertemperatur-nasal
InstanceOf: SD_MII_ICU_Koerpertemperatur_Nasal
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#76010-8 "Nasal temperature"
  * coding[IEEE-11073] = $IEEE11073#188504 "Nasal temperature"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#45206002 "Nasal structure (body structure)"