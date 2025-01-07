Profile: ISiKLaboruntersuchungTSH
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungTSH
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung TSH eines Patienten in ISiK Szenarien."
* insert Meta
* code.coding[loinc] from ObservationCodesTSH
* code.coding[snomed] = $sct#61167004
* valueQuantity from ObservationUnitsTSH
* referenceRange MS
  * low from ObservationUnitsTSH
  * high from ObservationUnitsTSH

ValueSet: ObservationCodesTSH
Id: ObservationCodesTSH
Description: "Enthält LOINC-Codes für die Observation TSH"
* insert Meta
* $cs-loinc#3015-5 "Thyreotropin [Einheiten/Volumen] in Blut"
* $cs-loinc#26998-5 "Thyreotropin [Einheiten/Volumen] in Speichel"
* $cs-loinc#3016-3 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma"
* $cs-loinc#14999-7 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --Basislinie"
* $cs-loinc#50533-9 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1. Probenmaterial"
* $cs-loinc#50534-7 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --2. Probenmaterial"
* $cs-loinc#50535-4 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --3. Probenmaterial"
* $cs-loinc#50536-2 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --4. Probenmaterial"
* $cs-loinc#50537-0 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --5. Probenmaterial"
* $cs-loinc#50538-8 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --6. Probenmaterial"
* $cs-loinc#50539-6 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --7. Probenmaterial"
* $cs-loinc#50540-4 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --8. Probenmaterial"
* $cs-loinc#5385-0 "Thyreotropin-Rezeptor-Antikörper [Einheiten/Volumen] in Serum"
* $cs-loinc#15000-3 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --vor Dosis TRH intravenös"
* $cs-loinc#11580-8 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma mittels Nachweisgrenze <= 0,005 mIU/L"
* $cs-loinc#11579-0 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma mittels Nachweisgrenze <= 0,05 mIU/L"
* $cs-loinc#57416-0 "Thyreotropin-Rezeptor-Antikörper [Einheiten/Volumen] in Serum mittels Immunoassay"
* $cs-loinc#33260-1 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1,5 Stunden nach Dosis TRH"
* $cs-loinc#12934-6 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --15 Minuten nach XXX Stimulation"
* $cs-loinc#33259-3 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1 Stunde nach Dosis TRH"
* $cs-loinc#25789-9 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1. Probenmaterial nach XXX Stimulation"
* $cs-loinc#50541-2 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --20 Minuten nach Dosis TRH"
* $cs-loinc#33261-9 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --2 Stunden nach Dosis TRH"
* $cs-loinc#12941-1 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --2. Probenmaterial nach XXX Stimulation"
* $cs-loinc#33258-5 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --30 Minuten nach Dosis TRH"
* $cs-loinc#12940-3 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --30 Minuten vor XXX Stimulation"
* $cs-loinc#12942-9 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --3. Probenmaterial nach XXX Stimulation"
* $cs-loinc#12937-9 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --45 Minuten nach XXX Stimulation"
* $cs-loinc#12943-7 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --4. Probenmaterial nach XXX Stimulation"
* $cs-loinc#12944-5 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --5. Probenmaterial nach XXX Stimulation"
* $cs-loinc#12945-2 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --6. Probenmaterial nach XXX Stimulation"
* $cs-loinc#12946-0 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --7. Probenmaterial nach XXX Stimulation"
* $cs-loinc#12947-8 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --8. Probenmaterial nach XXX Stimulation"
* $cs-loinc#12948-6 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --9. Probenmaterial nach XXX Stimulation"
* $cs-loinc#34054-7 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --vor oder nach Dosis TRH"
* $cs-loinc#44935-5 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --15 Minuten nach Dosis TRH intravenös"
* $cs-loinc#44936-3 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --15 Minuten vor Dosis TRH intravenös"
* $cs-loinc#14998-9 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --1 Stunde nach Dosis TRH intravenös"
* $cs-loinc#14997-1 "Thyreotropin [Einheiten/Volumen] in Serum oder Plasma --30 Minuten nach Dosis TRH intravenös"

ValueSet: ObservationUnitsTSH
Id: ObservationUnitsTSH
Description: "Enthält UCUM-Einheiten für die Observation TSH"
* insert Meta
* $cs-ucum#m[IU]/L "milli IU per liter"
* $cs-ucum#u[IU]/mL "micro IU per milliliter"

Instance: ExampleISiKLaboruntersuchungTSH1
InstanceOf: ISiKLaboruntersuchungTSH
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* code.coding[loinc] = $cs-loinc#3015-5
* code.coding[snomed] = $sct#61167004 "Thyroid stimulating hormone measurement"
* valueQuantity = 3.4 $cs-ucum#u[IU]/mL
* referenceRange
  * low = 0.27 $cs-ucum#u[IU]/mL
  * high = 4.2 $cs-ucum#u[IU]/mL
