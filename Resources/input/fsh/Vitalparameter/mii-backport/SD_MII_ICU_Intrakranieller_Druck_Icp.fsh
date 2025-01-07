Profile: SD_MII_ICU_Intrakranieller_Druck_Icp
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-intrakranieller-druck-icp
Title: "SD MII ICU Intrakranieller Druck ICP"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#250844005
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#60956-0
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#153608
* valueQuantity = $unitsofmeasure#mm[Hg] "millimeter Mercury column"
  * unit 1..
* bodySite = $sct#731998000

Instance: Intrakranieller-Druck-ICP
InstanceOf: SD_MII_ICU_Intrakranieller_Druck_Icp
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#60956-0 "Intracranial pressure (ICP)"
  * coding[sct] = $sct#250844005 "Intracranial pressure (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#153608 "Intracranial pressure"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 10 'mm[Hg]' "millimeter Mercury column"
* bodySite = $sct#731998000 "Entire intracranial structure"