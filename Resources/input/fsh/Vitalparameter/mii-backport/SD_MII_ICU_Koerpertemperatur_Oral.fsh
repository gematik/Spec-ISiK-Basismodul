Profile: SD_MII_ICU_Koerpertemperatur_Oral
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-unter-der-zunge
Title: "SD MII ICU Koerpertemperatur unter der Zunge"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#415945006
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8331-1
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188424
* bodySite = $sct#123851003

Instance: Koerpertemperatur-Oral
InstanceOf: SD_MII_ICU_Koerpertemperatur_Oral
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8331-1 "Oral temperature"
  * coding[sct] = $sct#415945006 "Core body temperature measured in sublingual space (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#188424 "Oral temperature"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#123851003 "Mouth region structure (body structure)"