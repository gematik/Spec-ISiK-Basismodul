Profile: SD_MII_ICU_Koerpertemperatur_Leiste
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-leiste
Title: "SD MII ICU Koerpertemperatur Leiste"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#415929009
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#104063-3
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#26893007

Instance: Koerpertemperatur-Leiste
InstanceOf: SD_MII_ICU_Koerpertemperatur_Leiste
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#415929009 "Estimated core body temperature measured in inguinal region (observable entity)"
  * coding[loinc] = $loinc#104063-3 "Body temperature - Groin"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#26893007 "Inguinal region structure (body structure)"