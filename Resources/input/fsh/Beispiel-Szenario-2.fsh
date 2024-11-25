/* 
Gesetzlich hauptversicherte Patientin mit Kreuz-Stern-Diagnose als (Krankenhaus-)Hauptdiagnose eines stationären Aufenthaltes

BundleVisualizer: http://clinfhir.com/bundleVisualizer.html
*/


Instance: SZ2Patient
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId]
  * type = $identifier-type-de-basis#KVZ10
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A222222222"
* identifier[Patientennummer]
  * type = $v2-0203#MR
  * system = "http://beispiel-krankenhaus.de/sid/Patienten"
  * value = "222222"
* active = true
* name[Name]
  * family = "Musterfrau"
  * given = "Friedlinde"
* gender = #female
* birthDate = "1924-01-01"

Instance: SZ2Primaerdiagnose
InstanceOf: ISiKDiagnose
Usage: #example
* code.coding[ICD-10-GM] = $icd-10-gm#E10.30 "Diabetes mellitus"
  * extension[Mehrfachcodierungs-Kennzeichen]
    * valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#†
  * version = "2024"
* subject = Reference(SZ2Patient)
* encounter = Reference(SZ2Encounter)
* recordedDate = 2024-11-05

Instance: SZ2Sekundaerdiagnose
InstanceOf: ISiKDiagnose
Usage: #example
* extension[related]
  * valueReference = Reference(SZ2Primaerdiagnose)
* code.coding[ICD-10-GM] = $icd-10-gm#H36.0 "Retinopathia diabetica"
  * extension[Mehrfachcodierungs-Kennzeichen]
    * valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#*
  * version = "2024"
* subject = Reference(SZ2Patient)
* encounter = Reference(SZ2Encounter)
* recordedDate = 2024-11-05

Instance: SZ2Encounter
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
* identifier
  * type = $v2-0203#VN
  * system = "http://beispiel-krankenhaus.de/sid/besuchsnummer"
  * value = "222222222-2"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* type[KontaktArt] = $Kontaktart-de#stationaer "Stationär"
* subject = Reference(SZ2Patient)
* period.start = "2024-10-07"
* period.end = "2024-10-10"
* account = Reference(SZ2DRGFall)
* account.identifier  
  * system = "http://beispiel-krankenhaus.de/sid/fallnummern"
  * value = "22222222222"
  
Instance: SZ2DRGFall
InstanceOf: ISiKAbrechnungsfall
Usage: #example
* extension[AbrechnungsDiagnoseProzedur]
  * extension[Use].valueCoding = http://fhir.de/CodeSystem/KontaktDiagnoseProzedur#hospital-main-diagnosis
  * extension[Referenz].valueReference = Reference(SZ2Primaerdiagnose)
* identifier[Abrechnungsnummer]
  * system = "http://beispiel-krankenhaus.de/sid/fallnummern"
  * value = "22222222222"
* status = #active
* type = $v3-ActCode#IMP
* subject = Reference(SZ2Patient)
* coverage[+]
  * extension[Abrechnungsart].valueCoding = $Abrechnungsart#DRG "Diagnosebezogene Fallgruppen"
  * coverage = Reference(SZ2VersicherungGesetzlich)

Instance: SZ2VersicherungGesetzlich
InstanceOf: ISiKVersicherungsverhaeltnisGesetzlich
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#GKV
* beneficiary = Reference(SZ2Patient)
* subscriber = Reference(SZ2Patient)
* payor
  * identifier
    * type = $v2-0203#XX
    * system = "http://fhir.de/sid/arge-ik/iknr"
    * value = "260326855"
  * display = "BKK für Testpatienten"  

Instance: Szenario2
InstanceOf: Bundle
* type = #collection
* entry[+].resource = SZ2Patient
* entry[+].resource = SZ2Primaerdiagnose
* entry[+].resource = SZ2Sekundaerdiagnose
* entry[+].resource = SZ2Encounter
* entry[+].resource = SZ2DRGFall
* entry[+].resource = SZ2VersicherungGesetzlich 