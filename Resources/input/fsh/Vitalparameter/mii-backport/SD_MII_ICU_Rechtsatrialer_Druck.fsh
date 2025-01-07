Profile: SD_MII_ICU_Rechtsatrialer_Druck
Parent: SD_MII_ICU_Sonstige_Pulsatile_Druecke_Generisch
Id: sd-mii-icu-rechtsatrialer-druck
Title: "SD MII ICU Rechtsatrialer Druck"
* insert Meta
* category = ObservationCategoryCodes#vital-signs
* code
  * coding ..4
  * coding contains 
    loinc 1..1 and
    IEEE-11073 1..1
  * coding[sct] = $sct#276755008
  * coding[loinc] = $loinc#60996-6
    * system 1.. MS
    * code 1.. MS
    * display MS
  * coding[IEEE-11073] = $IEEE11073#150068
* component[SystolicBP].code
  * coding[IEEE-11073] = $IEEE11073#150069
  * coding contains loinc-detailed 0..1
  * coding[loinc-detailed] = $loinc#60998-2
* component[DiastolicBP].code
  * coding[IEEE-11073] = $IEEE11073#150070
  * coding contains loinc-detailed 0..1
  * coding[loinc-detailed] = $loinc#60997-4
* component[meanBP].code
  * coding[IEEE-11073] = $IEEE11073#150071
  * coding contains 
    loinc-detailed 0..1 and
    sct-detailed 0..1
  * coding[loinc-detailed] = $loinc#8400-4
  * coding[sct-detailed] = $sct#276775004
* bodySite = $sct#73829009

Instance: Rechtsatrialer-Druck
InstanceOf: SD_MII_ICU_Rechtsatrialer_Druck
Usage: #example
* status = #final
* category = ObservationCategoryCodes#vital-signs
* code
  * coding[sct] = $sct#276755008 "Right atrial pressure (observable entity)"
  * coding[loinc] = $loinc#60996-6 "Right atrial pressure"
  * coding[IEEE-11073] = $IEEE11073#150068 "MDC_PRESS_BLD_ATR_RIGHT"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2019-12-23T09:30:10+01:00"
* component[SystolicBP]
  * code
    * coding[loinc] = $loinc#8480-6
    * coding[loinc-detailed] = $loinc#60998-2 "Right atrial pressure Systolic"
    * coding[IEEE-11073] = $IEEE11073#150069 "Systolic right atrial pressure"
  * valueQuantity = 5 'mm[Hg]' "millimeter Mercury column"
* component[meanBP]
  * code
    * coding[loinc] = $loinc#8478-0
    * coding[loinc-detailed] = $loinc#8400-4 "Right atrial Intrachamber mean pressure"
    * coding[sct-detailed] = $sct#276775004 "Mean right atrial pressure"
    * coding[IEEE-11073] = $IEEE11073#150071 "Mean right atrial pressure"
  * valueQuantity = 4 'mm[Hg]' "millimeter Mercury column"
* component[DiastolicBP]
  * code
    * coding[loinc] = $loinc#8462-4
    * coding[loinc-detailed] = $loinc#60997-4 "Right atrial pressure Diastolic"
    * coding[IEEE-11073] = $IEEE11073#150070 "Diastolic right atrial pressure"
  * valueQuantity = 3 'mm[Hg]' "millimeter Mercury column"
* bodySite = $sct#73829009 "Right atrial structure"