Profile: SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie
Title: "SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#442476006
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#59408-5
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150324
  * coding contains loinc-fhir-core 0..* MS
  * coding[loinc-fhir-core] = $loinc#2708-6
    * system 1.. MS
    * code 1.. MS
* valueQuantity = $unitsofmeasure#% "percent"
  * unit 1..
* bodySite = $sct#11527006
  * coding MS
    * system 1.. MS
    * code 1.. MS

Instance: Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie
InstanceOf: SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#442476006 "Arterial oxygen saturation (observable entity)"
  * coding[loinc] = $loinc#59408-5 "Oxygen saturation in Arterial blood by Pulse oximetry"
  * coding[IEEE-11073] = $IEEE11073#150324 "MDC_SAT_O2_ART"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 98 '%' "percent"
* bodySite = $sct#11527006 "Arterial system structure (body structure)"