Profile: ISiKMedikationTransaction
Parent: Bundle
Id: ISiKMedikationTransaction
Title: "ISiK Medikation Transactionbundle"
Description: "Dieses Profil definiert die Transaktions-Bundles im Rahmen von ISiK-Medikations-Szenarien."
* insert Meta
* type MS
  * ^short = "Type des Bundles"
  * ^comment = "fix: transaction"
  * ^fixedCode = #transaction
* entry 1..* MS
  * ^short = "Der einzelne Eintrag zur Interaktion"
  * link 0..0
  * fullUrl MS
    * ^short = "vollständige URL der Ressource"
    * ^comment = "auch die Verwendung von UUIDs in der Form ';urn:uuid:.....' ist möglich."
  * resource MS
    * ^short = "Die Ressourcen-Instanz der Interaktion"
  * search 0..0
  * request 1.. MS
    * ^short = "HTTP-Request innerhalb der Transaktion"
    * method MS
      * ^short = "HTTP-Verb"
    * url MS
      * ^short = "Request-URL"
  * response 0..0

Instance: ExampleISiKMedikationTransaction
InstanceOf: ISiKMedikationTransaction
Usage: #example
* type = #transaction
* entry[0]
  * fullUrl = "http://my.source.server.local/fhir/MedicationStatement/ExampleISiKMedikationsInformation1"
  * resource = ExampleISiKMedikationsInformation1
  * request
    * method = #POST
    * url = "http://my.target.fhir.server.local/MedicationStatement"
* entry[+]
  * fullUrl = "http://my.source.server.local/fhir/Medication/ExampleISiKMedikament1"
  * resource = ExampleISiKMedikament1
  * request
    * method = #POST
    * url = "http://my.target.fhir.server.local/Medication"
