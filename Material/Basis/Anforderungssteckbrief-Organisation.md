# Steckbrief 
Es wurden Bedarfe nach Abbildung sowohl der KH-Aufbauorganisation (FHIR Ressource Organization), als auch von Campi, Standorten etc. (FHIR Location) gemeldet.

## Bedarfe und Use Case Kontext
Folgende Bedarfe, Anforderungen und Use Cases finden im Rahmen der Ausbaustufe 4 von ISIK zwecks Festlegung im Implementierungsleitfaden und in Profilen Beachtung:

1. Die (Raum- und Betten-)Belegung (interdisziplinär) sollte strukturiert erfolgen können.
    - Frage - grundsätzlich: Wir gehen davon aus, dass die Raum- und Bettenbelegung Bestandteil der Funktionalität eines KIS ist. Was wären Use-Cases um diese Information über eine Schnittstelle zu kommunizieren?
1. Im Rahmen des Terminmanagements sollten Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation (Fachbereiche etc.) und an bestimmte Standorte möglich sein.
    - Fragen: 
    - Welche Granularität an Standorten ist hier sinnvoll (s.u.)?
    - Welche Profile in ISIK Terminplanung betroffen? 
       - Folgende Abgebildet in UML: 
          - ISiKKalender Schedule.actor referenziert u.a. Location
          - ISiKTerminKontaktMitGesundheitseinrichtung  serviceProvider Reference(Organization) hierfür  Fachabteilungs-Organisation (aber nicht ausschließlich) - (hier auch Basis-Encounter)
          - ISiKNachricht.recipient und .sender (erstmal ausklammern)
          -ISiKMedizinischeBehandlungseinheit (HealthCareService)
            - .providedBy (Organization) und 
            - .location Reference(Location) - aber NICHT (?) coverageArea(?)
1. Im Rahmen der Versorgung sollte eine der folgenden Beispiel-Fragen beantworten werden können:
    - Handelt es sich um ein Isolationszimmer?
        -Frage: Abzubilden in Location, aber welches Element?
    - Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte
    - etc.
1.  Informationen für eAU sollten auch in ISIK abgebildet werden – hier insbesondere BSNR (Betriebsstättennummer)

## Lösungswege- und optionen

- Profile zu den FHIR Ressourcen Organization und Location sollen spezifiziert werden (siehe bestehenden PR)
- Ein Profil zur FHIR Ressource HealthCareService soll diskutiert werden (dies Bereits in Terminplanung enthalten)
- Bestehende Profile, die zu beachten sind hinsichtlich der Kompatibilität:
   - Medizin Informatik Initiative https://simplifier.net/MedizininformatikInitiative-ModulStrukturdaten/~introduction, bzw siehe hier unter Strukturdaten https://art-decor.org/art-decor/decor-datasets--mide-
        - hier werden Profile zu Organisation und Standort (Location) vorgelegt
        - differenziert wird zwischen Abteilungen als Organisationen und Abteilungsidentifikatoren, letztere erfordern dezidierten .identifier und der Organisationstyp ist (mittels Slice) fest codiert mit "dept",  zur Codierung des Typs der Abteilungen wird folgendes ValueSet genutzt: http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert
        -Organisation als ganzes Krankenhaus nutzt IKNR
   - E-Rezept ServiceRequest https://simplifier.net/erezept-servicerequest/erp-service-request-organization
        - hier werden für identifier KINAdresse und TIMAdresse vorgesehen
            - dies soll auch IN ISIK übernommen werden. Ein USe Case zur Motivation lautet folgendermaßen: Bei einem Transfer zwischen den Fachkliniken Gynäkologie und Dermatologie fragt eine Mitarbeiterin aus der Gynäkologie einen Mitarbeiter aus der Dermatologie zu nicht erfassten Informationen eines  Patienten an, der gerade verlegt wurde. Die Mitarbeitern kann dabei direkt TIM, weil die entsprechende Adresse im Profil-Identifier zur Organisationseinheit vorgehalten ist.
   - VZD:
        - https://simplifier.net/vzd-fhir-directory/organizationdirectory
                - hier wird ein Organization.type gefordert (1..), das verwendete Value Set ist jedoch nicht nutzbar innerhalb des Krankenhaus-Kontext und damit Abweichung notwendig
                -Organization.identifier betreffend gilt:
                        - auf die Angabe einer Abrechnungsnummer der Kassenzahnärztlichen Bundesvereinigung wird in ISIK verzichtet, da Zahnarztpraxen keine (Teil-)Organisationen eines Krankenhauses sind und damit nicht im Umfang des Moduls enthalten sein sollen
                        - auf die Angabe einer Vertragskassennummer (VKNR) wird in ISIK verzichtet, da Krankenkassen nicht im Umfang enthalten
        - https://simplifier.net/vzd-fhir-directory/healthcareservicedirectory
        - https://simplifier.net/vzd-fhir-directory/locationdirectory

## Abgeleitete Anforderungen

Abgeleitete Anforderungen (fragmentarisch) aus Bedarfsmeldung und Lösungsoptionen.

### Profilauswahl
1. Profile zum Standort (Location) und Organisation sind notwendig.
1. Ein Profil zur Organisation soll eine Fachabteilung abbilden können.

Als Standorte für ISiK sind momentan Profile angedacht und profiliert als draft (WIP): 
- generischer Standort
- Raum
- Bett

In Betracht gezogen:
- Station

Diese bisher alle für das Encounter-Profil ISiKKOntaktGesundheitseinrichtung.location genutzt

Zu bedenken:
- Gebäude (z.B. verschiedene Gebäude im Pavillonsystem; ggf. auch Krankensäle im Kammsystem)
    - ggf. abzugrenzen von Klinik?
- Campus (vgl. Charité mit Campus 1) Mitte , 2) Virchow und 3) Benjamin Franklin)

### Weitere Anforderungen (tbd.)
Weitere (implizite) Anforderungen an die Festlegung zu Organisation und Standort in ISIK

1. Auswahl geeigneter Suchparameter muss getroffen werden
1. Use Cases mit bestehenden Modulen auszuarbeiten - insbesondere Terminplanung (siehe auch Bedarf oben zur Bettenbelegung)
1. Profil ISiKOrganisation sollte sich möglichst an das entsprechende Profil der FHIR-VZD der gematik / KBV orientieren.
    - siehe insbesondere .identifier


## Fragen
Fragen und Annahmen zur Validierung. 

### Annahmen
Fragen, die intern beantwortet wurde, jedoch gegenüber der Community validiert werden sollen.

1. Soll das Profil Organization (Fachabteilung) auch explizit KIM und TIM Adressen als identifier führen? Siehe Analog: https://github.com/gematik/spec-E-Rezept-ServiceRequest/blob/master/Resources/input/fsh/profiles/8_Organization.fsh -> ja s.u. ; weiteres intern zu klären
1. Soll ein Profil zur Organisation auch ein Krankenhaus als ganzes abbilden können?
        - Gegenargument:  Der Vorteil in der Abbildung einer Organization-Ressource besteht darin, dass man die Hierarchie von Abteilungen, Kliniken, etc. abbilden kann (per Organization.partOf). Falls es nur darum geht die Zuständigkeit zu annotieren, könnte dies auch "inline" per Display-Value (Name der Organization) und Identifier (z.B. IKNR der Organization) erfolgen.

### Offene Fragen
Weitere Fragen, die offen sind und mit Community diskutiert werden sollen.

1. Wie soll die Modularisierung / Paketierung gegenüber Terminplanung erfolgen (insbesondere HealthCareService)?
1. Grundsatzfrage: Kodierung der unterschiedlichen Profile für 
  - ISIKOrganisation (Fachabteilung) - ggf. zu lösen mit Fachabteilungsschlüssel 
  ) https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656780 
  - Standorte: Raum, Bett (ggf. Station)
1. Soll das Profil Organisation (ggf. Fachabteilung) auch explizit die Standortnummer führen (oder eher für Profil Location?)? Siehe https://www.dkgev.de/themen/digitalisierung-daten/informationstechnik-im-krankenhaus/verzeichnisse-und-register/standortverzeichnis/; Hintergrund: https://reimbursement.institute/glossar/standortnummer/


## TODOs

1. Prüfung der MS-Flags und Interaktionen

**Hintergrund**

Die oben genannten Punkte entsprechen den konsolidierten Punkten, wie sie [hier](https://github.com/gematik/spec-ISiK-Basismodul/discussions/326) in Folge der Arbeitsgruppen zum ISIK-Basismodul festgehalten und veröffentlicht wurden.
