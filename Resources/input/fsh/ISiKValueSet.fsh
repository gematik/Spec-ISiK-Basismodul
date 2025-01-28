Profile: ISiKValueSet
Parent: ValueSet
Id: ISiKValueSet
Description: "Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes 
für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien.
### Motivation

ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen.
Mittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können.
### Kompatibilität

Für das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."
* insert Meta
* url 1.. MS
  * ^comment = "**Bedeutung:** Eindeutige Url zur Identifizierung des ValueSets. Absolute Urls sind zu bevorzugen.

**Hinweise:** OIDs SOLLTEN als weitere Identifier des CodeSystems verwendet werden. In jedem Fall SOLLTE eine Canonical Url vergeben werden."
* version 1.. MS
  * ^comment = "
**Bedeutung:** Version des ValueSets

**Hinweise:** Jede Änderung des dazugehörigen CodeSystems MUSS eine Änderung in der Version des CodeSystems und ValueSets nach sich ziehen."
* name 1.. MS
  * ^comment = "**Bedeutung:** Maschinenlesbarer Name des ValueSets

**Hinweise:** Der Constraint [vsd-0](https://www.hl7.org/fhir/R4/valueset.html#invs) ist hierbei zu beachten."
* status MS
  * ^short = "Status"
  * ^comment = "Zeigt den aktuellen Status der Ressource an.     
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch 'active' und 'retired''.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."

* useContext 1.. MS
  * ^comment = "**Bedeutung:** Angabe für welches Datenelement das ValueSet relevant ist

**Hinweise:** Es muss mindestens ein useContext angegeben werden, in dem der Ressourcen-Typ kodiert wird, in dem das ValueSet in einem Element zur Verwendung kommt."
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
  * ^comment = "Der Code 'focus' MUSS angegeben werden, um zu kennzeichnen, dass die UsageContext-Angabe sich auf die durch das ValueSet zu kodierenden Konzepte bezieht."
* useContext.value[x] only CodeableConcept
* useContext.value[x] from ResourceType (required)
* useContext.value[x] ^binding.description = "One of the resource types defined as part of this version of FHIR."
  * ^comment = "Angabe in welchem Ressourcen-Typ das ValueSet verwendet wird."
* expansion 1.. MS
  * ^comment = "**Bedeutung:** Angabe der Konzepte aus denen sich das ValueSet zusammensetzt.

**Hinweise:** Mindestens MUSS ein Code und ein Anzeigetext spezifiziert werden."
* expansion.timestamp MS
  * ^comment = "Angabe zu welchem Zeitpunkt die Expansion generiert wurden ist."
* expansion.contains 1.. MS
  * ^comment = "Enthält die Liste der Konzepte, die in der Expansion enthalten sind."
* expansion.contains.system 1.. MS
  * ^comment = "Gibt das Codingsystem an, aus dem das Konzept stammt."
* expansion.contains.version 1.. MS
  * ^comment = "Spezifiziert die Version des Codingsystems, die verwendet wurde."
* expansion.contains.code 1.. MS
  * ^comment = "Der spezifische Code des Konzepts im definierten Codingsystem."
* expansion.contains.display 1.. MS
  * ^comment = "Die menschlich lesbare Darstellung des Konzepts."

Instance: ISiKValueSetExample
InstanceOf: ISiKValueSet
Usage: #example
* url = "http://example.org/fhir/ValueSet/TestValueSet"
* version = "2.0.2"
* name = "TestValueSet"
* status = #active
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.valueCodeableConcept = http://hl7.org/fhir/resource-types#Encounter
* expansion.timestamp = "2022-03-30"
* expansion.contains.system = "http://example.org/fhir/CodeSystem/TestKatalog"
* expansion.contains.version = "1.0.0"
* expansion.contains.code = #test
* expansion.contains.display = "Test"