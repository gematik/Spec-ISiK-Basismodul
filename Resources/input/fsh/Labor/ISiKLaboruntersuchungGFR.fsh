Profile: ISiKLaboruntersuchungGFR
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungGFR
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung GFR eines Patienten in ISiK Szenarien."
* insert Meta
* code.coding[loinc] from ObservationCodesGFR
* code.coding[snomed] = $sct#80274001
* valueQuantity from ObservationUnitsGFR
* referenceRange MS
  * low from ObservationCodesGFR
  * high from ObservationCodesGFR

ValueSet: ObservationCodesGFR
Id: ObservationCodesGFR
Description: "Enthält LOINC-Codes für die Observation GFR"
* insert Meta
* $cs-loinc#98980-6 "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin- und Cystatin-C-basierte Formel (CKD-EPI 2021)"
* $cs-loinc#98979-8 "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (CKD-EPI 2021)"
* $cs-loinc#94677-2 "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin- und Cystatin-C-basierte Formel (CKD-EPI)"
* $cs-loinc#62238-1 "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (CKD-EPI)"
* $cs-loinc#77147-7 "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (MDRD)"
* $cs-loinc#50384-7 "Glomeruläre Filtrationsrate/1,73 qm.geschätzt:Volumenrate pro Fläche:Zeitpunkt:Serum, Plasma oder Blut:Quantitativ:Creatinin-basierte Formel (Schwartz)"

ValueSet: ObservationUnitsGFR
Id: ObservationUnitsGFR
Description: "Enthält UCUM-Einheiten für die Observation GFR"
* insert Meta
* $cs-ucum#mL/min/{1.73_m2} "milliliter pro Minute pro Körperoberfläche von 1,73 m2"


Instance: ExampleISiKLaboruntersuchungGFR1
InstanceOf: ISiKLaboruntersuchungGFR
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* code.coding[loinc] = $cs-loinc#98980-6
* code.coding[snomed] = $sct#80274001 "Glomerular filtration rate"
* valueQuantity = 100 $cs-ucum#mL/min/{1.73_m2} "milliliter pro Minute pro Körperoberfläche von 1,73 m2"
* referenceRange
  * high = 72 $cs-ucum#mL/min/{1.73_m2}
  * high = 100 $cs-ucum#mL/min/{1.73_m2}
