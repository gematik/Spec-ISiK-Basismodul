Profile: SD_MII_ICU_Pulmonalarterieller_Blutdruck
Parent: SD_MII_ICU_Sonstige_Pulsatile_Druecke_Generisch
Id: sd-mii-icu-pulmonalarterieller-blutdruck
Title: "SD MII ICU Pulmonalarterieller Blutdruck"
* insert Meta
* category = ObservationCategoryCodes#vital-signs
* code
  * coding ..4
  * coding contains 
    loinc 1..1 MS and
    IEEE-11073 1..1 
  * coding[sct] = $sct#250767002
  * coding[IEEE-11073] = $IEEE11073#150044  
  * coding[loinc] = $loinc#76284-9
    * system 1.. MS
    * code 1.. MS
    * display MS
* component[SystolicBP].code
  * coding[IEEE-11073] = $IEEE11073#150045
  * coding contains 
      loinc-detailed 0..1 and
      sct-detailed 0..1
  * coding[loinc-detailed] = $loinc#8440-0
  * coding[sct-detailed] = $sct#250768007
* component[DiastolicBP].code
  * coding[IEEE-11073] = $IEEE11073#150046
  * coding contains 
      loinc-detailed 0..1 and
      sct-detailed 0..1
  * coding[loinc-detailed] = $loinc#8385-7
  * coding[sct-detailed] = $sct#250769004
* component[meanBP].code
  * coding[IEEE-11073] = $IEEE11073#150047
  * coding contains 
      loinc-detailed 0..1 and
      sct-detailed 0..1
  * coding[loinc-detailed] = $loinc#8414-5
  * coding[sct-detailed] = $sct#250770003
* bodySite = $sct#81040000

Instance: Pulmonalarterieller-Blutdruck
InstanceOf: SD_MII_ICU_Pulmonalarterieller_Blutdruck
Usage: #example
* status = #final
* category = ObservationCategoryCodes#vital-signs
* code
  * coding[sct] = $sct#250767002 "Pulmonary artery pressure"
  * coding[loinc] = $loinc#76284-9 "Pulmonary artery Blood pressure"
  * coding[IEEE-11073] = $IEEE11073#150044 "MDC_PRESS_BLD_ART_PULM"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2019-12-23T09:30:10+01:00"
* component[SystolicBP]
  * code
    * coding[loinc] = $loinc#8480-6
    * coding[loinc-detailed] = $loinc#8440-0 "Pulmonary artery Systolic blood pressure"
    * coding[sct-detailed] = $sct#250768007 "Pulmonary artery systolic pressure"
    * coding[IEEE-11073] = $IEEE11073#150045 "Systolic pulmonary arterial pressure"
  * valueQuantity = 18 'mm[Hg]' "millimeter Mercury column"
* component[DiastolicBP]
  * code
    * coding[loinc] = $loinc#8462-4
    * coding[loinc-detailed] = $loinc#8385-7 "Pulmonary artery Diastolic blood pressure"
    * coding[sct-detailed] = $sct#250769004 "Pulmonary artery diastolic pressure"
    * coding[IEEE-11073] = $IEEE11073#150046 "Diastolic pulmonary arterial pressure"
  * valueQuantity = 8 'mm[Hg]' "millimeter Mercury column"
* component[meanBP]
  * code
    * coding[loinc] = $loinc#8478-0
    * coding[loinc-detailed] = $loinc#8414-5 "Pulmonary artery Mean blood pressure"
    * coding[sct-detailed] = $sct#250770003 "Pulmonary artery mean pressure"
    * coding[IEEE-11073] = $IEEE11073#150047 "Mean pulmonary arterial pressure"
  * valueQuantity = 10 'mm[Hg]' "millimeter Mercury column"
* bodySite = $sct#81040000 "Pulmonary artery structure"