Profile: ISiKCodeSystem
Parent: CodeSystem
Id: ISiKCodeSystem
Description: "Dieses Profil beschreibt die maschinenlesbare Repräsentation von 
system-sepzifischen Kodierungen in ISiK-Szenarien.  

### Motivation

ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte. 

Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.

Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte [ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html).
Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich.
Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. "
* insert Meta
* url 1.. MS
  * ^short = "Kanonische URL"
  * ^comment = "**Bedeutung:** Eindeutige Url zur Identifizierung des CodeSystems. Absolute Url sind zu bevorzugen.  
    **Hinweise:** OIDs SOLLTEN als weitere Identifier des CodeSystems verwendet werden. In jedem Fall SOLLTE ein Canonical Url vergeben werden."
* version 1.. MS
  * ^short = "Version"
  * ^comment = "**Bedeutung:** Version des CodeSystems  
    **Hinweise:** Jede Änderung des CodeSystems MUSS eine Änderung in der Version des CodeSystems und gebundenen ValueSets nach sich ziehen. Die Versionierung SOLLTE auf Basis von [Semantic Versioning](https://semver.org) basieren."
* name 1.. MS
  * ^short = "Name des Codesystems"
  * ^comment = "**Bedeutung:** Maschinenlesbarer Name des CodeSystems  
    **Hinweise:** Der Constraint [cps-0](https://www.hl7.org/fhir/R4/codesystem.html#invs) ist hierbei zu beachten."
* status MS
  * ^short = "Status"
  * ^comment = "Zeigt den aktuellen Status der Ressource an.     
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch 'active' und 'retired''.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben."
* content MS
  * ^short = "Vollständigkeit der Repräsentation"
  * ^comment = "**Bedeutung:** Angabe, ob es sich um eine vollständige Repräsentation des CodeSystems oder nur um einen Auszug handelt.
    **Hinweise:** Alle in einem System möglichen Status-Werte müssen über FHIR korrekt repräsentiert werden können, mindestens jedoch die Status-Werte `fragment` und `complete`. Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft."
* concept 1.. MS
  * ^short = ""
  * ^comment = "**Bedeutung:** Angabe der Konzepte, aus denen sich das CodeSystem zusammensetzt.  
     **Hinweise:** Es MUSS mindestens ein Code und ein Anzeigetext spezifiziert werden."
  * code MS
    * ^short = ""
    * ^comment = ""
  * display 1.. MS
    * ^short = ""
    * ^comment = ""
  * definition MS
    * ^short = ""
    * ^comment = ""

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