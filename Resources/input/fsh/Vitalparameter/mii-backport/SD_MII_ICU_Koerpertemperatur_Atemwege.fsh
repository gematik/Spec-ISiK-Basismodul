Profile: SD_MII_ICU_Koerpertemperatur_Atemwege
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-atemwege
Title: "SD MII ICU Koerpertemperatur Atemwege"
* insert Meta
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#60955-2
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150356
* bodySite = $sct#89187006

Instance: Koerpertemperatur-Atemwege
InstanceOf: SD_MII_ICU_Koerpertemperatur_Atemwege
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#60955-2 "Airway temperature"
  * coding[IEEE-11073] = $IEEE11073#150356 "MDC_TEMP_AWAY"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#89187006 "Airway structure (body structure)"