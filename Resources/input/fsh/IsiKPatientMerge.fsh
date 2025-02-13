Profile: ISiKPatientMergeSubscription
Parent: BackportSubscription
Id: ISiKPatientMergeSubscription
Description: "Patient Merge Subscription  
### Motivation

Subscription ist eine FHIR Ressource, um als Client-System Benachrichtigungen über Events auf dem FHIR Server anzufragen. Der Subscription Mechanismus in FHIR R4 ist nicht geeignet, um alle relevanten Events (hier im Speziellen das Mergen von Patienten) zu unterstützen. Daher basiert das ISiK Subscription-Profil auf dem [Subscriptions R5 Backport Profil von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/StructureDefinition-backport-subscription.html).

Siehe auch: {{pagelink:Patient-merge, text:Use Case Patient-merge}}

Um als Subsystem über ein Patienten-Merge-Event informiert zu werden, KANN der FHIR Subscription Mechanismus gemäß des [Subscriptions R5 Backport IGs von HL7](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/index.html) genutzt werden.

### Kompatibilität

Das Profil PatientMergeSubscription basiert auf dem [Backport-Subscription Profil](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription.html).  
Der [SubscriptionStatus](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-status-r4.html), sowie das [Subscription Notification Bundle](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription-notification-r4.html) werden unverändert direkt aus dem [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/index.html) genutzt.  

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* ^fhirVersion = #4.0.1
* status MS
  * ^short = "Status"
  * ^comment = "**Bedeutung:** Der Status der Subscription, der den Serverstatus der Subscription angibt. 
  Neue Subscriptions werden immer mit dem Status `requested` an den Server übergeben. 
  Der Server ändert im Anschluss den Status auf `active` oder im Fehlerfall auf `error`.  
  **Hinweise:** Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)"
* reason MS
  * ^short = "Grund wieso diese Subscription erstellt wurde"
  * ^comment = "**Bedeutung:** Beschreibung wieso diese Subscription erstellt wurde."
* criteria = $patient-merge-topic
  * ^short = "Patient Merge Subscription Topic"
  * ^comment = "**Bedeutung:** Canonical URL des Subscription-Topics, aktuell wird nur das Patient Merge Subscription Topic unterstützt: https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge
**Hinweise:** Siehe [Subscriptions R5 Backport](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-subscription.html)"
* channel MS
  * ^short = "Benachrichtigungsweg"
  * ^comment = "**Bedeutung:** Der Benachrichtigungsweg, über den Subscription-Benachrichtigungen gesendet werden sollen."
  * type MS
    * ^short = "Typ des Kommunikationskanals"
    * ^comment = "rest-hook | websocket"
  * type from RestAndWSSubscriptionChannelType
  * endpoint MS
    * ^short = "Endpunkturl"
    * ^comment = "**Bedeutung:** URL des Kommunikationskanals/ Endpunkts, an den Subscription-Benachrichtigungen gesendet werden sollen. Dies ist nur für rest-hook Subscriptions relevant."
  * payload MS
    * ^short = ""
    * ^comment = "**Bedeutung:** Format in dem Subscription Notifications versendet werden sollen (JSON oder XML)
    **Hinweise:** Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)"
  * payload from FhirMimeTypeVS
    * ^short = "Mime Type der Subscription Benachrichtigung"
    * ^comment = "application/fhir+json | application/fhir+xml"
    * extension[content] MS
      * ^short = "Inhalt der Benachrichtigung"
      * ^comment = "**Bedeutung:** Welcher Ressourceninhalt in der Nutzlast der Benachrichtigung geliefert werden soll. Zur Auswahl stehen eine leere Nutzlast (`empty`), nur die Ressourcen-id (`id-only`) oder der gesamte Inhalt der Ressource (`full-resource`).
**Hinweise:** Siehe [Extension: Backport R5 Subscription Payload Content Information](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-backport-payload-content.html)"
  * header MS
    * ^short = "Falls eine REST-Enpunkt einen Authorization-Header benötigt, kann dieser hier gesetzt werden"
    * ^comment = "**Bedeutung:** http-Header welcher dazu genutzt werden kann einen Authorization-header zu setzen. Dies ist nur für rest-hook Subscriptions relevant.  
    **Hinweise:** ACHTUNG: dieses Datenfeld muss bei READ-Interaktionen maskiert werden! Siehe [R4 Subscriptions](https://hl7.org/fhir/R4/subscription.html)"


Instance: PatientMergeSubscriptionExample
InstanceOf: ISiKPatientMergeSubscription
Usage: #example
* status = #requested
* reason = "Patient merge subscription"
* criteria = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge"
* channel
  * type = #rest-hook
  * endpoint = "http://localhost:8081/fhir/Bundle"
  * payload = #application/fhir+json
    * extension[content].valueCode = #full-resource
  * header = "Authorization: Bearer xxxxxxxxxx"

Instance: DorisQuelle
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A123456789"
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "654321"
* active = false
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"

Instance: DorisZiel
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A123456789"
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "123456"
* active = true
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"


/*This ressource should not be continously generated, since assigning identical IDs is a problem.
ID was changed directly in JSON in order to be conformant to merge-behaviour as requested in FHIR R5 $merge.
Instance: DorisResultat
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A123456789"
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "123456"
* active = true
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"
* link
  * other.identifier
    * system = "https://fhir.krankenhaus.example/sid/PID"
    * value = "654321"
  * type = #replaces
*/ 

Instance: SubscriptionNotificationBundleExample
InstanceOf: Bundle
Usage: #example
* type = #history
* entry[+]
  * fullUrl = "urn:uuid:9bb6fcbd-8391-4e35-bd4c-620a2db47af0"
  * resource = SubscriptionNotification
  * request.method = #GET
  * request.url = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge/$status"
  * response.status = "200"
* entry[+]
  * fullUrl = "http://example.org/fhir/Patient/DorisQuelle"
  * resource = DorisQuelle
  * request.method = #PUT
  * request.url = "Patient"
  * response.status = "201"

Instance: SubscriptionNotification
InstanceOf: Parameters
Usage: #inline
* meta.profile = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4"
* parameter[+].name = "subscription"
* parameter[=].valueReference = Reference(Subscription/1)
* parameter[+].name = "topic"
* parameter[=].valueCanonical = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge"
* parameter[+].name = "status"
* parameter[=].valueCode = #active
* parameter[+].name = "type"
* parameter[=].valueCode = #event-notification
* parameter[+].name = "events-since-subscription-start"
* parameter[=].valueString = "1"
* parameter[+].name = "notification-event"
* parameter[=].part[0].name = "event-number"
* parameter[=].part[=].valueString = "1"
* parameter[=].part[+].name = "timestamp"
* parameter[=].part[=].valueInstant = "2024-02-22T18:30:05+01:00"
* parameter[=].part[+].name = "focus"
* parameter[=].part[=].valueReference = Reference(DorisQuelle)

