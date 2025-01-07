Profile: SD_MII_ICU_Sauerstoffsaettigung_Im_Blut_Postduktal_Durch_Pulsoxymetrie
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-o2saettigung-im-blut-postduktal-durch-pulsoxymetrie
Title: "SD MII ICU Sauerstoffsaettigung Im Blut Postduktal Durch Pulsoxymetrie"
* insert Meta
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#59418-4
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#160300
  * coding contains loinc-fhir-core 0..* MS
  * coding[loinc-fhir-core] = $loinc#2708-6
    * system 1.. MS
    * code 1.. MS
* valueQuantity = $unitsofmeasure#% "percent"
  * unit 1..

Instance: Sauerstoffsaettigung-im-Blut-Postduktal-durch-Pulsoxymetrie
InstanceOf: SD_MII_ICU_Sauerstoffsaettigung_Im_Blut_Postduktal_Durch_Pulsoxymetrie
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#59418-4 "Oxygen saturation in Blood Postductal by Pulse oximetry"
  * coding[IEEE-11073] = $IEEE11073#160300 "Postductal SpO2"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 91 '%' "percent"