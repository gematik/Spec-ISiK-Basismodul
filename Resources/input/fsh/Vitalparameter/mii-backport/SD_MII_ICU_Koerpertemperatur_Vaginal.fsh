Profile: SD_MII_ICU_Koerpertemperatur_Vaginal
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-vaginal
Title: "SD MII ICU Koerpertemperatur vaginal"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#364246006
  * coding[loinc] ..0
    * ^patternCoding.system = "http://loinc.org"
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#76784001

Instance: Koerpertemperatur-vaginal
InstanceOf: SD_MII_ICU_Koerpertemperatur_Vaginal
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#364246006 "Core body temperature measured vaginally (observable entity)"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#76784001 "Vaginal structure (body structure)"