Profile: ISiKMedikationTransactionResponse
Parent: Bundle
Id: ISiKMedikationTransactionResponse
Title: "ISiK Medikation TransactionBundle-Response"
Description: "Dieses Profil definiert die Server-Antwort auf Transaktions-Bundles im Rahmen von ISiK-Medikations-Szenarien."
* insert Meta
* type MS
  * ^short = "Type des Bundles"
  * ^comment = "fix: transaction-response"
  * ^fixedCode = #transaction-response
* entry 1..* MS
  * ^short = "Der einzelne Eintrag zur Interaktion"
  * link 0..0
  * fullUrl MS
    * ^short = "vollständige URL der Ressource"
  * resource MS
    * ^short = "Die Ressourcen-Instanz der Interaktion"
  * search 0..0
  * request 0..0
  * response 1.. MS
    * ^short = "HTTP-Response des Servers innerhalb der Transaktions-Antwort"
    * status MS
      * ^short = "HTTP-Statuscode"
    * location MS
      * ^short = "Location der Ressource (URL) auf dem Server"
      * ^comment = "Gemäß FHIR-Spezifikation MUSS hier der Pfad zur exakten Version (History) enthalten sein, wenn der Server History unterstützt."
    * outcome MS
      * ^short = "OperationOutcome-Ressource zur Rückgabe von Fehler-Details sowie Informationen."

Instance: ExampleISiKMedikationTransactionResponse
InstanceOf: ISiKMedikationTransactionResponse
Usage: #example
* type = #transaction-response
* entry[0]
  * fullUrl = "http://my.target.fhir.server.local/MedicationStatement/ExampleISiKMedikationsInformation1"
  * resource = ExampleISiKMedikationsInformation1
  * response
    * status = "201"
    * location = "http://my.fhir.server.local/MedicationStatement/ExampleISiKMedikationsInformation1"
* entry[+]
  * fullUrl = "http://my.target.fhir.server.local/Medication/ExampleISiKMedikament1"
  * resource = ExampleISiKMedikament1
  * response
    * status = "201"
    * location = "http://my.fhir.server.local/Medication/ExampleISiKMedikament1"
