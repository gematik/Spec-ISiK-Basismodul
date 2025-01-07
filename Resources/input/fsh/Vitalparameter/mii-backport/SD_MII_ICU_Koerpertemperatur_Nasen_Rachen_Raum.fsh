Profile: SD_MII_ICU_Koerpertemperatur_Nasen_Rachen_Raum
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-nasen-rachen-raum
Title: "SD MII ICU Koerpertemperatur Nasen-Rachen-Raum"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#698831002
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#60838-0
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150380
* bodySite = $sct#71836000

Instance: Koerpertemperatur-Nasen-Rachen-Raum
InstanceOf: SD_MII_ICU_Koerpertemperatur_Nasen_Rachen_Raum
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#698831002 "Core body temperature measured in nasopharynx (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#150380 "MDC_TEMP_NASOPH"
  * coding[loinc] = $loinc#60838-0 "Nasopharyngeal temperature"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#71836000 "Nasopharyngeal structure (body structure)"