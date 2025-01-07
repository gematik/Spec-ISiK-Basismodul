Profile: SD_MII_ICU_Linksventrikulaerer_Druck
Parent: SD_MII_ICU_Sonstige_Pulsatile_Druecke_Generisch
Id: sd-mii-icu-linksventrikulaerer-druck
Title: "SD MII ICU Linksventrikulaerer Druck"
* insert Meta
* category = ObservationCategoryCodes#vital-signs
* code
  * coding ..3
  * coding contains IEEE11073 1..1
  * coding[sct] = $sct#276769008
  * coding[IEEE11073] = $IEEE11073#150100
* component[SystolicBP].code 
  * coding[IEEE-11073] = $IEEE11073#150101
  * coding contains 
      loinc-detailed 0..1 and
      sct-detailed 0..1
  * coding[loinc-detailed] = $loinc#8430-1
  * coding[sct-detailed] = $sct#276780008
* component[DiastolicBP].code
  * coding[IEEE-11073] = $IEEE11073#150102
  * coding contains loinc-detailed 0..1
  * coding[loinc-detailed] = $loinc#8375-8
* component[meanBP].code
  * coding[IEEE-11073] = $IEEE11073#150103
  * coding contains loinc-detailed 0..1
  * coding[loinc-detailed] = $loinc#8404-6

Instance: Linksventrikulaerer-Druck
InstanceOf: SD_MII_ICU_Linksventrikulaerer_Druck
Usage: #example
* status = #final
* code 
  * coding[sct] = $sct#276769008 "Left ventricular pressure (observable entity)"
  * coding[IEEE11073] = $IEEE11073#150100 "MDC_PRESS_BLD_VENT_LEFT"
* subject.reference = "Patient/PatientinMusterfrau"
* effectiveDateTime = "2019-12-23T09:30:10+01:00"
* component[meanBP]
  * code
    * coding[loinc] = $loinc#8478-0
    * coding[loinc-detailed] = $loinc#8404-6 "Left ventricular Intrachamber mean pressure"
    * coding[IEEE-11073] = $IEEE11073#150103 "Mean left ventricular pressure"
  * valueQuantity = 40 'mm[Hg]' "millimeter Mercury column"
* component[SystolicBP]
  * code
    * coding[loinc] = $loinc#8480-6
    * coding[loinc-detailed] = $loinc#8430-1 "Left ventricular Intrachamber systolic pressure"
    * coding[sct-detailed] = $sct#276780008 "Left ventricular systolic pressure"
    * coding[IEEE-11073] = $IEEE11073#150101 "Systolic left ventricular pressure"
  * valueQuantity = 120 'mm[Hg]' "millimeter Mercury column"
* component[DiastolicBP]
  * code
    * coding[loinc] = $loinc#8462-4
    * coding[loinc-detailed] = $loinc#8375-8 "Left ventricular Intrachamber diastolic pressure"
    * coding[IEEE-11073] = $IEEE11073#150102 "Diastolic left ventricular pressure"
  * valueQuantity = 10 'mm[Hg]' "millimeter Mercury column"