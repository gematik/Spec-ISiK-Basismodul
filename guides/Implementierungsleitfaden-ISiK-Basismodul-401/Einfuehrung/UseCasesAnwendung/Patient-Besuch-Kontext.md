## Herstellung von Patient- und Encounterkontext

Vor der Bereitstellung von patientenbezogenen Ressourcen, wie sie u.a. von den Modulen Vitalparameter, Dokumentenaustausch oder Medikation beschrieben werden, muss ein Client einen Patienten- und Encounterkontext herstellen, damit diese serverseitig dem richtigen Patienten und Besuch zugeordnet werden können. Aus diesem Grund sind Hersteller, die serverseitige Akteure dieser Module implementieren, stets verpflichtet, die in diesem Leitfaden spezifizierten Interaktionen zum Suchen und Abrufen von Patienten- und Encounter-Ressourcen ebenfalls zu implementieren.

### Serverseitige Implementierungsvarianten

#### Stand Alone Implementierung
Dabei ist es den Herstellern von nicht-patientenführenden Systemen ("Subsystemen") freigestellt, ob sie dauerhaft eine vollständige Kopie der relevanten Patienten- und Besuchsdaten des patientenführenden Systems vorhalten wollen. 
Dies kann zum Beispiel über folgende Mechanismen erfolgen:
* durch die Entgegennahme und Verarbeitung von HL7 V2 ADT-Nachrichten aus dem patientenführenden System
* mittels zyklischer Ausführung der _history-Interaktion (derzeit in ISiK nicht spezifiziert) 
* mit Hilfe von Subscription (derzeit in Ausarbeitung für ISiK Stufe 5)

#### Fassadenimplementierung
Alternativ können Subsysteme die benötigten Informationen ad hoc aus dem Primärsystem beziehen, wenn sie von einem Client angefragt werden. In diesem Fall kann das Subsystem die Suchanfrage eines Clients nach Patienten- oder Encounter-Ressourcen an das patientenführende System delegieren und dem Client die gelieferten Antworten durchreichen. Suchtreffer können in der Datenbank des Subystems gecached oder erneut abgerufen und persistiert werden, wenn ein Client eine Interaktion mit Bezug zu einer dieser Ressourcen ausführen möchte (z.B. durch POSTen einer patientenbezogenen Ressource (Observation, DocumentReference) mit Referenz auf den Patienten bzw. Encounter).
Besondere Vorsicht ist hierbei auf den Umgang mit URLs geboten. Je nach Architektur können die Suchergebnisse des patientenführenden Systems nicht unverändert an den Client übergeben werden. Ggf. müssen die Referenzen des patientenführenden Systems an den Endpunkt des Subsystems angeglichen und/oder Ressourcen-IDs des Primärsystems mit den vom Client verwendeten IDs ersetzt werden.

### clientseitige Implementierungsvarianten
Ungeachtet der serverseitigen Implementierungsvariante, können Clients stets eines oder mehrere der folgenden Verfahren zur Herstellung des Patienten-und Besuchs-Kontextes nutzen:

1. **SMART-App-Launch**: Wenn der Aufruf des Clients im Rahmen von ISiK-Connect erfolgt, kennt der Client bereits beim Start den aktuellen Patienten- und ggf. den Encounterkontext. Dabei wählt ein Anwender im Primärsystem (Server) einen Patienten und Fall aus und startet in diesem Kontext den Client. Referenzen auf Patient und Encounter werden im Zuge der Autorisierung vom Server an Client übermittelt. (Siehe Modul [Connect - Launch Context und Scopes](https://simplifier.net/guide/isik-connect-v4/ImplementationGuide-markdown-Conformance-ConformanceScopesKontexte?version=current)). 

| |  |
|---------|---------------------|
|![BestPractice](https://wiki.hl7.de/images/thumb/Bestpractice.svg/75px-Bestpractice.svg.png)|**Best Practice Empfehlung:** Aus Gründen der Anwenderfreundlichkeit, Interoperabilität und Sicherheit ist dieses Verfahren das empfehlenswerteste. |

2. **Bekannte Fallnummer**: Der Client kennt die (Abrechnungs-)Fallnummer (z.B. durch das Einscannen eines Barcodes, oder beim Mapping von V2 auf FHIR aus dem Feldinhalt von PV1.#19). Anhand dieser kann der Client die im Modul Basis beschriebenen Suchfunktionen für die Encounter-Ressource verwenden, um passende Aufenthalte zu identifizieren (`[base]/Encounter?account:identifier=<Fallnummer>`). Da unter einer Abrechnungs-Fallnummer mehrere Encounter (Besuche) zusammengefasst werden können (z.B. vorstationär + stationär + nachstationär), sollte als zusätzliches Suchkriterium entweder ein Datum/Zeitraum oder eine Selektion auf `Encounter.status` verwendet werden. Wenn ein zutreffender Encounter gefunden wurde, kann der Patientenkontext aus der subject-Referenz des Encounters entnommen werden. (Siehe Modul [Basis - Encounter Interkationen](https://simplifier.net/guide/isik-basis-401/Einfuehrung/Datenobjekte/Datenobjekte_Kontakt?version=4.0.1#Encounter_Interaktionen)

| |  |
|---------|---------------------|
|![Diskussion](https://wiki.hl7.de/images/thumb/Faq.svg/75px-Faq.svg.png)|**Kontexterstellung über logische Identifier:** Derzeit wird in der Entwickler-Community der Bedarf diskutiert, den Patienten- und Fallkontext auch ausschließlich auf Basis einer bekannten (Abrechnungs-)Fall und Patientennummer zuzuordnen, was insbesondere die Zuordnung von Ressourcen erleichtert, die aus HL7 V2-Datenströmen erzeugt werden. Ein Beitrag zu dieser Diskussion kann auf [chat.fhir.org](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.2C.20VITAL.2C.20MED.5D.20Herstellung.20von.20Patienten-.20und.20Fallkontext) geleistet werden. |

3. **Arbeitsliste**: Der Client ruft auf dem Server eine Arbeitsliste ab (z.B. Liste aller Encounter, die aktuell auf einer bestimmten Station/Ambulanz stattfinden, Liste aller ServiceRequests/Tasks, die durch den Client abgearbeitet werden müssen (aktuell noch nicht im Scope der ISiK-Spezifikationen!) und etabliert den Kontext, nachdem der Benutzer einen Eintrag der Liste ausgewählt hat.
4. **Manuelle Auswahl**. Nach dem Start des Clients verwendet der Benutzer eine Suchmaske, in der anhand von Patientennummer oder anderer demografischer Daten gesucht werden kann. Der Client verwendet die [Patient-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basis-401/Einfuehrung/Datenobjekte/Datenobjekte_Patient?version=4.0.1#Patient_Interaktionen), um auf dem Server nach zutreffenden Patienten zu suchen. Der Anwender wählt den gesuchten Patienten aus der Liste der Suchtreffer aus. Im Anschluss listet der Client, mithilfe der [Encounter-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basis-401/Einfuehrung/Datenobjekte/Datenobjekte_Kontakt?version=4.0.1#Encounter_Interaktionen), die relevanten Besuche des ausgewählten Patienten auf. (Anm.: Welche Besuche als "relevant" erachtet werden, liegt im Ermessen des Clients. Es könnte z.B. anhand von `Encounter.period`, `Encounter.class` und/oder `Encounter.status` gefiltert werden). Der Anwender wählt den zutreffenden Encounter aus.

|  | |
|---------|---------------------|
| ![Warnung](https://wiki.hl7.de/images/thumb/Attention_icon.svg/75px-Attention_icon.svg.png) |  **Gefahr fehlerhafter Zuordnung:** Die manuelle Auswahl von Patienten- und Fallkontext durch einen Benutzer ist fehleranfällig. Clients müssen geeignete Vorkehrungen und Plausibilitätsprüfungen implementieren um Falschzuordnungen zu verhindern.|



