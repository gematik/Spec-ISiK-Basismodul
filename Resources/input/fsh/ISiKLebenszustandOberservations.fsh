Profile: ISiKLebensZustand
Parent: Observation
Id: ISiKLebensZustand
Title: "ISiKLebensZustand"
Description: "Basisprofil für ISiKLebensZustand Observation 

### Motivation

Viele medizinischen Entscheidungen benötigen Informationen zu den Lebensumständen eines Patienten. Hierzu gehören eine aktuelle Schwangerschaft, Raucherstatus sowie der Alkoholabususstatus.
Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).

In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert.

Dieses Profil ist eine generische, ISiK-spezifische Observation für die Abbildung von Lebenszuständen}}.  
Die folgenden Profile vom Typ `Observation` sind spezifische Profile im oben genannten Sinn:  
* {{pagelink:Schwangerschaftsstatus-Profil-Profil}}
* {{pagelink:ErwarteterEntbindungstermin-Profil}}
* {{pagelink:StillstatusBeispiel-Profil}} 
* {{pagelink:AlkoholAbusus-Profil}} 
* {{pagelink:RaucherStatus-Profil}} 

### Kompatibilität

Für Schwangerschaftsstatus & Erwarteter Geburtstermin wird eine Kompatibilität mit folgenden **IPS** Profilen angestrebt:
* [IPS Resource Profile: Observation - Pregnancy: EDD](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html). 
* [IPS Resource Profile: Observation - Pregnancy: status](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html)

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta

* status MS
  * ^short = "Status"
  * ^comment = "Bedeutung: Der Status MUSS insbesondere zur Differenzierung von abgeschlossenen, 
  vorläufigen oder korrigierten Beobachtungen angegeben werden.   
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch 'final'.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."
* category MS
  * ^short = "Kategorie"
  * ^comment = "Bedeutung: Kategorie-Code, der die Untersuchung kategorisiert."
* code MS
  * ^short = "Code"
  * ^comment = "Bedeutung: Code, der die Untersuchung repräsentiert und kodiert."
  * coding 1.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains
      snomed-ct 0..* MS and
      loinc 1..* MS
    * ^comment = "Motivation: Jede Lebenszustanduntersuchung MUSS einen LOINC Code enthalten, SnomedCT ist optional"
  * coding[snomed-ct] only ISiKSnomedCTCoding
  * coding[loinc] only ISiKLoincCoding
* subject 1.. MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation 
    zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * ^comment = "Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* effective[x] 1..1 MS
  * ^short = "Zeitpunkt/-raum der Beobachtung"
  * ^comment = "Bedeutung: Klinisch relevanter Zeitpunkt/Zeitspanne für die Observation."
* effective[x] only dateTime or Period
* value[x] 1.. MS
  * ^short = "Wert der Beobachtung"
  * ^comment = "Bedeutung: Erfasster Wert der Observation."
//folgende Elemente hatten bislang kein MS-Flag, aber  im IG gab es  Anmerkungen dazu:   
* component
  //TODO:  * ^short = ""
  * ^comment = "Bedeutung: Bei Vitalparametern, die aus mehreren Einzelnen Messpunkten bestehen (Blutdruck, EKG, GCS), werden die gemessenen Einzelwerte jeweils mit einem separaten LOINC-Code in Observation.component.code versehen und der entsprechende Messwert in Observation.component.value erfasst." 
* hasMember
  //TODO:  * ^short = ""
  * ^comment = "Bedeutung: Weitere Observation, die mit dieser Observation gemeinsam zu betrachten ist." 



Profile: ISiKSchwangerschaftsstatus
Parent: ISiKLebensZustand
Id: ISiKSchwangerschaftsstatus
Title: "ISiK Schwangerschaftsstatus"
Description: "Schwangerschaftsstatus einer Patientin"
* insert Meta
* code = $loinc#82810-3
* valueCodeableConcept 1.. MS
  * ^comment = "Motivation: Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)"
* valueCodeableConcept from SchwangerschaftsstatusVS
* hasMember only Reference(ISiKSchwangerschaftErwarteterEntbindungstermin)
* hasMember 0..1 MS
* hasMember ^short = "Erwartetes Geburtsdatum"
* hasMember ^definition = "Eine Referenz auf die ErwartetesGeburtsdatum Observation"
* hasMember.reference 1.. MS

Instance: ISiKSchwangerschaftsstatusBeispiel
InstanceOf: ISiKSchwangerschaftsstatus
Usage: #example
Title: "ISiKSchwangerschaftsstatusBeispiel"
* code = $loinc#82810-3 "Pregnancy status"
  * coding.version = "2.77"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = $loinc#LA15173-0 "Pregnant"
  * coding.version = "2.77"
* hasMember = Reference(ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel)
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKSchwangerschaftErwarteterEntbindungstermin
Parent: ISiKLebensZustand
Id: ISiKSchwangerschaftErwarteterEntbindungstermin
Title: "ISiK Schwangerschaft - Erwarteter Entbindungstermin"
* insert Meta
* code from SchwangerschaftEtMethodeVS
* value[x] only dateTime
* valueDateTime 1.. MS
  * ^comment = "Motivation: Eine Observation MUSS immer einen Wert enthalten"

Instance: ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel
InstanceOf: ISiKSchwangerschaftErwarteterEntbindungstermin
Usage: #example
Title: "ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel"
* code.coding[loinc] = $loinc#11779-6 "Delivery date Estimated from last menstrual period"
  * version = "2.77"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueDateTime = "2024-08-01"
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKAlkoholAbusus
Parent: ISiKLebensZustand
Id: ISiKAlkoholAbusus
Title: "ISiK Alkohol Abusus"
* insert Meta
* category = $observation-category#social-history
* code.coding[snomed-ct] = $sct#15167005
* code.coding[loinc] = $loinc#74043-1
* value[x] only CodeableConcept
* valueCodeableConcept 1.. MS
* valueCodeableConcept from YesNoUnknownNotAsked

Instance: ISiKAlkoholAbususBeispiel
InstanceOf: ISiKAlkoholAbusus
Usage: #example
Title: "ISiKAlkoholAbususBeispiel"
* code.coding[snomed-ct] = $sct#15167005 "Schädlicher Gebrauch von Alkohol"
  * version = "http://snomed.info/sct/11000274103/version/20231115"
* code.coding[loinc] = $loinc#74043-1 "Alcohol use disorder"
  * version = "2.77"  
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = ExpandedYesNoIndicator#Y "Yes"
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKRaucherStatus
Parent: ISiKLebensZustand
Id: ISiKRaucherStatus
Title: "ISiK Raucherstatus"
* insert Meta
* category = $observation-category#social-history
* code.coding[snomed-ct] = $sct#77176002
* code.coding[loinc] = $loinc#72166-2
* value[x] only CodeableConcept
* valueCodeableConcept 1.. MS
* valueCodeableConcept from CurrentSmokingStatusUvIps
  

Instance: ISiKRaucherStatusBeispiel
InstanceOf: ISiKRaucherStatus
Usage: #example
Title: "ISiKRaucherStatusBeispiel"
* code.coding[snomed-ct] = $sct#77176002 "Smoker"
  * version = "http://snomed.info/sct/11000274103/version/20231115"
* code.coding[loinc] = $loinc#72166-2 "Tobacco smoking status"
  * version = "2.77"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = LOINC#LA15920-4 "Former smoker"
  * coding.version = "2.77"
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKStillstatus
Parent: ISiKLebensZustand
Id: ISiKStillstatus
Title: "ISiKStillstatus"
Description: "Profil zur Abbildung ob gestillt/Muttermilch abgepumpt und gefüttert wird"
* insert Meta
* code.coding[snomed-ct] = $sct#413712001
* code.coding[loinc] = $loinc#63895-7
* value[x] only CodeableConcept
* valueCodeableConcept 1.. MS
* valueCodeableConcept from StillstatusVS

Instance: ISiKStillstatusBeispiel
InstanceOf: ISiKStillstatus
Usage: #example
Title: "ISiKStillstatusBeispiel"
Description: "ISiKStillstatusBeispiel"
* code.coding[snomed-ct] = $sct#413712001 "Breastfeeding (mother)"
  * version = "http://snomed.info/sct/11000274103/version/20231115"
* code.coding[loinc] = $loinc#63895-7 "Breastfeeding status"
  * version = "2.77" 
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = $loinc#LA29252-6 "Currently breastfeeding"
* encounter = Reference(Fachabteilungskontakt)