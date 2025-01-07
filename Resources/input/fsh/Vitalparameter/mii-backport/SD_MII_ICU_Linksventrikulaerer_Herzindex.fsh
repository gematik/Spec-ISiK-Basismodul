Profile: SD_MII_ICU_Linksventrikulaerer_Herzindex
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-linksventrikulaerer-herzindex
Title: "SD MII ICU Linksventrikulaerer Herzindex"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#54993008
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#75919-1
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#149772
* valueQuantity
  * ^patternQuantity.system = "http://unitsofmeasure.org"
  * ^patternQuantity.unit = "liter per minute and square meter"
  * unit 1..
  * code from VS_MII_ICU_Unit_equivalent_UCUM_L_per_minute_and_squaremeter (required)
* bodySite = $sct#87878005

Instance: Linksventrikulaerer-Herzindex
InstanceOf: SD_MII_ICU_Linksventrikulaerer_Herzindex
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#75919-1 "Left ventricular Cardiac index"
  * coding[sct] = $sct#54993008 "Cardiac index (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#149772 "Cardiac index"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 3 'L/(min.m2)' "liter per minute and square meter"
* bodySite = $sct#87878005 "Left cardiac ventricular structure"