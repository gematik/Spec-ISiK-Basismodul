ValueSet: DiagnosesSCT
Id: DiagnosesSCT
Description: "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes"
* insert Meta
* include codes from system SNOMED_CT
    where concept is-a #404684003 and
    concept is-a #272379006 and
    concept is-a #243796009

ValueSet: ProzedurenCodesSCT
Id: ProzedurenCodesSCT
Description: "Enthaelt alle SNOMED Procedure Codes"
* insert Meta
* include codes from system SNOMED_CT where concept descendent-of #71388002

ValueSet: ProzedurenKategorieSCT
Id: ProzedurenKategorieSCT
Description: "Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel"
* insert Meta
* SNOMED_CT#103693007 "Diagnostic procedure"
* SNOMED_CT#363679005 "Imaging"
* SNOMED_CT#387713003 "Surgical procedure"
* SNOMED_CT#18629005 "Administration of medicine"
* SNOMED_CT#277132007 "Therapeutic procedure"
* SNOMED_CT#394841004 "Other category"

ValueSet: ISiKLocationPhysicalType
Id: ISiKLocationPhysicalType
* insert Meta
* LocationType#bd "Bed"
* LocationType#ro "Room"
* LocationType#wa "Ward"

ValueSet: ISiKDiagnoseTyp
Id: ISiKDiagnoseTyp
* insert Meta
* ISiKKontaktDiagnose#referral-diagnosis "Überweisungsdiagnose"
* ISiKKontaktDiagnose#treatment-diagnosis "Behandlungsdiagnose"

ValueSet: ISiKDiagnosesubtyp
Id: ISiKDiagnosesubtyp
* insert Meta
* ISiKKontaktDiagnose#surgery-diagnosis "Operationsdiagnose"
* ISiKKontaktDiagnose#department-main-diagnosis "Abteilung Hauptdiagnose"
* ISiKKontaktDiagnose#hospital-main-diagnosis "Krankenhaus Hauptdiagnose"
* ISiKKontaktDiagnose#cause-of-death "Todesursache"
* ISiKKontaktDiagnose#infection-control-diagnosis "Infektionsschutzdiagnose"
* $DiagnosisRole#AD "Admission diagnosis"
* $DiagnosisRole#DD "Discharge diagnosis"

ValueSet: ISiKAccountType
Id: ISiKAccountType
Title: "ISiKAccountType"
* insert Meta
* $v3-ActCode#AMB "ambulatory"
* $v3-ActCode#IMP "inpatient encounter"

ValueSet: ISiKAccountDRG
Id: ISiKAccountDRG
* insert Meta
* ISiKKontaktDiagnose#principle-DRG "Principle-DRG"
* ISiKKontaktDiagnose#secondary-DRG "Secondary-DRG"