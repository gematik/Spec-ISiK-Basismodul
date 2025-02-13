---
topic: UebergreifendeFestlegungen-UebergreifendeFestlegungen-Must-Support-Flags
---
## Must-Support-Flags

Das [Must-Support-Flags](https://hl7.org/fhir/R4/profiling.html#mustsupport) (MS-Flag) kennzeichnet Elemente, die auf bestimmte Weise unterstützt werden müssen. Sowohl für die Erstellung - d.h. das Exponieren der Ressource -, als auch für die Verarbeitung - d.h. den Umgang beim Eingang von extern - greifen die MS-Flag Festlegungen. 
Die Verwendung des MS-Flag an Profil-Elementen hat im Kontext dieses Leitfadens folgende Bedeutung:

1. Im Kontext der Erstellung von FHIR-Ressourcen:

    Elemente, die mit MS gekennzeichnet sind, MÜSSEN vom erstellenden System implementiert werden. Dies bedeutet:
    - Systeme MÜSSEN die entsprechenden Elemente in der eigenen Persistenz-Ebene vorhalten können. 
    - Systeme MÜSSEN die entsprechenden Elemente in den entsprechenden Profil-Instanzen bei Abfrage über eine FHIR-Schnittstelle befüllen und ausgeben können.
    - Systeme MÜSSEN die entsprechenden Elemente zur Anzeige bringen können (ausgenommen davon sind Systeme mit reiner Middleware-Funktion, die über keine grafische Nutzeroberfläche verfügen).
    -  MS-Elemente, die als optional gekennzeichnet sind (0..-Kardinalität) KÖNNEN bei der Erstellung einer FHIR-Instanz fehlen, wenn die entsprechende Information im Einzelfall unbekannt, nicht zutreffend ist oder (noch) nicht erhoben wurde.

    Eine **Ausnahme** stellen implizit vorhandene Informationen dar, die nicht aus der Persistenz-Ebene sondern nur aus dem Kontext des erstellenden Systems entnommen werden können. Beispiel: In einem System werden stets nur Informationen aktiver Patienten vorgehalten (inaktive Patienten werden verschoben/archiviert/gelöscht). Der Status eines Patienten wird daher nicht explizit angezeigt und in der Persistenz-Ebene gespeichert, sondern ergibt sich allein aus der Existenz des Datensatzes in diesem System. In solchen Fällen gilt:
    - Bei lediglich implizit vorhandenen Informationen KANN der Inhalt eines MS-Elementes in der Schnittstelle hartkodiert werden (sofern gesichert ist, dass der entsprechende Wert des Elementes ausnahmslos auf alle Instanzen zutrifft, die dieses System erstellt).

    Insbesondere für solche implizit vorhandene Informationen, können in den Profilen auf der Ebene einzelner, mit MS-Flag versehener Elemente konkretere Hinweise zur Implementierung enthalten sein, die die übergreifende Definition zu Must-Support für den Einzelfall konkretisieren, zum Beispiel zur Klarstellung wo und unter welchen Umständen hartkodierte Werte erlaubt sind.
Ob für ein MS-Flag konkrete Ausnahmen gelten, in denen ein impliziter Wert hartcodiert gesetzt werden darf oder das MS-Flag nur unter bestimmten Bedingungen gilt, ist der Definition des jeweiligen Elementes zu entnehmen.

    Hinweis: Bei den Testszenarien von READ-Interaktionen im Rahmen des Bestätigungsverfahrens werden für MS-Elemente Informationen vorgegeben, die in den Systemen erfasst und über die FHIR-Schnittstelle reproduziert werden MÜSSEN, unabhängig von der angegebenen Kardinalität.

2. Im Kontext der Verarbeitung von FHIR-Ressourcen:

    Elemente, die mit MS gekennzeichnet sind, MÜSSEN vom empfangenden System verarbeitet werden. Dies bedeutet:
    - Das System MUSS in der Lage sein, diese Elemente in der eigenen Persistenz-Ebene zu speichern
    - Das System MUSS bei einer erneuten Abfrage der Information über die FHIR-Schnittstelle in der Lage sein diese Information zu reproduzieren.
    - Systeme MÜSSEN die entsprechenden Elemente zur Anzeige bringen können (ausgenommen davon sind Systeme mit reiner Middleware-Funktion, die über keine grafische Nutzeroberfläche verfügen).
    - Systeme KÖNNEN es darüber hinaus ermöglichen, dass die jeweiligen Informationen vom Anwender ergänzt oder editiert werden. 
    - MS-Elemente, die als optional gekennzeichnet sind (0..-Kardinalität) KÖNNEN bei der Übermittlung einer Instanz fehlen, wenn die entsprechende Information im sendenden System unbekannt, nicht zutreffend ist oder (noch) nicht erhoben wurde. Das Fehlen optionaler MS-Elemente DARF bei der Verarbeitung NICHT zu einem Fehler führen.

    Hinweis: Bei den Testszenarien von WRITE/UPDATE-Interaktionen im Rahmen des Bestätigungsverfahrens werden Instanzen an das zu testende System übermittelt, in denen alle MS-Elemente, unabhängig von Ihrer Kardinalität, gegeben sind. Diese MÜSSEN von den getesteten Systemen in einer anschließenden READ-Interaktion vollständig über die FHIR-Schnittstelle reproduziert werden können.

Wenn ein Hersteller neben den in ISiK geforderten Elementen die Verarbeitung *weiterer* Elemente unterstützt, so sollte dies durch abgeleitete Profile, in denen die zusätzlichen Elemente ebenfalls als MS gekennzeichnet sind, dokumentiert und im Rahmen der Schnittstellendokumentation publiziert werden.