Profile: SD_MII_ICU_Koerpertemperatur_Achsel
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-achsel
Title: "SD MII ICU Koerpertemperatur Achsel"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#415882003
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8328-7
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188452
* bodySite = $sct#91470000

Instance: Koerpertemperatur-Achsel
InstanceOf: SD_MII_ICU_Koerpertemperatur_Achsel
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8328-7 "Axillary temperature"
  * coding[sct] = $sct#415882003 "Estimated core body temperature measured in axillary region (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#188452 "MDC_TEMP_AXILLA"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#91470000 "Axillary region structure (body structure)"