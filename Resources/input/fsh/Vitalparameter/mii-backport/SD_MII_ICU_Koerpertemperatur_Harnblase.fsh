Profile: SD_MII_ICU_Koerpertemperatur_Harnblase
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-harnblase
Title: "SD MII ICU Koerpertemperatur Harnblase"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#698832009
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8334-5
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#89837001

Instance: Koerpertemperatur-Harnblase
InstanceOf: SD_MII_ICU_Koerpertemperatur_Harnblase
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8334-5 "Body temperature - Urinary bladder"
  * coding[sct] = $sct#698832009 "Core body temperature measured at urinary bladder (observable entity)"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#89837001 "Urinary bladder structure (body structure)"