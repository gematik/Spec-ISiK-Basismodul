Profile: SD_MII_ICU_Linksventrikulaeres_Schlagvolumen
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-linksventrikulaeres-schlagvolumen
Title: "SD MII ICU Linksventrikulaeres Schlagvolumen"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#90096001
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#20562-5
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150408
* valueQuantity = $unitsofmeasure#mL "milliliter"
  * unit 1..
* bodySite = $sct#244385005

Instance: Linksventrikulaeres-Schlagvolumen
InstanceOf: SD_MII_ICU_Linksventrikulaeres_Schlagvolumen
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#20562-5 "Left ventricular Stroke volume"
  * coding[sct] = $sct#90096001 "Stroke volume (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#150408 "MDC_VOL_BLD_VENT_LEFT_STROKE"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 70 'mL' "milliliter"
* bodySite = $sct#244385005 "Entire left cardiac ventricle"