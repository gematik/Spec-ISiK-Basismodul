## Use Cases für das ISiK Modul Stufe 2 im Kontext der MHD-Transaktionen ITI-66 (Find Document List) und ITI-67 (Find Document Reference) 
### sowie Beurteilung von deren Umsetzbarkeit 
1. im Rahmen von MHD/XDS 
2. Rahmen von ISiK durch Erweiterung der MHD/XDS Funktionalitäten

### Use Case 1 (Daniel Sänger)
Für Bearbeitung von Dokumenten im Rahmen eines Untersuchungsprozesses sollten alle Dokumente zu einer Leistung, 
Bewegung oder Fall abgefragt und in chronologischer Reihenfolge sortiert angezeigt werden können.
#### Umsetzung im Rahmen von MHD/XDS
* Selektion nach Patient, chronologische Sortierung: `/DocumentReference?patient.identifier=1234&_sort=creation`
  * der Parameter creation ist ein im MHD kontext definierter custom Parameter (nicht FHIR core!)
  * der \_sort-Parameter ist in MHD nicht verbindlich gefordert.
* Selektion anhand der Fallnummer prinzipiell möglich, wenn diese über die XDS-eventCodeList abgebildet wird.
* Selektion auf Ebene der Bewegung nicht möglich
#### Umsetzung im Rahmen von ISiK Stufe 2
* Selektion anhand der Fallnummer: `/DocumentReference?encounter.account.identifier=56789`  oder `/DocumentReference?encounter.partOf.identifier=56789` 
  * "Fall" i.S.v. "DRG-Abrechnungsfall" 
  * abhängig vom Ergebnis der Encounter-Modellierung für Stufe 2
* Selektion nach Bewegung: `/DocumentReference?encounter=x` 
  * "Bewegung" i. S. v. vor-/nachstat. Besuch, stat. Aufenthalt auf Fachabteilungsebene)
  * Setzt verbindliche Modellung von Encounter gem. MI-I Modell "Ebene 2" voraus

### Use Case 2 (Daniel Sänger)
Für meine tägliche Befundabarbeitung möchte ich alle Dokumente angezeigt bekommen, die z.B. in den letzten 24h neu hinzugekommen sind.
#### Umsetzung im Rahmen von MHD/XDS
* Sortierung nach Zeitraum des Dokumentendatums, patientenbezogen `/DocumentReference?patient.identifier=1234&creation=gt2021-10-06T00:00:00Z-02:00`
* MHD erlaubt ausschließlich die Suche im Patientenkontext. Patientenübergreifende Suchen, z.B. stationsbezogen sind nicht möglich.
#### Umsetzung im Rahmen von ISiK Stufe 2
* Sortierung nach Zeitraum des Dokumentendatums, stationsbezogen `/DocumentReference?encounter.location=IN2&creation=gt2021-10-06T00:00:00Z-02:00`
  * setzt verbindliche Abbildung von Encounter.location in Stufe 2 voraus

### Use Case 3 (Daniel Sänger)
Als verantwortlicher Arzt der Endoskopie möchte ich alle Untersuchungsbefunde meines Funktionsbereichs sortiert nach Dokumentenstatus angezeigt bekommen, 
um die Befundfreigabe vorantreiben zu können.
#### Umsetzung im Rahmen von MHD/XDS
* MHD erlaubt ausschließlich die Suche im Patientenkontext. Patientenübergreifende Suchen sind nicht möglich.
* Dokumentklasse und -typ sind in XDS-Terminologie nicht hinreichend spezifisch um gezielt "Endoskopie-Befunde" auszuwählen (`type` = BILD (Ergebnisse bildgebender Diagnostik), `class` = BEF (Befundbericht))
* practiceSetting und facilityType enthalten keine geeigneten Codes, um gezielt "Endoskopie" zu selektieren
* implementierbar in Verbindung mit der Verwendung von KDL (XDS:eventCodeList) und der Suche nach dem Code "DG02010" (Endoskopiebefund)
#### Umsetzung im Rahmen von ISiK Stufe 2
* Selektion nach Dokumenttyp "Endoskopiebefund" und Dokumentationsstatus (`docStatus`) `/DocumentReference?type=DG02010|http://dvmd.de/fhir/CodeSystem/kdl&doc-status=preliminary`
  * CAVE: `doc-status` ist kein im FHIR core definierter Suchparameter, nur als custom Parameter abbildbar!
  * Setzt Nutzung von KDL-Codes zur Dokumentenklassifikation voraus. 


### Use Case 4 (Andreas Henkel)
Eingehende Befunde nach Konsilanforderungen sollen in Bezug auf die ausgehende klinische Fragestellung gruppiert und so sortiert werden, dass der aktuellste Befund zuerst und weitere Befunde chronologisch folgend angezeigt werden. Hierbei sind Signalisierungsfunktionen gewünscht und zum letzten Befund können idealerweise die im Kontext der Behandlung, im Kontext der Dokumententypen und -Klassen relevanten Dokumente gleich mit aufgerufen werden. Die "Provenance"-informationen sind mit angegeben, so dass der Arzt sich zur weiteren Arbeit an das passende Fachverfahren selbst oder über die Einbeziehung der verantwortlichen Fachabteilung weiter notfalls informieren kann. Berücksichtigt werden Berechtigungen, so dass z.B. Psychiatrische Befunde oder für die im Behandlungskontext nicht relevanten Dokumente nicht zur Anzeige kommen (abhängig von den Regelungen zur OH-KIS bzw. der Festlegungen des Krankenhauses).
#### Umsetzung im Rahmen von MHD/XDS
 * Die Implementierung des `_sort`-Parameters ist in MHD erlaubt, aber nicht gefordert.
 * Die Signalisierungsfunktion widerspricht dem query-getriebenen Paradigma hinter ITI-67 (lösbar nur über engmaschiges Polling)
 * klinische Fragestellung, Behandlungskontext erfordert die Einbindung der Dokumente in einen OrderEntry-Workflow, dieser ist im scope von MHD/XDS nicht abgebildet.
 * Bei der Frage zur Berechtigungssteuerung verweist MHD auf IUA (Oauth2)
 * SourceId (=Herkunftssystem/Fachverfahren) enthält lediglich eine OID, keine Verknüpfung auf ein Objekt, das menschenlesbare Informationen enthält. Kann als Selektionskriterieum herangezogen werden, aber nicht als Informationsquelle (außer über eine externe API). In MHD als [ihe-sourceId-Extension](https://profiles.ihe.net/ITI/MHD/StructureDefinition-ihe-sourceId.html) an SubmissionSet (List) abgebildet.
#### Umsetzung im Rahmen von ISiK Stufe 2
 * Best Practice Empfehlungen zur Implementierung von Subscription 
 * Erweiterung der Dokumentenmetadaten zur genaueren Typisierung (z.B. mittels KDL)
 * Aufgreifen der Fragestellung zu den Berechtigungen im Modul "Sicherheit"
 * Mapping der SourceId von OID auf auflösbare URL oder Verknüpfung mit Device/Organization via Provenance 


### Use Case 5: Filterung nach Dokumentenstatus (Marc Herrmann)
Szenario: Der Anwender möchte Dokumente angezeigt bekommen, die eine bestimmte Freigabestufe erreicht haben.
Wir nehmen dabei an, dass Dokumente je nach Fertigstellungsgrad einen unterschiedlichen Bearbeitungsstatus im KIS mitführen.
Da viele Dokumente nach ihrer Revision nicht gänzlich gelöscht sondern nur formal ersetzt werden sollen, würden Altversionen als „deaktiviert“ und endgültige Versionen als „final“ markiert werden können.
Beispiel: eine erste Ausleitung eines technischen Befunddokuments erfolgt in Freigabestufe 2 als „vorläufig“ und „nicht freigegeben“, eine erneute Ausleitung erfolgt nach erfolgter finaler Freigabe in Stufe 4 als „final“ und „freigegeben“, während die Vorversion als „deaktiviert“ markiert wird.
Neben dem Bearbeitungs- bzw. Freigabestatus würde auch das Freigabedatum per ISiK übermittelt werden können.

#### Umsetzung im Rahmen von MHD/XDS
* MHD erlaubt ausschließlich die Suche im Patientenkontext. Patientenübergreifende Suchen sind nicht möglich.
* status-Codes für DocumentReference: 	current | superseded | entered-in-error
* neben created gibt es keine weitere Datumsangabe

#### Umsetzung im Rahmen von ISiK Stufe 2
* Verwendung von docStatus: preliminary | final | amended | entered-in-error
* Änderungsdatum als Extension an DocumentReference/lastUpdated on Binary?

### Use Case 6: IHE-konforme Metadatenanreicherung (Marc Herrmann)
Szenario: Zwecks automatischer Weiterverarbeitung in einer XDS-fähigen Datenverteilungsplattform sollen Dokumente aus dem KIS heraus mit IHE-konformen Metadaten angereichert werden.
Wichtig als Zusatzinformationen zu herkömmlichen MDM-Informationen sind insbesondere passende Value Sets für classCode, typeCode, practiceSettingCode und confidentialityCode. Hierfür könnten die von IHE Deutschland genutzt werden, für den typeCode alternativ auch die KDL.
#### Umsetzung im Rahmen von ISiK Stufe 2
* KDL verbindlich machen, Mapping auf XDS-Class- und Type-Codes bei Bedarf?

### Use Case7: Digitale Signatur (Marc Herrmann)
Szenario: Der Anwender möchte zwecks Nachverfolgung des Freigabeprozesses eine Liste von Dokumenten angezeigt bekommen, welche noch keine digitale Signatur bekommen haben.
Nebenbedingung: Nur bestimmte Signaturarten werden zwecks Weiterverarbeitung der Dokumente anerkannt (eIDAS/QES).
#### Umsetzung im Rahmen von MHD/XDS
* ???
#### Umsetzung im Rahmen von ISiK Stufe 2
* Provenance ??? Schwierig, da target auf Binary zeigt, als Suchergebnis jedoch DocumentReference erwartet würde. Doppeltes reverse Chaining erforderlich?
