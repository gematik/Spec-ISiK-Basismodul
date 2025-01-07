Profile: ISiKMedikationsListe
Parent: List
Id: ISiKMedikationsListe
Title: "ISiK Medikationsliste"
Description: "Dieses Profil ermöglicht die Zusammenführung einzelner MedikationsInformationen eines Patienten in ISiK Szenarien."
* insert Meta
* status MS
  * ^short = "(Aktualitäts-)Status der Liste"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard"
* mode MS
* mode from MedikationsListeListModeVS
  * ^short = "Listenmodus"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard

  Beispiel: eingelesene Medikationspläne werden als snapshot repräsentiert. Kontinuierlich fortgeschriebene Listen, z.B. im Rahmen der hausinternen Behandlung, sind als 'working' codiert."
* code 1.. MS
  * ^short = "Art der Liste."
  * ^comment = "Begründung des Must-Support: Dient der Differenzierung zu anderen Listen.

  Hinweis: Es ist mindestens ein Coding mit dem Code 'medications' anzugeben. Weitere Codes, z.B. im Kontext anderer Spezifikationen oder Hauscodierungen sind zulässig."
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      medications 1.. MS
  * coding[medications]
    * ^patternCoding.system = "http://terminology.hl7.org/CodeSystem/list-example-use-codes"
    * ^patternCoding.code = #medications
    * system 1.. MS
    * code 1.. MS
    * display MS
* subject 1.. MS
  * ^short = "Referenz auf den Patienten"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* subject only Reference(Patient)
  * reference 1.. MS
* encounter MS
  * ^short = "Referenz auf den Abteilungskontakt"
  * ^comment = "Begründung des Must-Support: Basisinformation im Krankenhaus-Kontext"
  * reference 1.. MS
* date MS
  * ^short = "Erstellungsdatum der Liste"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* entry MS
  * ^short = "Listeneintrag"
  * date MS
    * ^short = "Datum des Listeneintrags"
    * ^comment = "Begründung des Must-Support: Nachvollziehbarkeit

    Hinweis: nur zulässig im Listenmodus 'working'"
  * item MS
    * ^short = "Referenz auf die MedikationsInformation"
    * ^comment = "Begründung des Must-Support: Basisinformation (eigentlicher Zweck der Liste ist das Verbinden mehrerer MedikationsInformationen)"
  * item only Reference(MedicationStatement)
    * reference 1.. MS

Instance: ExampleISiKMedikationsListe
InstanceOf: ISiKMedikationsListe
Usage: #example
* status = #current
* mode = #working
* subject.reference = "Patient/PatientinMusterfrau"
* encounter.reference = "Encounter/Fachabteilungskontakt"
* date = 2021-07-04
* entry[+]
  * date = 2021-07-01
  * item.reference = "MedicationStatement/ExampleISiKMedikationsInformation1"
* entry[+]
  * date = 2021-07-04
  * item.reference = "MedicationStatement/ExampleISiKMedikationsInformation2"

Instance: ExampleISiKMedikationsListeParkinson
InstanceOf: ISiKMedikationsListe
Usage: #example
* status = #current
* mode = #working
* subject.reference = "Patient/PatientinMusterfrau"
* encounter.reference = "Encounter/Fachabteilungskontakt"
* date = 2024-02-20
* entry[+]
  * date = 2024-02-20
  * item.reference = "MedicationStatement/ExampleISiKMedikationsInformationParkinson1"
* entry[+]
  * date = 2024-02-20
  * item.reference = "MedicationStatement/ExampleISiKMedikationsInformationParkinson2"
* entry[+]
  * date = 2024-02-20
  * item.reference = "MedicationStatement/ExampleISiKMedikationsInformationParkinson3"
* entry[+]
  * date = 2024-02-20
  * item.reference = "MedicationStatement/ExampleISiKMedikationsInformationParkinson4"
* entry[+]
  * date = 2024-02-20
  * item.reference = "MedicationStatement/ExampleISiKMedikationsInformationParkinson5"
