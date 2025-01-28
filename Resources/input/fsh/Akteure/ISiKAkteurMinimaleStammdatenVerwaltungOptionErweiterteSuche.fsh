Instance: ISiKAkteurMinimaleStammdatenVerwaltungOptionErweiterteSuche
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKAkteurMinimaleStammdatenVerwaltungOptionErweiterteSuche"
* name = "ISiKAkteurMinimaleStammdatenVerwaltungOptionErweiterteSuche"
* title = "Option &quot;Erweiterte Suche&quot; für Akteur &quot;Minimale Stammdaten-Verwaltung&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* imports = Canonical(ISiKAkteurMinimaleStammdatenVerwaltung)

* description = 
  "Dieses CapabilityStatement beschreibt alle *zusätzlichen* Interaktionen, 
  die ein System unterstützen MUSS, das den Akteur &quot;Minimale Stammdaten-Verwaltung&quot; mit der Option &quot;Erweiterte Suche&quot; implementiert.   

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
  * resource[+]
    * type = #Patient
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/Patient-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?name=Erika`    
        `GET [base]/Patient?name=Erika`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  " 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."  

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "address-city"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-city"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?address-city=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "address-country"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-country"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?address-country=DE`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "address-postalcode"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?address-postalcode=10117`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "active"
      * definition = "http://hl7.org/fhir/SearchParameter/Patient-active"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?active=true`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "telecom"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-telecom"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?telecom=phone|+49152236898`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Encounter:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Encounter:subject"
      * insert Expectation (#SHALL)

  * resource[+]
    * type = #Encounter
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    * interaction[+]
      * code = #search-type
      * insert Expectation (#SHALL)
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "location"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-location"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?location=Location/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "service-provider"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-service-provider"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?service-provider=Organization/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

    * searchInclude[+] = "Encounter:subject"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Encounter:part-of"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Encounter:diagnosis"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Encounter:account"
      * insert Expectation(#SHALL)
    * searchRevInclude = "Encounter:part-of"
      * insert Expectation(#SHALL)

  