Profile: ISiKStandort
Parent: Location
Id: ISiKStandort
Description: "Dieses Profil dient der strukturierten Erfassung von Standortangaben eines 
Krankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien.  
### Motivation
In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.

Die Abbildung von Standorten in einem Krankenhaus unterstützt u.a. die Raum- und Bettenbelegung in strukturierter Form. 

Die Erfassung des Standortes in strukturierter Form soll u.a. ermöglichen:
- Zuweisungen von Diensten an bestimmte Standorte im Rahmen des Terminmanagements
- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär) - u.a. für 
    - Patientenportale im Rahmen der Terminbuchung, z.B. um den Wunsch nach Einzelbett, bzw. 1 oder 2 Betten abzubilden
    - KIS und weitere Subsysteme:
      - zur Patientenabholung und Information für den Transportdienst
      - Abbildung der Verfügbarkeit eines spezifischen Bettenstellplatzes (z.B. mit spezifischem Monitoring-Device) 
- Im Rahmen der Versorgung kann eine der folgenden Beispiel-Fragen beantworten werden:
    - Handelt es sich um ein Isolationszimmer?
    - Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte?
    - etc.

Dafür werden Standort-Profile in unterschiedlicher Granularität definiert. 

### Kompatibilität
Für das Profil ISiKStandort wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der 
Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.  
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
"
* insert Meta
* identifier MS 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location"
* identifier contains 
  standortnummer-dkg 0..1 MS
* identifier[standortnummer-dkg] only $identifier-standortnummer-dkg
  * ^patternIdentifier.system = $identifier-standortnummer-dkg-system
  * ^comment = "Motivation : Entsprechend der Festlegung der DKG laut Basisprofile-DE 1.5.0 (https://simplifier.net/packages/de.basisprofil.r4/) "
* name MS 
  * ^comment =  "Motivation: Kein Name zwingend notwendig (z.B. für ein Zimmer), wenn über .identifier identifizierbar; weicht daher ab von https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location"
* mode MS 
  * ^comment = "Motivation: Die Einschränkung auf \"instance\" erfolgt, da im  ISiK-Kontext ausschließlich konkrete Standorte übertragen werden sollen. Hiermit wird zusätzlich die Kompatibilität zur MII-Spezifikation eines Standortes gewahrt https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location"
* mode = #instance
* type MS
  * ^comment = "Motivation: Ein System muss den Typ eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* address MS
  * ^comment = "Motivation: Bei Verfügbarkeit einer Adresse muss ein System diese Information bereitstellen. Darüber hinaus muss das abrufende System diese Information verarbeiten können."
* address only AddressDeBasis
* physicalType 1..1 MS

  * ^comment = "Motivation: entspricht der MII Vorgabe -  siehe https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location. Ein System muss den physikalischen Typ eines Standorts zum Abruf bereitstellen, da ansonsten der Typus des Standorts nicht maschinenlesbar definiert ist."

* position MS 
  * ^comment = "Motivation: Ein System muss die Geodaten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* managingOrganization 1..1 MS 
  * ^comment = "Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location"
* partOf MS
  * ^comment = "Motivation: Ein System muss die organisationale Zugehörigkeit eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* hoursOfOperation MS
  * ^comment = "Motivation: Ein System muss die Betriebszeiten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."

Profile: ISiKStandortRaum
Parent: ISiKStandort
Id: ISiKStandortRaum
Description: "Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses."
* insert Meta
* physicalType = $LocationPhysicalType#ro "Room"
* operationalStatus MS  
* operationalStatus from $v2-0116-BedStatus
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Raums zum Abruf bereitstellen, sofern diese Information verfügbar ist. Dies dient z.B. der Markierung als 'Isoliert'."

Profile: ISiKStandortBettenstellplatz
Parent: ISiKStandort
Id: ISiKStandortBettenstellplatz
Description: "Dieses Profil dient der strukturierten Erfassung von Bettenstellplätzen (als Standorten) 
eines Krankenhauses.  
### Hinweis  
Ein einzelnes Bett als Gegenstand kann als FHIR-Ressource 'Device' abgebildet werden, 
das einen Bettenstellplatz referenziert.
"
* insert Meta
* physicalType = $LocationPhysicalType#bd "Bed" // Dies entspreicht der Definition des VS "This is not the physical bed/trolley that may be moved about, but the space it may occupy."
* operationalStatus MS
* operationalStatus from $v2-0116-BedStatus
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Bettenstellplatz zum Abruf bereitstellen, sofern diese Information verfügbar ist. Dies dient z.B. der Markierung als 'Isoliert'. Im Sinne der Interoperabilität ist das ValueSet verpflichtend."


Instance: RaumStandortBeispiel
InstanceOf: ISiKStandortRaum
Usage: #example
* physicalType = $LocationPhysicalType#ro "Room"
* managingOrganization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)

Instance: BettenstellplatzStandortBeispiel
InstanceOf: ISiKStandortBettenstellplatz
Usage: #example
* physicalType = $LocationPhysicalType#bd "Bed"
* managingOrganization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)
* partOf = Reference(RaumStandortBeispiel)

Instance: StationStandortBeispiel
InstanceOf: ISiKStandort /* noch kein eigenes Profil vorhanden*/
Usage: #example
* identifier.system = "http://fhir.de/sid/dkgev/standortnummer"
* identifier.value = "123456"
* operationalStatus = $v2-0203#O "Occupied"
* name = "Station A"
* mode = #instance
* type = $v3-RoleCode#_LocationIdentifiedEntityRoleCode /* überprüfen*/
* address.line = "Krankenhausstraße 123"
* address.city = "Musterstadt"
* address.postalCode = "12345"
* physicalType = $LocationPhysicalType#wa "Ward"
* position.latitude = 52.5200
* position.longitude = 13.4050
* managingOrganization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)
// * partOf = Reference(KrankenhausStandortBeispiel) /* noch kein entsprechendes Beispiel vorhanden*/

* hoursOfOperation[0].daysOfWeek = #mon
* hoursOfOperation[0].daysOfWeek = #tue
* hoursOfOperation[0].daysOfWeek = #wed
* hoursOfOperation[0].daysOfWeek = #thu
* hoursOfOperation[0].daysOfWeek = #fri
* hoursOfOperation[0].allDay = true
* hoursOfOperation[1].daysOfWeek = #sat
* hoursOfOperation[1].daysOfWeek = #sun
* hoursOfOperation[1].closingTime = 20:00:00

