Profile: SD_MII_ICU_Koerpertemperatur_Speiseroehre
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-speiseroehre
Title: "SD MII ICU Koerpertemperatur Speiseroehre"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#431598003
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#60836-4
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150372
* bodySite = $sct#32849002

Instance: Koerpertemperatur-Speiseroehre
InstanceOf: SD_MII_ICU_Koerpertemperatur_Speiseroehre
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#60836-4 "Esophageal temperature"
  * coding[sct] = $sct#431598003 "Core body temperature measured in esophagus (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#150372 "MDC_TEMP_ESOPH"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#32849002 "Esophageal structure (body structure)"