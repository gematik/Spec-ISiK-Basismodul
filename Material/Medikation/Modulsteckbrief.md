# Medikation

## Kurzbeschreibung

Die Verordnung, Abgabe und Verabreichung von Medikamenten stellt eine der Kerntätigkeiten der Medizin dar.

Eine möglichst medienbruch-freie Kommunikation innerhalb dieses Workflows zwischen Behandelnden, Apotheken und Patienten kann zur Effizienz der Behandlungsprozesse beitragen und gleichzeitig die Therapiequalität sichern und verbessern (Stichworte: interne Qualitätssicherung, Arzneimitteltherapiesicherheit).

Dies gilt ebenso für die Dokumentation und Weiterverarbeitung der Aufnahme- bzw. Entlass-Medikation (Medikationsplan), die derzeit noch häufig in Form von manueller und somit fehleranfälliger Übertragung der Medikationsangaben umgesetzt wird.

### Use Cases

* Abbildung des Workflows Verordnung - Abgabe - Verabreichung von Medikamenten innerhalb des Krankenhauses
* Übernahme eines Medikationsplans bei Aufnahme
* Übergabe eines Medikationsplans bei Entlassung

#### Use Case a) Medikations-Workflow
Ein Behandelnder stellt die medizinische Notwendigkeit einer Medikamentengabe fest. Dies kann sowohl aufgrund der akuten Erkrankung der Fall sein als auch aufgrund von anderen, z.B. chronischen, Erkrankungen, die während des Krankenhausaufenthaltes weiter behandelt werden müssen. Es kann sich hierbei beispielsweise um Fertigarzneimittel, Wirkstoffmischungen, Kombinationspräparate usw. handeln. Neben dem Wirkstoff werden auch Dosis sowie Anweisungen zur Medikationsgabe (Intervall, Nebenbedingungen) vom Behandelnden vorgegeben.

Diese Notwendigkeit der Medikation wird in Form einer Medikations-Verordnung im PDMS erfasst und von diesem an das Apothekensystem kommuniziert.

Das Medikament wird nun, ggf. auch maschinell bereitgestellt bzw. ggf. auch hergestellt. Die Bereitstellung der Medikation wird im Apothekensystem dokumentiert und an das PDMS unter Bezug auf die Verordnung zurück kommuniziert. Eventuelle Abweichungen zur Verordnung (z.B. Generika oder Verwendung äquivalenter Wirk- oder Hilfsstoffe) können ebenfalls hier enthalten sein.

Anschließend erfolgt die Gabe der Medikation, die ebenfalls im PDMS unter Referenzierung der Verordnung dokumentiert wird. Eventuelle Abweichungen von der Verordnung (z.B. Abbruch einer Infusion) werden hierbei ebenfalls strukturiert dokumentiert.

Ein Abruf dieser Daten kann patientenbezogen (z.B. zur Überwachung der Therapie) oder in größerem Umfang (z.B. zur Qualitätssicherung) erfolgen.


#### Use Case b) Übernahme eines Medikationsplans bei Aufnahme
Zahlreiche, insbesondere multimorbide, Patienten benötigen eine umfangreiche Dauermedikation (Medikationsplan), die auch während eines Krankenhausaufenthaltes weiter verabreicht oder ggf. angepasst werden muss.

Dieser Medikationsplan wird dem PDMS in strukturierter elektronischer Form übermittelt, beispielsweise über ein Ärzte- oder Patientenportal.

Nach Freigabe durch den Behandelnden kann diese Information im PDMS auch direkt in eine Verordnung umgewandelt werden und mündet damit in Use Case a.

#### Use Case c) Übergabe eines Medikationsplans bei Entlassung
Bei Entlassung wird in der Regel mindestens für die Patientengruppe aus Use Case c ein aktualisierter Medikationsplan erstellt. Dieser ist für den jeweiligen Patienten sowie weitere berechtigte Personen (weiterbehandelnde Ärzte, ggf. Angehörige oder gesetzliche Betreuer) in strukturierter Form zur Übernahme in PVS-Systeme bzw. persönliche Patientenakten-Systeme abrufbar.

## Bestätigungsrelevante Systeme
Die Implementierung dieses Moduls ist verpflichtend für alle Systeme, die der Verordnung oder Bereitstellung von Medikamenten dienen oder in diesem Prozess unterstützen.

## Bezug KHZG
Fördertatbestand 5: Medikationsmanagement (§ 19 Abs. 1 Satz 1 Nr. 5 KHSFV)

## Stakeholder
* bvitg 
* KBV
* Medizininformatik-Initiative
* ABDA
* GEVKO

## Relevante Spezifikationen
* [Medizininformatik-Initiative Kerndatensatz Modul Medikation](https://simplifier.net/MedizininformatikInitiative-ModulMedikation)
* [KBV eRezept](https://simplifier.net/eRezept)
* [KBV Verordnungssoftware-Schnittstelle](https://simplifier.net/Verordnungssoftware-Schnittstelle)
* [Bundesmedikationsplan](https://www.kbv.de/html/39802.php)
* [Medikationsplan Plus](https://simplifier.net/medikationsplanplus)
* [ABDA eRezeptAbgabedaten](https://simplifier.net/eRezeptAbgabedaten)
* [GEVKO eMDAF](https://simplifier.net/eMDAF)
* [Gematik eRezept Workflow](https://simplifier.net/erezept-workflow)

## Datenobjekte/FHIR-Ressourcen

### aus anderen Modulen
* Patient (Basis)
* Encounter (Basis)
* Practitioner (Basis)

### neue Datenobjekte
* MedicationStatement
* MedicationRequest
* MedicationDispense
* MedicationAdministration
* Medication

## Potentielle Probleme/Risiken
* Der Workflow wird derzeit einrichtungsintern bereits mit teils proprietären, teils auf HL7 v2 basierenden Mitteln abgebildet.
* Für Medikationspläne ist derzeit der Bundesmedikationsplan etabliert, dessen strukturierte Repräsentation auf FHIR DSTU2 basiert, jedoch syntaktisch hiervon stark abweicht ("Ultrakurzformat").

### Lösungsansätze
* Es ist klar herauszustellen, dass eine standardisierte, interoperable Kommunikation Vorteile sowohl in Bezug auf die Behandlungseffizienz als auch auf die Qualität der Behandlung hat (Stichwort: Fehlerquote durch Medienbrüche).
* In der Kommunikation mit den niedergelassenen Behandelnden (Bundesmedikationsplan) ist ein Konsens zu finden, wie z.B. in einem ersten Schritt die technischen Repräsentationen der Daten ineinander überführt werden können und ggf. in einem zweiten Schritt eine Vereinheitlichung stattfinden kann.
