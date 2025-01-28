Instance: ISiKAkteurMinimaleStammdatenVerwaltungOptionPatientMerge
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKAkteurMinimaleStammdatenVerwaltungOptionPatientMerge"
* name = "ISiKAkteurMinimaleStammdatenVerwaltungOptionPatientMerge"
* title = "Option &quot;OptionPatientMerge&quot; für Akteur &quot;Minimale Stammdaten-Verwaltung&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* imports = Canonical(ISiKAkteurMinimaleStammdatenVerwaltung)

* description = 
  "Dieses CapabilityStatement beschreibt alle *zusätzlichen* Interaktionen, 
  die ein System unterstützen MUSS, das den Akteur &quot;Minimale Stammdaten-Verwaltung&quot; mit der Option &quot;Patient Merge&quot; implementiert.   

  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.
Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. 
Der `MODE`-Parameter kann ignoriert werden.  
Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). 
Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, 
wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.  

Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen 
und die Versionsnummer angeben. 
Darüber hinaus MUSS in `CapabilityStatement.instantiates` die Canonical URL des nachfolgenden CapabilityStatements angegeben werden.  

Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement mit `SHALL` gekennzeichnet sind. 
Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, 
sofern diese in der Instanz implementiert wurden.  

Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich."



* rest
  * mode = #server

//TopicBased Subscription Backport (https://hl7.org/fhir/uv/subscriptions-backport/)
* rest
  * resource[+]
    * insert Expectation(#SHALL)
    * type = #Subscription
    * supportedProfile = Canonical(PatientMergeSubscription)
      * insert Expectation(#SHALL)
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #create
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #update
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #delete

    * extension[+]
      * url = Canonical(CapabilityStatementSubscriptionTopic)
      * valueCanonical = $patient-merge-topic 
    * operation[+]
      * name = "$get-ws-binding-token"
      * insert Expectation(#SHALL)  
      * definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-get-ws-binding-token"
