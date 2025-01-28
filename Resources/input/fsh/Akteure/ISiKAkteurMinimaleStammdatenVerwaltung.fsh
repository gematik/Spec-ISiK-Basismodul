Instance: ISiKAkteurMinimaleStammdatenVerwaltung
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKAkteurMinimaleStammdatenVerwaltung"
* name = "ISiKAkteurMinimaleStammdatenVerwaltung"
* title = "CapabilityStatement für Akteur &quot;Minimale Stammdaten-Verwaltung&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"

* description = 
  "Dieses CapabilityStatement beschreibt alle Interaktionen, 
  die ein System unterstützen MUSS, das den Akteur &quot;Minimale Stammdaten-Verwaltung&quot; implementiert.   

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
    * searchInclude[+] = "Encounter:patient"
      * insert Expectation(#SHALL) 

    