Profile: ISiKMedikationsVerabreichung
Parent: MedicationAdministration
Id: ISiKMedikationsVerabreichung
Description: "Dieses Profil ermöglicht die Abbildung der Verabreichung von Medikamenten für einen Patienten in ISiK Szenarien."
* insert Meta
* status MS
  * ^short = "Status der Verabreichungsinformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard"
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
* context MS
  * ^short = "Referenz auf den Abteilungskontakt"
  * ^comment = "Begründung des Must-Support: Basisinformation im Krankenhaus-Kontext"
  * reference 1..1 MS
* effectiveDateTime MS
  * ^short = "Zeitpunkt der Verabreichung"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* effectivePeriod MS
  * ^short = "Zeitraum der Verabreichung"
  * ^comment = "Begründung des Must-Support: Basisinformation"
  * start MS
  * end MS
* performer MS
  * actor MS
    * ^short = "Referenz auf die verabreichende Person"
    * ^comment = "Begründung des Must-Support: Nachvollziehbarkeit"
    * reference 1..1 MS
* reasonCode MS
  * ^short = "Grund der Medikation (Referenz)"
  * ^comment = "  Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können."
* reasonReference MS
  * ^short = "Grund der Medikation (Referenz)"
  * ^comment = "  Festlegung zum MS: Die Elemente .reasonCode und .reasonReference MÜSSEN nach OR-Logik in der Ausgabe verwendet werden, d.h. nur eines MUSS geliefert werden können. Weiterhin MÜSSEN beide Elemente interpretiert werden können."
  * reference 1..1 MS
* note MS
  * text MS
    * ^short = "Freitext-Notiz"
    * ^comment = "Begründung des Must-Support: Angabe zusätzlicher Informationen kann fachlich relevant sein"
* dosage MS
  * ^short = "Dosierungsangaben"
  * ^comment = "Begründung des Must-Support: Basisinformation. Zur vollständig strukturierten Abbildung der zahlreichen Möglichkeiten sind die hier mit Must-Support gekennzeichneten Unterelemente erforderlich gemäß Konsens der ISiK AG Medikation"
  * text MS
    * ^short = "Freitext-Dosierungsangabe"
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
  * dose MS
  * dose only MedicationQuantity
    * ^short = "verabreichte Dosis"
  * rateRatio MS
    * ^short = "Verabreichungs-Rate (Verhältnis)"
    * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden können. Beim Empfang und Verarbeitung der eingehenden Daten müssen dagegen beide Datentypen interpretiert werden können."
    * numerator 1.. MS
    * numerator only MedicationQuantity
    * denominator 1.. MS
    * denominator only MedicationQuantity
  * rateQuantity MS
  * rateQuantity only MedicationQuantity
    * ^short = "Verabreichungs-Rate"
    * ^comment = "Das Must-Support-Flag auf rateRatio bzw. rateQuantity bedeutet, dass produzierende Systeme zur Kodierung der Ratenangaben nach eigenem Ermessen entweder den Datentyp Ratio oder Quantity verwenden können. Beim Empfang und Verarbeitung der eingehenden Daten müssen dagegen beide Datentypen interpretiert werden können."

Instance: ExampleISiKMedikationsVerabreichung
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference.reference = "Medication/ExampleISiKMedikament1"
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* effectiveDateTime = 2021-07-01
* dosage
  * dose
    * value = 1
    * unit = "Tablette"
    * system = $cs-ucum
    * code = #1

Instance: ExampleISiKMedikationsVerabreichung2
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference = Reference(ExampleISiKMedikament9)
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* effectiveDateTime = 2024-01-22
* dosage
  * dose
    * value = 1
    * unit = "Beutel"
    * system = $cs-ucum
    * code = #1

Instance: ExampleISiKMedikationsVerabreichung3
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference = Reference(Medication-Read-Example)
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* context.identifier.value = "0123456789"
* effectiveDateTime = 2021-07-01
* note.text = "Testnotiz"
* dosage
  * text = "1L Infusion mit Rate 50ml/h"
  * site = $cs-sct#6073002 "Structure of ligament of left superior vena cava"
  * dose
    * value = 1000
    * unit = "mL"
    * system = $cs-ucum
    * code = $cs-ucum#mL
  * rateQuantity
    * value = 50
    * unit = "mL/h"
    * system = $cs-ucum
    * code = $cs-ucum#mL/h
  * route = $cs-sct#255560000 "Intravenous"

Instance: ExampleISiKMedikationsVerabreichung4
InstanceOf: ISiKMedikationsVerabreichung
Usage: #example
* status = #completed
* medicationReference = Reference(Medication-Read-Example)
* subject.reference = "Patient/PatientinMusterfrau"
* context.reference = "Encounter/Fachabteilungskontakt"
* context.identifier.value = "0123456789"
* effectiveDateTime = 2021-07-01
* note.text = "Testnotiz"
* dosage
  * text = "1L Infusion mit Rate 50ml/h"
  * site = $cs-sct#6073002 "Structure of ligament of left superior vena cava"
  * dose
    * value = 1000
    * unit = "mL"
    * system = $cs-ucum
    * code = $cs-ucum#mL
  * rateRatio
    * numerator
      * value = 50
      * unit = "mL"
      * system = $cs-ucum
      * code = $cs-ucum#mL
    * denominator
      * value = 1
      * unit = "h"
      * system = $cs-ucum
      * code = $cs-ucum#h
  * route = $cs-sct#255560000 "Intravenous"
