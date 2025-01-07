Profile: SD_MII_ICU_Pulmonalarterieller_Wedge_Druck
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-pulmonalarterieller-wedge-druck
Title: "SD MII ICU Pulmonalarterieller Wedge Druck"
* insert Meta
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#118433006
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#75994-4
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150052
* valueQuantity = $unitsofmeasure#mm[Hg] "millimeter Mercury column"
  * unit 1..
* bodySite = $sct#430160002

Instance: Pulmonalarterieller-wedge-Blutdruck
InstanceOf: SD_MII_ICU_Pulmonalarterieller_Wedge_Druck
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#75994-4 "Pulmonary artery wedge pressure"
  * coding[sct] = $sct#118433006 "Pulmonary artery wedge pressure (observable entity)"
  * coding[IEEE-11073] = $IEEE11073#150052 "Pulmonary artery wedge pressure"
* subject.reference = "Patient/PatientinMusterfrau"
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 10 'mm[Hg]' "millimeter Mercury column"
* bodySite = $sct#430160002 "Entire vein of lung"