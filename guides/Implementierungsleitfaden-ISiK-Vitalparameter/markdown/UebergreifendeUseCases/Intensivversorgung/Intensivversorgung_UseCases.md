## Use Cases und Workflows - Übergang zwischen Akut- und Normalversorgung
Zahlreiche Use Cases rund um den Überleitungsprozess zwischen einer Intensiv- und einer Normalstation  (bidirektional) innerhalb eines Krankenhauses sind vorstellbar. Neben illustrierenden Use Stories wird an dieser Stelle auch eine Workflow-Perspektive eingenommen. 

Zum jetzigen Stand kann die Spezifikation keine umfassende Abdeckung eines Überleitungsprozesses vorweisen. Vielmehr wird die Überleitung zwischen Intensiv- und Normalversorgung (bidirektional) auf der Ebene eines Workflows abgebildet, fokussierend auf die Kommunikation relevanter Daten aus Normalversorgung (KIS) und Intensivversorgung (PDMS).

### Werte aus KIS und PDMS

Datenquellen für die hier betrachteten Fälle sind KIS und PDMS.
Einige Use Stories, die diesen Kontext illustrieren sind folgende:

**UC-VIT-ICU-NORM-001**: Eine Ärztin fragt während einer Kontroll-Maßnahme in der normalstationären Kontrolle nachträglich Daten zur Herzfrequenz eines Patienten über ein KIS mit der Funktion einer elektronische Kurve ab (momentan liegt die Herzfrequenz bei 90 Schlägen pro Minute). Zweck dabei ist sicherzustellen, dass die Herzfrequenz im Vergleich zu den Werten aus der Intensivstation für den Patienten im Normalbereich liegt. Die Daten stammen aus einem intensiv-stationären Aufenthalt, den der Patient aufgrund einer supraventrikulären Tachykardie durchlaufen hat.

Hintergrund: fachlich wäre hier auch eine Blutdruckabfrage relevant - auch diese soll auf entsprechende Weise abgefragt werden können.

**UC-VIT-ICU-NORM-002**: Eine Ärztin fragt während der intensivmedizinischen Versorgung nachträglich Daten aus dem normalstationären Aufenthalt zum Blutdruck ab über ein PDMS-Frontend, um den Beginn der Urosepsis eingrenzen zu können. Auf Normalstation war der Patient Aufgrund eines Harnwegs-Infektes.

**UC-VIT-ICU-NORM-003**: Eine Medizinische Fachangestellte (MFA) sendet vor der Überleitung in die Intensivstation Daten aus dem normalstationären Aufenthalt an ein PDMS-Frontend. Ausgelöst wir der Versand per Button im KIS-Frontend. Relevant sind dabei Daten zum Blutdruck, damit der Beginn der Urosepsis später in der Intensivversrogung  zeitlich feststellbar ist. Auf Normalstation war der Patient Aufgrund eines Harnwegs-Infektes.


### Laborwerte
Einige Werte, die für den geschilderten Kontext relevant sind, stammen aus einem Labor Information System (LIS). Hierzu illustrierend:

**UC-VIT-ICU-NORM-LAB-001**: Eine Ärztin fragt während einer Kontroll-Maßnahme in der normalstationären Kontrolle nachträglich Daten zum Serumkreatinin eines Patienten über ein KIS mit der Funktion einer elektronische Kurve ab, um die Stabilität der Nierenfunktion anhand der glomerulären Filtrationsrate sicherzustellen. Die Daten stammen aus einem intensivstationären Aufenthalt, den der Patient aufgrund eines akuten Nierenversagens durchlaufen hat.

Vorannahmen zur User Story: Das PDMS verfügt über eine Historie der Serumkreatininwerte, da es die Labordaten (aus einem LIS stammend) persistiert. Das PDMS verfügt auch über eine Schnittstelle für READ-Interaktionen entsprechend der ISIK Festlegung. 

Hintergrund zur Konfiguration: Das KIS agiert hier als Client und das PDMS als Server. 
Da in der Praxis ein LIS, das mit PDMS integriert ist, i.d.R. auch mit einem KIS integriert ist, kann die Abfrage von Labordaten mit intensivmedizinischem Bezug aus dem KIS auch direkt erfolgen.

## Workflow
Zur Abbildung des bidirektionalen Überleitungsprozesses zwischen einer Intensiv- und einer Normalstation können KIS und PDMS jeweils die Rolle des KIS und Client einnehmen. 

Siehe dazu {{pagelink:ImplementationGuide/markdown/RestApi.md}}

### Diagramme
Vorannahmen zu den Diagrammen sind, dass die betroffenen Patienten einen Zugang- oder Entlassungsprozess im Kontext der Intesivversorgung durchlaufen haben. 

Die Illustration möglicher bidirektionaler Überleitungs-Prozesse (analog zum [spezifischen Zulassungsprozess hier](https://breathe.ersjournals.com/content/16/2/200062)) erscheint in diesem Kontext nicht zielführend.

Der Workflow dient im Wesentlichen der Darstellung zu verschiedenen Möglichkeiten der Nutzung der REST-Schnittstelle zur Unterstützung des Workflows durch abfrage-basierte Kommunikation von Werten.

#### Abfrage zeitlich folgend 
Folgende Diagramme illustrieren Die Fälle, bei denen Daten zeitlich nach der Überleitung abgefragt werden (mittels HTTP GET).

Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-001** als BPMN-Prozess:

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Abfrage-aus-ICU.PNG" alt="Nachträgliche Blutdruck-Abfrage aus Normalstation" width="90%"/>

**Hinweis:** hier agiert das KIS als Client. 


Folgendes Diagramm Illustriert den Workflow zu **UC-VIT-ICU-NORM-002** als BPMN-Prozess:

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Abfrage-aus-Normal.PNG" alt="Nachträgliche Blutdruck-Abfrage aus Intensivstation" width="90%"/>


#### Übernahme zeitlich vorgelagert 

Denkbar sind auch Workflows, bei denen erhobene Daten aus einem System vor der Verlegung übermittelt werden. Siehe z.B. den Workflow zu **UC-VIT-ICU-NORM-003** als BPMN-Prozess:

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Vitalparameter-und-Koerpermasze/rc/main-stufe-4/Material/images/Uebermittlung-an-ICU.PNG" alt="Vorgelagerte Übermittlung an Intensivstation" width="90%"/>

Hier genügt eine Abfrage per HTTP GET nicht (diese kann ggf. aber durch einen weiteren Kommunikationsschritt getriggert werden und damit die Vorab-Übermittlung unterstützen). An dieser Stelle werden keine weiteren Festlegungen zur vorgelagerten Übermittlung der  Daten erhoben und es wird keine direkte Schreiboperation auf FHIR-Basis des KIS im PDMS für diesen Fall gefordert. Die Vorab-Übermittlung könnte durch verschiedene Mechanismen unterstützt werden:
- FHIR Subscription (vgl. im ISiK Kontext [Patient merge Notification](https://simplifier.net/guide/isik-basis-v4/UebergreifendeFestlegungen-UebergreifendeFestlegungen_Patient-merge?version=current))
- Create-Interaktion (POST) (vgl. im ISiK Kontext [REST-API](https://simplifier.net/guide/isik-basis-v4/markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen_Rest?version=current))
- HL7 v2 Messaging
- etc.

