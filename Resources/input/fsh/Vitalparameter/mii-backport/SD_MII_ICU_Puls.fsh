Profile: SD_MII_ICU_Puls
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-puls
Title: "SD MII ICU Puls"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#8499008
  * coding[loinc] ..0
    * ^patternCoding.system = "http://loinc.org"
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#149514
* valueQuantity 1..
  * ^patternQuantity.system = "http://unitsofmeasure.org"
  * ^patternQuantity.unit = "beats per minute"
  * unit 1..
  * code from VS_MII_ICU_Unit_equivalent_UCUM_beats_per_minute (required)
* dataAbsentReason ..0
* bodySite.coding = $sct#11527006
* bodySite.coding MS
  * system 1.. MS
  * code 1.. MS
  
Instance: Puls
InstanceOf: SD_MII_ICU_Puls
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#8499008 "Pulse, function (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#149514 "Pulse rate"
* subject = Reference(Patient/202)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 70 '/min' "beats per minute"