Profile: ISiKCoding
Parent: Coding
Id: ISiKCoding
Title: "ISiKCoding"
Description: "Data Type profile for Codings in ISiK"
* insert Meta
* system 1.. MS
* code 1.. MS
* display MS

Profile: ISiKSnomedCTCoding
Parent: ISiKCoding
Id: ISiKSnomedCTCoding
Title: "ISiKSnomedCTCoding"
Description: "Data Type profile for Snomed-CT Codings in ISiK"
* insert Meta
* system = $sct
* version MS
* version obeys sct-version-de

Profile: ISiKLoincCoding
Parent: ISiKCoding
Id: ISiKLoincCoding
Title: "ISiKLoincCoding"
Description: "Data Type profile for LOINC Codings in ISiK"
* insert Meta
* system = $loinc
* version MS

// Profile die von den dt. Basisprofilen erben
//

Profile: ISiKICD10GMCoding
Parent: CodingICD10GM
Id: ISiKICD10GMCoding
Title: "ISiKICD10GMCoding"
Description: "Data Type profile for ICD10-GM Codings in ISiK"
* insert Meta
* system 1.. MS
* code 1.. MS
* display MS
* version MS

Profile: ISiKASKCoding
Parent: CodingASK
Id: ISiKASKCoding
Title: "ISiKASKCoding"
Description: "Data Type profile for ASK Codings in ISiK"
* insert Meta
* system 1.. MS
* code 1.. MS
* display MS

Profile: ISiKATCCoding
Parent: CodingATC
Id: ISiKATCCoding
Title: "ISiKATCCoding"
Description: "Data Type profile for ATC Codings in ISiK"
* insert Meta
* system 1.. MS
* code 1.. MS
* display MS

Profile: ISiKPZNCoding
Parent: CodingPZN
Id: ISiKPZNCoding
Title: "ISiKPZNCoding"
Description: "Data Type profile for ATC Codings in ISiK"
* insert Meta
* system 1.. MS
* code 1.. MS
* display MS

Invariant: sct-version-de
Description: "Die SnomedCT-Version muss einer deutschen Edition entsprechen"
Severity: #error
Expression: "startsWith('http://snomed.info/sct/11000274103')"