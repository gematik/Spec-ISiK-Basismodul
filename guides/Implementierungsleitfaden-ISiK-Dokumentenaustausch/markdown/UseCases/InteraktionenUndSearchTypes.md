# Interaktionen und Search Types

## Dokumentenserver
Das bestätigungsrelevante System nimmt die Rolle des Dokumentenservers ein. Ein Dokumentenserver nimmt Dokumente von Clients zur Speicherung/Archivierung/Verwaltung entgegen und erlaubt Clients die Suche nach und den Abruf von Dokumenten.

## (Webbasierter/Mobiler) Client
Clients können Dokumente von einem Dokumentenserver abfragen, um sie z.B. einem Anwender anzuzeigen. Dabei können sie die für die Server verpflichtend festgelegten Suchkriterien beliebig kombinieren.
Clients sind nicht verpflichtet, alle von den Servern geforderten Suchkriterien zu unterstützen.

# Search Includes and Reverse Includes

Damit diese Akteure sinnvoll miteinander kommunizieren, wird im Folgenden ein grafischer Überblick über die in diesem Modul zu inlduierenden Suchparameter und Operationen gegeben.
Da es sich um eine Zusammenfassung handelt, gelten Bedingungen für die gezeigten Inhalte:
* Alle Must-Support Elemente einer Componente müssen von den entsprechenden Systemen suchbar sein. Diese sind hier nicht erneut aufgezählt.
* Ein Doppelpunkt meint den Zugriff auf ein Element des beinhaltenden Profils.
* Das Elemente hinter einem Doppelpunkt besitzt wiederum die Sucharameter (alle Must-Support Elemente!), die hier in die Suchsyntax zu inkludieren sind.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Dokumentenaustausch/rc/main-stufe-4/Material/images/diagrams/search_includes.svg" class="center" alt="Searchtypes" width="90%"/>

**Inkludierte Suchparameter nach Capability Statement**

## Zusammenhang zu den Use Cases

Jeder Include oder Reverse Include Parameter ist mit mindestens einem {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Anwendungsfall}} begründet. Diese Details sie auf der Seite der jeweiligen Ressource unter {{pagelink:ImplementationGuide/markdown/Datenobjekte.md, text:Datenobjekte}} zu finden. 
Im Folgenden sollen für die Lesart des Diagramms zwei Beispiele gegeben werden:
* **Beispiel für einen Include Zusammenhang:** Eine Applikation muss in der Lage sein ein _ISiK Medikament_ anhand der Eigenschaften von _ingredient_ suchen zu können, um den (Adverse) Use Case einer _Wechelwirkung_ zu vermeiden.
* **Beispiel für einen Reverse Include Zusammenhang:** Eine Applikation muss in der Lage sein zu einem _ISiK Patient_ alle _Encounter_ anhand der Zugehörigkeit via _subject_ suchen zu können, um den Anwendungsfall der vollständigen _Dokumentation_ gewährleisten zu können.
  