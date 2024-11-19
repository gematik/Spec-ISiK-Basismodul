Profile: ISiKCodeSystem
Parent: CodeSystem
Id: ISiKCodeSystem
Description: "Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-sepzifischen Kodierungen in ISiK-Szenarien"
* insert Meta
* url 1.. MS
* version 1.. MS
* name 1.. MS
* status MS
* content MS
* concept 1.. MS
  * code MS
  * display 1.. MS
  * definition MS

Instance: CodeSystemExample
InstanceOf: ISiKCodeSystem
Usage: #example
* insert MetaInstance
* url = "http://example.org/fhir/CodeSystem/TestKatalog"
* name = "TestKatalog"
* status = #active
* content = #complete
* concept[0].code = #test
* concept[0].display = "Test"
* concept[0].definition = "Dies ist ein Test-Code"