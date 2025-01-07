Profile: SD_MII_ICU_Herzzeitvolumen
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-herzzeitvolumen
Title: "SD MII ICU Herzzeitvolumen"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#82799009
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8741-1
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150276
* valueQuantity from VS_MII_ICU_Unit_equivalent_UCUM_L_per_minute (required)
  * ^patternQuantity.unit = "liter per minute"
  * unit 1..

Instance: Herzzeitvolumen
InstanceOf: SD_MII_ICU_Herzzeitvolumen
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8741-1 "Left ventricular Cardiac output"
  * coding[sct] = $sct#82799009 "Cardiac output (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#150276 "Cardiac output"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 5 'L/min' "liter per minute"