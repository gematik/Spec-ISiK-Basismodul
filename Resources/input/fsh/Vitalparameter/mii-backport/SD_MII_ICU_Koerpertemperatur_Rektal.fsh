Profile: SD_MII_ICU_Koerpertemperatur_Rektal
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-rektal
Title: "SD MII ICU Koerpertemperatur rektal"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#307047009
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8332-9
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188420
* bodySite = $sct#34402009

Instance: Koerpertemperatur-rektal
InstanceOf: SD_MII_ICU_Koerpertemperatur_Rektal
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8332-9 "Rectal temperature"
  * coding[sct] = $sct#307047009 "Core body temperature measured in rectum (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#188420 "Rectal temperature"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#34402009 "Rectum structure (body structure)"