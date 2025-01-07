Profile: ISiKMedikationsVerordnung
Parent: MedicationRequest
Id: ISiKMedikationsVerordnung
Description: "Dieses Profil ermöglicht die Abbildung von Medikationsverordnungen eines Patienten in ISiK Szenarien."
* insert Meta
* extension MS
* extension contains
    ExtensionISiKAcceptedRisk named acceptedRisk 0..1 MS and
    ExtensionISiKMedikationsart named medikationsart 0..1 MS and
    ExtensionISiKBehandlungsziel named behandlungsziel 0..1 MS and
    ExtensionISiKMedicationRequestReplaces named medicationRequestReplaces 0..1 MS
* extension[acceptedRisk]
  * ^short = "akzeptiertes (in Kauf genommenes) Risiko"
  * ^comment = "Begründung des Must-Support: Folgeinformation der AMTS-Bewertung, sollte auch an nachfolgende Behandelnde übermittelbar sein

  Hinweis: Hier kann ein im Rahmen der Medikation festgestelltes, aber in Kauf genommenes Risiko dokumentiert werden, speziell auch die Begründung und ggf. erforderliche Begleitmaßnahmen."
  * valueString MS
* extension[medikationsart]
  * ^short = "Therapieart der Medikation"
  * ^comment = "Begründung des Must-Support: von der Fachseite gewünschte Angabe

  Hinweis: Angabe Akut- oder Dauermedikation."
  * valueCoding
    * system MS
    * code MS
    * display MS
* extension[behandlungsziel]
  * ^short = "Behandlungsziel (textuell)"
  * ^comment = "Begründung des Must-Support: von der Fachseite gewünschte Angabe

  Hinweis: Freitext-Beschreibung des Behandlungsziels."
  * valueString MS
* extension[medicationRequestReplaces]
  * ^short = "Welche Medikationsverordnung wird ersetzt?"
  * ^comment = "Begründung des Must-Support: historische Nachvollziehbarkeit

  Hinweis: FWelche Medikationsverordnung wird ersetzt?"
  * valueReference MS
    * reference MS
* status MS
  * ^short = "Status der Verordnungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard"
* intent MS
  * ^short = "Ziel der Verordnungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard

  Hinweis: i.d.R. 'order'"
* doNotPerform ..0
  * ^comment = "Begründung der Kardinalitätsänderung: Use Case für dieses Feld ist nicht im Scope"
* medicationCodeableConcept MS
  * ^short = "Medikament in codierter Form oder ggf. als Freitext"
  * ^comment = "Begründung des Must-Support: Basisinformation

  Hinweis: kann verwendet werden, wenn keine detaillierten Informationen zum Medikament (z.B. Rezepturen) existieren."
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      PZN 0..1 MS and
      ATC-DE 0..1 MS and
      SCT 0..1 MS
  * coding[PZN] only ISiKPZNCoding
    * ^patternCoding.system = $cs-pzn
  * coding[ATC-DE] only ISiKATCCoding
    * ^patternCoding.system = $cs-atc-de
  * coding[SCT] only ISiKSnomedCTCoding
    * ^patternCoding.system = $cs-sct
  * text MS
* medicationReference MS
  * ^short = "Referenz auf das Medikament (Medication-Ressource)"
  * ^comment = "Begründung des Must-Support: Basisinformation

  Hinweis: wird verwendet, wenn detaillierte Informationen zum Medikament vorliegen"
  * reference 1..1 MS
* subject MS
  * ^short = "Referenz auf den Patienten"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* subject only Reference(Patient)
  * reference 1..1 MS
* encounter MS
  * ^short = "Referenz auf den Abteilungskontakt"
  * ^comment = "Begründung des Must-Support: Basisinformation im Krankenhaus-Kontext"
  * reference 1..1 MS
* authoredOn MS
  * ^short = "Erstellungsdatum der Verordnung"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* requester MS
  * ^short = "Referenz auf die verordnende Person"
  * ^comment = "Begründung des Must-Support: Nachvollziehbarkeit"
  * reference 1..1 MS
* note MS
  * text MS
    * ^short = "Freitext-Notiz"
    * ^comment = "Begründung des Must-Support: Angabe zusätzlicher Informationen kann fachlich relevant sein"
* dosageInstruction MS
  * ^short = "Dosierungsangaben"
  * ^comment = "Begründung des Must-Support: Basisinformation. Zur vollständig strukturierten Abbildung der zahlreichen Möglichkeiten sind die hier mit Must-Support gekennzeichneten Unterelemente erforderlich gemäß Konsens der ISiK AG Medikation"
  * text MS
    * ^short = "Freitext-Dosierungsanweisungen"
  * patientInstruction MS
    * ^short = "besondere Anweisungen für den Patienten"
  * timing MS
    * ^short = "Angaben zum Timing"
    * event MS
      * ^short = "fester Zeitpunkt"
    * repeat MS
      * ^short = "Wiederholungs-Angaben"
      * boundsDuration MS
        * ^short = "Begrenzung der Dauer"
        * ^patternDuration.system = $cs-ucum
        * value 1..1 MS
        * unit MS
        * system 1..1 MS
        * code 1..1 MS
      * boundsRange MS
        * ^short = "Bereich für die Begrenzung"
        * low MS
          * ^patternQuantity.system = $cs-ucum
          * value 1..1 MS
          * unit MS
          * system 1..1 MS
          * code 1..1 MS
        * high MS
          * ^patternQuantity.system = $cs-ucum
          * value 1..1 MS
          * unit MS
          * system 1..1 MS
          * code 1..1 MS
      * boundsPeriod MS
        * ^short = "begrenzender Zeitraum"
        * start MS
        * end MS
      * count MS
        * ^short = "Anzahl Wiederholungen"
      * countMax MS
        * ^short = "maximale Anzahl Wiederholungen"
      * duration MS
        * ^short = "Dauer der Verabreichung"
      * durationMax MS
        * ^short = "maximale Dauer der Verabreichung"
      * durationUnit MS
        * ^short = "Einheit der Dauer"
      * frequency MS
        * ^short = "Frequenz (Anzahl der Gaben pro Periode)"
      * frequencyMax MS
        * ^short = "maximale Frequenz"
      * period MS
        * ^short = "Zeitperiode zur Frequenz"
      * periodMax MS
        * ^short = "maximale Zeitperiode zur Frequenz"
      * periodUnit MS
        * ^short = "Einheit der Zeitperiode"
      * dayOfWeek MS
        * ^short = "Wochentag"
      * timeOfDay MS
        * ^short = "Tageszeit"
      * when MS
        * ^short = "Tageszeitpunkt codiert"
      * offset MS
        * ^short = "zeitlicher Abstand der Gabe zum beschriebenen Zeitpunkt"
  * asNeededBoolean MS
    * ^short = "Bedarfsmedikation"
  * site MS
    * ^short = "Körperstelle der Verabreichung"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        SNOMED-CT 0..1 MS
    * coding[SNOMED-CT] only ISiKSnomedCTCoding
      * ^patternCoding.system = $cs-sct
    * text MS
  * route MS
    * ^short = "Route"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        EDQM 0..1 MS and
        SNOMED-CT 0..1 MS
    * coding[EDQM] from $vs-edqm-route (required)
    * coding[EDQM] only ISiKCoding
      * ^patternCoding.system = $cs-edqm
    * coding[SNOMED-CT] from SctRouteOfAdministration (required)
    * coding[SNOMED-CT] only ISiKSnomedCTCoding
      * ^patternCoding.system = $cs-sct
    * text MS
  * doseAndRate MS
    * ^short = "Angaben zu Dosis und Rate"
    * doseRange MS
      * ^short = "Dosisbereich"
      * low MS
      * low only MedicationQuantity
      * high MS
      * high only MedicationQuantity
    * doseQuantity MS
    * doseQuantity only MedicationQuantity
      * ^short = "Dosis"
    * rateRatio MS
      * ^short = "Raten-Verhältnis"
      * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden KÖNNEN. Beim Empfang und Verarbeitung der eingehenden Daten MÜSSEN dagegen beide Datentypen interpretiert werden können."
      * numerator 1.. MS
      * numerator only MedicationQuantity
      * denominator 1.. MS
      * denominator only MedicationQuantity
    * rateRange MS
      * ^short = "Raten-Bereich"
      * low MS
      * low only MedicationQuantity
      * high MS
      * high only MedicationQuantity
    * rateQuantity MS
    * rateQuantity only MedicationQuantity
      * ^short = "Rate"
      * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden KÖNNEN. Beim Empfang und Verarbeitung der eingehenden Daten MÜSSEN dagegen beide Datentypen interpretiert werden können."
  * maxDosePerPeriod MS
    * ^short = "Maximaldosis (Zähler) pro Zeitraum (Nenner)"
    * numerator 1.. MS
    * numerator only MedicationQuantity
    * denominator 1.. MS
    * denominator only MedicationQuantity
  * maxDosePerAdministration MS
  * maxDosePerAdministration only MedicationQuantity
    * ^short = "Maximaldosis pro Verabreichung"
* dispenseRequest MS
  * quantity MS
  * quantity only MedicationQuantity
    * ^short = "angeforderte Abgabemenge"
    * ^comment = "Begründung des Must-Support: Basisinformation"
* substitution MS
  * ^short = "Ersatz zulässig"
  * ^comment = "Begründung des Must-Support: Alignment mit dem (E-)Rezept"
  * allowedBoolean MS

Instance: ExampleISiKMedikationsVerordnung
InstanceOf: ISiKMedikationsVerordnung
Usage: #example
* extension[acceptedRisk].valueString = "Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar."
* extension[medikationsart].valueCoding = ISiKMedikationsartCS#akut
* extension[behandlungsziel].valueString = "Schmerztherapie postoperativ"
* status = #active
* intent = #order
* medicationReference.reference = "Medication/ExampleISiKMedikament1"
* subject.reference = "Patient/PatientinMusterfrau"
* encounter.reference = "Encounter/Fachabteilungskontakt"
* authoredOn = 2021-07-01
* requester.reference = "Practitioner/PractitionerWalterArzt"
* reasonReference.reference = "Condition/BehandlungsDiagnoseFreitext"
* dosageInstruction
  * timing.repeat
    * when[0] = #MORN
    * when[1] = #NOON
    * when[2] = #EVE
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "Brausetablette"
    * system = $cs-ucum
    * code = #1

Instance: ExampleISiKMedikationsVerordnung2
InstanceOf: ISiKMedikationsVerordnung
Usage: #example
* extension[medicationRequestReplaces].valueReference.reference = "MedicationRequest/77777"
* status = #active
* intent = #order
* medicationReference = Reference(ExampleISiKMedikament8)
* subject.reference = "Patient/PatientinMusterfrau"
* encounter.reference = "Encounter/Fachabteilungskontakt"
* authoredOn = 2024-01-17
* requester.reference = "Practitioner/PractitionerWalterArzt"
* dosageInstruction
  * timing.repeat
    * count = 6
    * frequency = 1
    * duration = 6
    * durationUnit = #wk
    * period = 1
    * periodUnit = #wk
  * doseAndRate.doseQuantity
    * value = 500
    * unit = "ml Infusionslösung"
    * system = $cs-ucum
    * code = #mL
