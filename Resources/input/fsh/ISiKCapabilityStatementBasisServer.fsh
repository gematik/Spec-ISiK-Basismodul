Instance: ISiKCapabilityStatementBasisServer
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* name = "ISiKCapabilityStatementBasisServer"
* title = "ISiK CapabilityStatement Basis Server"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* description = 
  "Dieses CapabilityStatement beschreibt alle Interaktionen 
  die ein ISiK-konformes System unterstützen MUSS bzw. KANN,
  um das Bestätigungsverfahren für dieses Modul zu bestehen.   

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
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * resource[+]
    * type = #Patient
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?identifier=http://fhir.krankenhaus.example|1032702`    
        `GET [base]/Patient?identifier=1032702`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."    

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "family"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?family=Musterfrau`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."  

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "given"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?given=Erika`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "birthdate"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?birthdate=1964-12-08`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date)." 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "gender"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?birthdate=1964-12-08`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 

    * searchParam[+]
      * insert Expectation (#MAY)
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
      * insert Expectation (#MAY)
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
      * insert Expectation (#MAY)
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
      * insert Expectation (#MAY)
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
      * insert Expectation (#MAY)
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
      * insert Expectation (#MAY)
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
      * insert Expectation (#MAY)
      * name = "telecom"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-telecom"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?telecom=phone|+49152236898`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend." 

    * searchRevInclude[+] = "Composition:patient"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Composition:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Composition:author"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Condition:patient"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Condition:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Procedure:patient"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Procedure:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Encounter:patient"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Encounter:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Coverage:beneficiary"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Coverage:subscriber"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Coverage:patient"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Coverage:payor"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Account:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Account:patient"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "AllergyIntolerance:patient"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Observation:patient"
      * insert Expectation (#MAY)

  * resource[+]
    * type = #Encounter
    * insert Expectation (#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    * interaction[+]
      * code = #read
      * insert Expectation (#SHALL)
    * interaction[+]
      * code = #search-type
      * insert Expectation (#SHALL)

    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?identifier=http://test.krankenhaus.de/fhir/sid/fallnr|123456`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?status=finished`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "class"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-class"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?class=IMP`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?type=http://fhir.de/CodeSystem/kontaktart-de|stationaer`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  
        Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend."
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "subject"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-subject"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?subject=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "account"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-account"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?account=Account/123`    
        `GET [base]/Encounter?account:identifier=123456`    
        `GET [base]/Encounter?account:identifier=https://example.org/fhir/sid/abrechnungsfallnr|123456`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?date=lt2020-26-10`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  
        Bei der Formulierung der Suche sollten die Vorgaben aus der Definition der 
        [Such-Prefixe](https://hl7.org/fhir/R4/search.html#prefix)
        - und hier insbesondere die Unterschiede zwischen `lt` und `eb` bzw. `gt` und `sa` - beachtet werden."
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date-start"
      * definition = "https://gematik.de/fhir/isik/SearchParameter/Encounter-date-start"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?end-date=lt2020-26-10`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  
        Bei diesem Suchparameter handelt es sich um eine Präadoption 
        [eines Suchparameters, der in FHIR R5 hinzugefügt wurde](https://hl7.org/fhir/R5/SearchParameter/Encounter-date-start). "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "end-date"
      * definition = "https://gematik.de/fhir/isik/SearchParameter/Encounter-end-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?end-date=lt2020-26-10`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  
        Bei diesem Suchparameter handelt es sich um eine Präadoption 
        [eines Suchparameters, der in FHIR R5 hinzugefügt wurde](https://hl7.org/fhir/R5/SearchParameter/Encounter-end-date). "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "location"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-location"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?location=Location/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "service-provider"
      * definition = "http://hl7.org/fhir/SearchParameter/Encounter-service-provider"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Encounter?service-provider=Organization/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

    * searchInclude[+] = "Encounter:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Encounter:subject"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Encounter:part-of"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Encounter:diagnosis"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Encounter:account"
      * insert Expectation(#MAY)
    * searchRevInclude = "Encounter:part-of"
      * insert Expectation(#MAY)
    * searchRevInclude[+] = "Condition:encounter"
      * insert Expectation(#MAY)
    * searchRevInclude[+] = "Composition:encounter"
      * insert Expectation(#MAY)
    * searchRevInclude[+] = "Procedure:encounter"
      * insert Expectation(#MAY)

  * resource[+]
    * type = #Account
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"    
    * interaction[+]
      * code = #read
      * insert Expectation(#SHALL)
    * interaction[+]
      * code = #search-type
      * insert Expectation(#SHALL)

    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?identifier=http://test.krankenhaus.de/fhir/sid/fallnr|123456`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Account-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|AMB`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Account?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

  * resource[+]
    * type = #Condition
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "clinical-status"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-clinical-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?clincial-status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  
        Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend."
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "subject"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-subject"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?subject=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?encounter=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "recorded-date"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-recorded-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?recorded-date=2015-01-01`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "related"
      * definition = "http://fhir.de/SearchParameter/Condition-related"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?related=Condition/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference) 
        und [Deutsche Basisprofile R4 - Doppel-/Mehrfachkodierte ICD-Codes](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-DiagnosenCondition.html)."
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Condition?category=http://hl7.org/fhir/ValueSet/condition-category|problem-list-item`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  
        Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend."

    * searchInclude[+] = "Condition:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Condition:subject"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Condition:encounter"
      * insert Expectation(#SHALL)
    * searchRevInclude[+] = "Encounter:diagnosis"
      * insert Expectation(#MAY)

  * resource[+]
    * type = #Procedure
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Procedure-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?status=http://hl7.org/fhir/event-status|entered-in-error`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/Procedure-category"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?category=http://snomed.info/sct|387713003`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "code"
      * definition = "http://hl7.org/fhir/SearchParameter/Procedure-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?code=http://fhir.de/CodeSystem/bfarm/ops|5-470`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "subject"
      * definition = "http://hl7.org/fhir/SearchParameter/Procedure-subject"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?subject=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?encounter=Encounter/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Procedure?date=lt2020-26-10`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchInclude = "Procedure:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Procedure:subject"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Procedure:encounter"
      * insert Expectation(#SHALL)
    * searchRevInclude = "Encounter:diagnosis"
      * insert Expectation(#MAY)


  * resource[+]
    * type = #Coverage
    * insert Expectation(#SHALL)
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisGesetzlich"
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKVersicherungsverhaeltnisSelbstzahler"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?type=http://fhir.de/CodeSystem/versicherungsart-de-basis|GKV`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "beneficiary"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-beneficiary"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?beneficiary=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "payor"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-payor"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?payor:identifier=0123456789`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "subscriber"
      * definition = "http://hl7.org/fhir/SearchParameter/Coverage-subscriber"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Coverage?subscriber=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

    * searchInclude[+] = "Coverage:subscriber"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Coverage:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Coverage:payor"
      * insert Expectation(#MAY)
    * searchInclude[+] = "Coverage:beneficiary"
      * insert Expectation(#MAY)

  * resource[+]
    * type = #RelatedPerson
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAngehoeriger"
    * interaction[+]
      * code = #read
      * insert Expectation(#SHALL)
    * interaction[+]
      * code = #search-type
      * insert Expectation(#SHALL)
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/RelatedPerson-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/RelatedPerson-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?name=Heidi`  
        `GET [base]/RelatedPerson?name=Alpenzauber`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address-city"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-city"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address-city=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address-country"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-country"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address-country=DE`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address-postalcode"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/RelatedPerson?address-postalcode=10117`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchInclude[+] = "RelatedPerson:patient"
      * insert Expectation(#SHALL)
    * searchRevInclude = "Coverage:subscriber"
      * insert Expectation(#MAY)
    * searchRevInclude[+] = "Coverage:payor"
      * insert Expectation(#MAY)


  * resource[+]
    * type = #Practitioner
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKPersonImGesundheitsberuf"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?identifier=42`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "family"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?family=Alpenzauber`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "given"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?given=Heidi`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/Practitioner-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?name=Heidi`
        `GET [base]/Practitioner?name=Alpenzauber`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "        
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "gender"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Practitioner?gender=female`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "

  * resource[+]
    * type = #CodeSystem
    * insert Expectation(#MAY)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem"
    * interaction[+]
      * code = #read
      * insert Expectation(#MAY)
    * interaction[+]
      * code = #search-type
      * insert Expectation(#MAY)
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "url"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-url"
      * type = #uri
      * documentation = 
        "**Beispiel:**    
        `GET [base]/CodeSystem?url=http://example.org/fhir/CodeSystem/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "

  * resource[+]
    * type = #ValueSet
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type   
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "url"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-url"
      * type = #uri
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?url=http://example.org/fhir/ValueSet/test`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?name=TestValueSet`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?status=active`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "version"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-version"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?version=1.0.0`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "context-type-value"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-context-type-value"
      * type = #composite
      * documentation = 
        "**Beispiel:**    
        `GET [base]/ValueSet?context-type-value=http://terminology.hl7.org/CodeSystem/usage-context-type|focus$http://hl7.org/fhir/resource-types|Encounter`    
        **Anwendungshinweis:**  
        Mit dieser Abfrage können hausinterne Kataloge anhand des Ressource-Typs ermittelt werden. Diese Informationen sind u.a. relevant im Kontext von:  
        * Hausinternen Prozeduren/Diagnosen-Codes
        * Kodierung von Encounter-Informationen (z.B. Wahlleistungen, Orttypen)  
        Use Cases im Zusammenhang:    
        (A) Zur Konfigurationszeit können passende ValueSets von einem Server spezifisch für einen Ressourcentyp abgerufen und vorbereitend auf eine Systemintegration begutachtet 
        bzw. in Client-Systeme eingebunden werden. In diesem Sinne wird die Abfrage im Kontext der [Terminvereinbarung durch einen Termin-Requestor](https://simplifier.net/guide/isik-terminplanung-v4/ImplementationGuide-markdown-Datenobjekte-Operations?version=current) genutzt.  
        (B) Zur Laufzeit können spezifische ValueSets synchronisiert bzw. direkt in die Eingabemasken von Clients eingebunden werden.  
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#composite).  "


  * resource[+]
    * type = #Composition
    * insert Expectation(#MAY)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtSubSysteme"

  * resource[+]
    * type = #Bundle
    * insert Expectation(#MAY)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"

  * resource[+]
    * type = #Observation
    * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKLebensZustand)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKSchwangerschaftsstatus)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKSchwangerschaftErwarteterEntbindungstermin)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKAlkoholAbusus)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKRaucherStatus)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKStillstatus)
      * insert Expectation(#SHALL)

    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type   

    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?status=http://hl7.org/fhir/observation-status|final`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|social-history`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "code"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?code=http://loinc.org|82810-3`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "subject"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-subject"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?subject=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?date=ge2013-01-14&date=le2021-12-31`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "combo-code"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?combo-code=85354-9`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "combo-code-value-quantity"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code-value-quantity"
      * type = #composite
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?combo-code-value-quantity=http://loinc.org|8480-6$120|http://unitsofmeasure.org|mm[Hg]`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#composite).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "component-code"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-component-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?component-code=http://loinc.org|85354-9`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?encounter=Encounter/234`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchInclude[+] = "Observation:encounter"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Observation:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Observation:subject"
      * insert Expectation(#MAY)


// Standort (Location)

  * resource[+]
    * type = #Location
    * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKStandort)
      * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKStandortRaum)
      * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKStandortBettenstellplatz)
      * insert Expectation(#MAY)

    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #read
      * documentation = "Sofern die Ressourcen zum Standort unterstützt werden, SOLL die REST-Interaktion `read` implementiert werden."
    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #search-type   
      * documentation = "Sofern die Ressourcen zum Standort unterstützt werden, SOLL die REST-Interaktion `search` implementiert werden."
    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #update
      * documentation = "Sofern die Ressourcen zum Standort unterstützt werden, `update` implementiert werden. 
      Diese dient insbesondere dem Synchronisieren des Status (`Location.operationalStatus`) der abgeleiteten 
      Ressourcen ISiKStandortRaum und ISiKStandortBettenstellplatz - u.a. zur Kennzeichnung als 
      'Frei', 'Besetzt', 'Kontaminiert', 'Isoliert', in 'Reinigung' etc."        

    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?identifier=http://fhir.krankenhaus.example|260120196`  
        `GET [base]/Location?identifier=345678975`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "operational-status"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-operational-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?operational-status=Unoccupied`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "organization"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-organization"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Location?organization=AbteilungAllgemeinchirurgieOrganisationBeispiel`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

//Warum ist "characteristic" ein Suchparameter!? Das Element gibt es nicht mal in der Ressourcen-Definition!!
/*     * searchParam[+]
      * insert Expectation(#MAY)
      * name = "characteristic"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-characteristic"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?component-code=http://loinc.org|85354-9`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " */

    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-type"
      * type = #token
      * documentation = 
        "**Beispiel zur Suche nach Typ eines Standorts:**    
        `GET [base]/Location?type=bed`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "partof"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-partof"
      * type = #reference
      * documentation = 
        "**Beispiel zur Suche nach Standort-Zugehörigkeit eines Raums (Zu welcher Abteilung gehört dieser Raum?):**    
        `[base]/Location?partof=RaumStandortBeispiel`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "contains"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-contains"
      * type = #reference
      * documentation = 
        "**Beispiel zur Suche nach Standort-Zugehörigkeit eines Raums:**    
        `GET [base]/Location?contains=KoordinatenBeispielGeoJSON`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "near"
      * definition = "http://hl7.org/fhir/SearchParameter/Location-near"
      * type = #special
      * documentation = 
        "**Beispiel zur Suche nach Standort nahe (100m) Koordinaten:**    
        `GET [base]/Location?contains=52.525851|13.37774|100|m`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#special).  "



//Organisation

  * resource[+]
    * type = #Organization
    * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKOrganisation)
      * insert Expectation(#MAY)
    * supportedProfile[+] = Canonical(ISiKOrganisationFachabteilung)
      * insert Expectation(#MAY)

    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #read
      * documentation = "Sofern die Ressource `Organization` unterstützt wird, SOLL die REST-Interaktion `read` implementiert werden."
    * interaction[+]
      * insert Expectation(#SHOULD)
      * code = #search-type   
      * documentation = "Sofern die Ressource `Organization` unterstützt wird, SOLL die REST-Interaktion `search` implementiert werden."
    

    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?identifier=http://fhir.de/sid/arge-ik/iknr|260120196` 
        `GET [base]/Organization?identifier=http://fhir.de/StructureDefinition/identifier-bsnr|345678975` 
        `GET [base]/Organization?identifier=345678975`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "active"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?active=true` 
        `GET [base]/Organization?active=false`    
        **Anwendungshinweis:**   
        Insbesondere für die Suche nach Daten historischer Organisationsstrukturen - z.B. nach Schließung, Zusammenlegung von Fachabteilungen etc. - 
        erscheint es erforderlich nach Ressourcen nicht aktiver Organisationseinheiten suchen zu können.
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-type"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?type=dept`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?name=FA-Gynäkologie`  
        `GET [base]/Organization?name=GYN`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?address=Berlin`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "partof"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-partof"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?partof:identifier=260120196`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "endpoint"
      * definition = "http://hl7.org/fhir/SearchParameter/Organization-endpoint"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Organization?endpoint:identifier=123456`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "

//AllergyIntolerance
  * resource[+]
    * insert Expectation(#SHALL)
    * type = #AllergyIntolerance
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit"
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "clinical-status"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-clinical-status"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?clinical-status=active`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?patient=Patient/123`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "asserter"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-asserter"
      * type = #reference
      * documentation = 
          "**Beispiel:**    
          `ToDo`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " */
  
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "recorder"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-recorder"
      * type = #reference
      * documentation = 
          "**Beispiel:**    
          `ToDo`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " */
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "onset"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-onset"
      * type = #date
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?onset=2015-01-01T12:00:23Z+02:00`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-date"
      * type = #date
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?date=2015-01-01T12:00:23Z+02:00`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-category"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?category=environment`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "criticality"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-criticality"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?type=dept`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " */
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?type=allergy`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "verification-status"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-verification-status"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?type=dept`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " */
    * searchInclude[+] = "AllergyIntolerance:patient"
      * insert Expectation(#SHALL)    
    * searchInclude[+] = "AllergyIntolerance:encounter"
      * insert Expectation(#SHALL)    
    * searchInclude[+] = "AllergyIntolerance:recorder"
      * insert Expectation(#MAY)    
    * searchInclude[+] = "AllergyIntolerance:asserter"
      * insert Expectation(#MAY) 
        

//TopicBased Subscription Backport (https://hl7.org/fhir/uv/subscriptions-backport/)
* rest
  * resource[+]
    * insert Expectation(#MAY)
    * type = #Subscription
    * supportedProfile = Canonical(PatientMergeSubscription)
      * insert Expectation(#MAY)
    * interaction[+]
      * insert Expectation(#MAY)
      * code = #read
    * interaction[+]
      * insert Expectation(#MAY)
      * code = #create
    * interaction[+]
      * insert Expectation(#MAY)
      * code = #update
    * interaction[+]
      * insert Expectation(#MAY)
      * code = #delete

    * extension[+]
      * url = Canonical(CapabilityStatementSubscriptionTopic)
      * valueCanonical = $patient-merge-topic 
    * operation[+]
      * name = "$get-ws-binding-token"
      * insert Expectation(#MAY)  
      * definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-get-ws-binding-token"


* document
  * insert Expectation(#SHALL)  
  * mode = #consumer
  * profile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
  * documentation = "Endpunkt zur Entgegennahme von Subsystem-Berichten in Form eines ISiKBerichtBundles. Weitere Hinweise siehe {{pagelink:BerichtSubsystem}}"
