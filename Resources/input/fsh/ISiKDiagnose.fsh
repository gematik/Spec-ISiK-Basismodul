Profile: ISiKDiagnose
Parent: Condition
Id: ISiKDiagnose
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen 
über die Diagnosen eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.  
### Motivation
Die Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, 
ob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.  

In FHIR werden Diagnosen mit der Condition-Ressource repräsentiert.  

Da die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. 
Falls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), 
ist alternativ eine Repräsentation als Freitext-Diagnose möglich.

### Kompatibilität
Für das Profil ISiKDiagnose wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKDiagnose valide sind, auch valide sind gegen:
* das [Profil ProfileConditionDiagnose der Medizininformatik-Initative](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* das [Profil KBV_PR_Base_Condition_Diagnosis der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis)]  
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* obeys isik-con1
* extension MS
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains $condition-related named related 0..1 MS
* extension[related]
  * ^short = "Verknüpfte Diagnose"
  * ^comment = " Die Deutschen Kodierrichtlinien und die 'German Modification' ermöglichen es teilweise, 
  ICD-10-Codierte Diagnosen miteinander zu verknüpfen (&quot;Kreuz-Stern-Ausrufezeichen-Notation&quot;), 
  diese aber dennoch wie eigenständige Diagnosen (mit jeweils eigener Diagnosesicherheit oder -Lokalisation) zu kommunizieren.
  Daher ist es in Deutschland nicht möglich, dem internationalen Usus zu folgen und verknüpfte Diagnosen als postkoordinierten Code *einer* Condition-Ressource aufzufassen.
  Statt dessen müssen sie zwei eigenständige Condition-Ressourcen abgebildet werden, die mit Hilfe der `related`-Extension miteinander verknüpft werden.  
  Die Sekundärdiagnose verweist jeweils auf die Primärdiagnose."
* clinicalStatus MS
  * ^short = "klinischer Status"
  * ^comment = "**Begründung MS:** Auch in Stufe 4 sind keine (client-seitigen) schreibenden Operationen für das Erstellen einer Condition-Ressource vorgesehen 
  (siehe CapabilityStatement). Das heißt, entweder führen KISe entsprechende Informationen und exponieren diese, 
  oder es gibt keinen pragmatischen Mechanismus (im ISIK-Kontext), um den Use Case einer zusätzlichen Annotation mittels Client zu erfüllen. 
  Da alle KIS-Hersteller, die sich zu Wort gemeldet haben, eine Befüllung von Condition.clinicalStatus NICHT unterstützen, 
  erscheint das MS nach übergreifender Definition und ein verpflichtender Testfall nicht angemessen.  
  **Einschränkung der übergreifenden MS-Definition:** Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur 
  zur Hinterlegung des Status einer Diagnose, so MUSS dieses System die Information NICHT abbilden. 
  Das System MUSS jedoch `clinicalStatus` befüllen, sofern die entsprechende Information verfügbar ist.  
  **Hinweis:** Für Diagnosen aus der *ambulanten* Versorgung können die Werte für `clinicalStatus` und `verificationStatus` aus dem 
  [ICD-10-Zusatzkennzeichen für die Diagnosesicherheit](https://www.bfarm.de/DE/Kodiersysteme/Services/Kodierfragen/ICD-10-GM/Allgemeine-Kodierfragen/icd-10-gm-1010.html) abgeleitet werden.
  Das entsprechende Mapping kann den [Deutschen Basisprofilen](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-DiagnosenCondition?version=current) entnommen werden."
* code 1.. MS
  * ^short = "Diagnose-Code"
  * ^comment = "Diagnosen SOLLEN mindestens entweder mit einem der angebenen standardisierten Codier-Verfahren codiert werden. 
  Ist keine Codierung möglich, MUSS statt dessen eine textuelle Beschreibung der Prozedur angegeben werden.  
   **Begründung Pflichtfeld:** Ist *weder* eine Codierung *noch* eine textuelle Beschreibung vorhanden, besitzt diese Ressource keine medizinische Aussagefähigkeit."
  * obeys icd-text-1
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      ICD-10-GM 0..1 MS and
      Alpha-ID 0..1 MS and
      SNOMED-CT 0..1 MS and
      Orphanet 0..1 MS
  * coding[ICD-10-GM] only ISiKICD10GMCoding
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
    * extension[Mehrfachcodierungs-Kennzeichen] MS
    * extension[Seitenlokalisation] MS
    * extension[Diagnosesicherheit] MS
  * coding[Alpha-ID] only CodingAlphaID
    * ^patternCoding.system = "http://fhir.de/CodeSystem/alpha-id"
    * system 1.. MS
    * code 1.. MS
  * coding[SNOMED-CT] only ISiKSnomedCTCoding
  * coding[SNOMED-CT] from $diagnosesSCT (required)
    * ^patternCoding.system = $sct
  * coding[Orphanet] ^patternCoding.system = "http://www.orpha.net"
    * system 1.. MS
    * code 1..
* subject MS
  * ^short = "Patientenbezug"
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * ^comment = "Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation 
    zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc."
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * ^comment = "**Begründung Pflichtfeld:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt 
    und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.    
    **WICHTIGER Hinweis für Implementierer:** Die Zuordnung MUSS auf auf einen Encounter der Ebene &quot;Abteilungskontakt&quot; (siehe hierzu {{pagelink:Fall}}) erfolgen. 
    Bei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)&quot;Fallnummer&quot; (hier: `Encounter.account`) 
    unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten.)"
* onset[x] MS 
* onset[x] only dateTime or Age
  * ^short = "Erkrankungsbeginn"
  * ^comment = "Datum oder Alter/Lebensphase des Erkrankungsbeginns
  **Begründung MS:** Die Kenntnis des Erkrankungszeitraumes ist wichtig für die korrekte Einschätzung der medizinischen Relevanz einer Erkraknung.  
  **Einschränkung der übergreifenden MS-Definition:** Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Erkrankungszeitraumes,
  so MUSS dieses System die Information NICHT abbilden. 
  Das System MUSS jedoch klinischen Status (`active`/`inactive`/`resolved`...) der Diagnose korrekt angeben, sofern die Information verfügbar ist."
* onsetAge  
  * extension contains ExtensionLebensphase named Lebensphase-Beginn 0..1
  * extension[Lebensphase-Beginn]
    * ^short = "Lebensphase des Erkrankungsbeginns"
    * ^comment = "Alternative Angabe, wenn genauere Eingrenzungen des Zeitraums nicht möglich sind, insbesondere im Kontext anamnestischer Diagnosen"
* abatement[x] MS 
* abatement[x] only dateTime or Age
  * ^short = "Erkrankungsende"
  * ^comment = "Datum oder Alter/Lebensphase des Erkrankungsendes  
  **Begründung MS:** Die Kenntnis des Erkrankungszeitraumes ist wichtig für die korrekte Einschätzung der medizinischen Relevanz einer Erkraknung.  
  **Einschränkung der übergreifenden MS-Definition:** Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Erkrankungszeitraumes,
  so MUSS dieses System die Information NICHT abbilden. 
  Das System MUSS jedoch klinischen Status (`active`/`inactive`/`resolved`...) der Diagnose korrekt angeben, sofern die Information verfügbar ist."
* abatementAge  
  * extension contains ExtensionLebensphase named Lebensphase-Ende 0..1
  * extension[Lebensphase-Ende]
    * ^short = "Lebensphase des Erkrankungsendes"
    * ^comment = "Alternative Angabe, wenn genauere Eingrenzungen des Zeitraums nicht möglich sind, insbesondere im Kontext anamnestischer Diagnosen"
* recordedDate 1.. MS
  * ^short = "Dokumentationsdatum"
  * ^comment = "Datum, an dem die Diagnose dokumentiert wurde.   
  **Begründung Pflichtfeld:** Das Dokumentationsdatum der Diagnose MUSS zu Qualitätssicherungszwecken angegeben werden. Dies ist das fachliche Dokumentationsdatum, 
  nicht zu verwechseln mit der technischen Anlage des Datensatzes im Primärsystem. Diese beiden Daten können jedoch identisch sein.  
  **Hinweis:** Das Recorded Date MUSS mindestens auf den Monat genau angegeben werden."
* note MS
  * ^short = "Notizen"
  * ^comment = "Ergänzende Hinweise und Anmerkungen zur Diagnose"
* bodySite MS
  * ^comment = "**Begründung MS:** Harmonisierung mit KBV-Profil (KBV_PR_Base_Condition_Diagnosis)"
* bodySite.coding MS
* bodySite.coding ^slicing.discriminator.type = #pattern
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains
    snomed-ct 0..1 MS
* bodySite.coding[snomed-ct] only ISiKSnomedCTCoding

Instance: Example-condition-ausrufezeichen-primaer
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#active
* code.coding.version = "2019"
* code.coding = $icd-10-gm#F16.1 "Psychische Verhaltensstörung durch Halluzinogene (Akute Intoxikation)"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-ausrufezeichen-sekundaer
InstanceOf: ISiKDiagnose
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(Example-condition-ausrufezeichen-primaer)
* clinicalStatus = $condition-clinical#recurrence
* code.coding.extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#!
* code.coding.version = "2019"
* code.coding = $icd-10-gm#U69.32 "Intravenöser Konsum sonstiger psychotroper Substanzen"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-kreuz-stern-primaer
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#recurrence
* code.coding.extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension.valueCoding.version = "2021"
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#†
* code.coding.version = "2019"
* code.coding = $icd-10-gm#E10.30 "Diabetes mellitus"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-kreuz-stern-sekundaer
InstanceOf: ISiKDiagnose
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(Example-condition-kreuz-stern-primaer)
* clinicalStatus = $condition-clinical#active
* code.coding.extension.url = $icd-10-gm-mehrfachcodierungs-kennzeichen-sd
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#*
* code.coding.version = "2019"
* code.coding = $icd-10-gm#H36.0 "Retinopathia diabetica"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"
* bodySite.coding[snomed-ct] = $sct#1290031003 "Structure of left eye proper"
  * version = "http://snomed.info/sct/11000274103/version/20231115"

Instance: MittelgradigeIntelligenzminderung
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#active
* code.coding.version = "2020"
* code.coding = $icd-10-gm#F71 "Mittelgradige Intelligenzminderung"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* onsetDateTime = "2019-09-02"
* recordedDate = "2021-01-01"

Instance: BehandlungsDiagnoseFreitext
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#active
* code.text = "Behandlungsdiagnose"
* subject = Reference(PatientinMusterfrau)
* onsetDateTime = "2019-09-02"
* recordedDate = "2021-01-01"

Invariant: isik-con1
Description: "Falls eine kodierte Diagnose vorliegt muss angegeben werden durch welchen Kontakt diese Dokumentation erfolgte."
Severity: #error
Expression: "code.coding.exists() implies encounter.exists()"

Invariant: icd-text-1
Description: "Entweder MUSS eine kodierte Diagnose vorliegen oder eine textuelle Beschreibung. Stattdessen nur Extensions hinzuzufügen (vgl. https://www.hl7.org/fhir/element.html - ele-1), ist explizit nicht erlaubt."
Severity: #error
Expression: "coding.exists().not() implies text.exists()"