/* 
Minderjähriges Kind, familienversichert über Mutter,
Selbstzahlerverhältnis mit abw. Rechnungsempfänger,
Vorstationärer, stationärer und Nachstationärer Besuch, die über einen DRG-Fall abgerechnet werden
Stationärer Aufenthalt mit Wahlleistung Begleitperson (keine Kassenleistung)

BundleVisualizer: http://clinfhir.com/bundleVisualizer.html
*/


Instance: SZ1Patient
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId]
  * type = $identifier-type-de-basis#KVZ10
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A123456789"
* identifier[Patientennummer]
  * type = $v2-0203#MR
  * system = "http://beispiel-krankenhaus.de/sid/Patienten"
  * value = "12345"
* active = true
* name[Name]
  * family = "Musterfrau"
  * given = "Töchterchen"
* gender = #female
* birthDate = "2010-01-01"

Instance: SZ1Mutter
InstanceOf: ISiKAngehoeriger
Usage: #example
* identifier[+]
  * type = $identifier-type-de-basis#KVZ10
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A987654321"
* patient = Reference(SZ1Patient)
* name
  * family = "Musterfrau"
  * given = "Mama"
* address.type = #both
* address.line = "Milchstr. 42"
* address.city = "Beispielstadt"
* address.postalCode = "78143"
* address.country = "DE"
* relationship = RoleCode#MTH

Instance: SZ1VersicherungGesetzlich
InstanceOf: ISiKVersicherungsverhaeltnisGesetzlich
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#GKV
* beneficiary = Reference(SZ1Patient)
* subscriber = Reference(SZ1Mutter)
  * identifier[+]
    * type = $identifier-type-de-basis#KVZ10
    * system = "http://fhir.de/sid/gkv/kvid-10"
    * value = "A987654321"
* payor
  * identifier
    * type = $v2-0203#XX
    * system = "http://fhir.de/sid/arge-ik/iknr"
    * value = "260326822"
  * display = "TKKG"

Instance: SZ1VersicherungSelbstzahler
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(SZ1Patient)
* payor = Reference(SZ1Mutter)

Instance: SZ1DRGFall
InstanceOf: ISiKAbrechnungsfall
Usage: #example
* identifier[Abrechnungsnummer]
  * system = "http://beispiel-krankenhaus.de/sid/fallnummern"
  * value = "0123456789"
* status = #active
* type = $v3-ActCode#IMP
* subject = Reference(SZ1Patient)
* coverage[+]
  * extension[Abrechnungsart].valueCoding = $Abrechnungsart#DRG "Diagnosebezogene Fallgruppen"
  * coverage = Reference(SZ1VersicherungGesetzlich)
* coverage[+]
  * extension[Abrechnungsart].valueCoding = $Abrechnungsart#SZ "Selbstzahlerrechnung"
  * coverage = Reference(SZ1VersicherungSelbstzahler)

Instance: SZ1Vorstationaer
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
* identifier
  * type = $v2-0203#VN
  * system = "http://beispiel-krankenhaus.de/sid/besuchsnummer"
  * value = "0123456789-1"
* status = #finished
* class = $v3-ActCode#AMB
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* type[KontaktArt] = $Kontaktart-de#vorstationaer "Vorstationär"
* subject = Reference(SZ1Patient)
* period.start = "2024-10-01"
* period.end = "2024-10-01"
* account = Reference(SZ1DRGFall)
* account.identifier  
  * system = "http://beispiel-krankenhaus.de/sid/fallnummern"
  * value = "0123456789"

Instance: SZ1Stationaer
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
* identifier
  * type = $v2-0203#VN
  * system = "http://beispiel-krankenhaus.de/sid/besuchsnummer"
  * value = "0123456789-2"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* type[KontaktArt] = $Kontaktart-de#stationaer "Stationär"
* subject = Reference(SZ1Patient)
* period.start = "2024-10-07"
* period.end = "2024-10-10"
* account = Reference(SZ1DRGFall)
* account.identifier  
  * system = "http://beispiel-krankenhaus.de/sid/fallnummern"
  * value = "0123456789"
* hospitalization.extension[Wahlleistung].valueCoding = 
  http://fhir.de/CodeSystem/wahlleistungen-de#unterkunft-und-verpflegung-begleitperson-kinder-ohne-med-begruedung "Unterkunft und Verpflegung einer Begleitperson ohne med. Begründung"
* location[+]
  * physicalType = $LocationPhysicalType#bd "Bed"
  * status = #active
  * location
    * identifier
      * system = "http://beispiel-krankenhaus.de/sid/betten"
      * value = "123"
    * display = "Bettenstellplatz 123"
* location[+]
  * physicalType = $LocationPhysicalType#ro "Room"
  * status = #active
  * location
    * identifier
      * system = "http://beispiel-krankenhaus.de/sid/zimmer"
      * value = "12"
    * display = "Zimmer 12"

Instance: SZ1Nachstationaer
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
* identifier
  * type = $v2-0203#VN
  * system = "http://beispiel-krankenhaus.de/sid/besuchsnummer"
  * value = "0123456789-3"
* status = #finished
* class = $v3-ActCode#AMB
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* type[KontaktArt] = $Kontaktart-de#nachstationaer "Nachstationär"
* subject = Reference(SZ1Patient)
* period.start = "2024-10-14"
* period.end = "2024-10-14"
* account = Reference(SZ1DRGFall)
* account.identifier  
  * system = "http://beispiel-krankenhaus.de/sid/fallnummern"
  * value = "0123456789"

Instance: Szenario1
InstanceOf: Bundle
* type = #collection
* entry[+].resource = SZ1Patient
* entry[+].resource = SZ1Mutter
* entry[+].resource = SZ1VersicherungGesetzlich
* entry[+].resource = SZ1VersicherungSelbstzahler
* entry[+].resource = SZ1Vorstationaer
* entry[+].resource = SZ1Stationaer
* entry[+].resource = SZ1Nachstationaer
* entry[+].resource = SZ1DRGFall