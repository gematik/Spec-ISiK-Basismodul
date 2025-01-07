Profile: SD_MII_ICU_Koerpertemperatur_Myokard
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-myokard
Title: "SD MII ICU Koerpertemperatur Myokard"
* insert Meta
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#61009-7
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188500
* bodySite = $sct#74281007

Instance: Koerpertemperatur-Myokard
InstanceOf: SD_MII_ICU_Koerpertemperatur_Myokard
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#61009-7 "Myocardial temperature"
  * coding[IEEE-11073] = $IEEE11073#188500 "Myocardial temperature"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#74281007 "Myocardium structure (body structure)"