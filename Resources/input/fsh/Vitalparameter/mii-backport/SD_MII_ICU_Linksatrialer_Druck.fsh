Profile: SD_MII_ICU_Linksatrialer_Druck
Parent: SD_MII_ICU_Sonstige_Pulsatile_Druecke_Generisch
Id: sd-mii-icu-linksatrialer-druck
Title: "SD MII ICU Linksatrialer Druck"
* insert Meta
* category = ObservationCategoryCodes#vital-signs
* code
  * coding ..4
  * coding contains 
      loinc 1..1 and
      IEEE11073 1..1
  * coding[sct] = $sct#276760007
  * coding[IEEE11073] = $IEEE11073#150064
  * coding[loinc] = $loinc#60988-3
    * system 1.. MS
    * code 1.. MS
    * display MS
* component[SystolicBP].code
  * coding[IEEE-11073] = $IEEE11073#150065
  * coding contains loinc-detailed 0..1
  * coding[loinc-detailed] = $loinc#60989-1
* component[DiastolicBP].code
  * coding[IEEE-11073] = $IEEE11073#150066
  * coding contains loinc-detailed 0..1
  * coding[loinc-detailed] = $loinc#75933-2
* component[meanBP].code
  * coding[IEEE-11073] = $IEEE11073#150067
  * coding contains loinc-detailed 0..1
  * coding[loinc-detailed] = $loinc#8399-8
* bodySite = $sct#82471001

Instance: Linksatrialer-Druck
InstanceOf: SD_MII_ICU_Linksatrialer_Druck
Usage: #example
* status = #final
* category = ObservationCategoryCodes#vital-signs
* code
  * coding[sct] = $sct#276760007 "Left atrial pressure"
  * coding[loinc] = $loinc#60988-3 "Left atrial pressure"
  * coding[IEEE11073] = $IEEE11073#150064 "MDC_PRESS_BLD_ATR_LEFT"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2019-12-23T09:30:10+01:00"
* component[SystolicBP]
  * code
    * coding[loinc] = $loinc#8480-6
    * coding[loinc-detailed] = $loinc#60989-1 "Left atrial pressure Systolic"
    * coding[IEEE-11073] = $IEEE11073#150065 "Systolic left atrial pressure"
  * valueQuantity = 8 'mm[Hg]' "millimeter Mercury column"
* component[meanBP]
  * code
    * coding[loinc] = $loinc#8478-0
    * coding[loinc-detailed] = $loinc#8399-8 "Left atrial Intrachamber mean pressure"
    * coding[IEEE-11073] = $IEEE11073#150067 "Mean left atrial pressure"
  * valueQuantity = 6 'mm[Hg]' "millimeter Mercury column"
* component[DiastolicBP]
  * code
    * coding[loinc] = $loinc#8462-4
    * coding[loinc-detailed] = $loinc#75933-2 "Left atrial pressure Diastolic"
    * coding[IEEE-11073] = $IEEE11073#150066 "Diastolic left atrial pressure"
  * valueQuantity = 4 'mm[Hg]' "millimeter Mercury column"
* bodySite = $sct#82471001 "Left atrial structure"