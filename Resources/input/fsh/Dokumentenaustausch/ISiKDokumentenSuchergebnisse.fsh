Profile: ISiKDokumentenSuchergebnisse
Parent: Bundle
Id: ISiKDokumentenSuchergebnisse
Title: "Suchergebnisse einer Dokumentensuche"
* insert Meta
* type MS
* type = #searchset (exactly)
  * ^short = "Bundle-Typ"
  * ^comment = "Fix: `searchset`"
* total 1..
  * ^short = "Gesamtzahl der Suchtreffer"
  * ^comment = "Gesamtzahl der Suchtreffer auf dem Server, unabhängig vom Page-Size des aktuellen Bundles"
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry contains DocumentReference 0..* MS
* entry[DocumentReference] 
  * ^short = "Suchergebnis"
  * ^comment = "Jedes Suchergebnis wird in einer separaten `entry` abgebildet. Bundles mit `total = 0` haben keine `entry`" 
* entry[DocumentReference]
  * fullUrl 1.. MS
    * ^short = "Serverseitige URL der Ressource"
    * ^comment = "Serverseitige URL der Ressource in `entry.resource`"
  * resource 1.. MS
  * resource only ISiKDokumentenMetadaten
    * ^short = "Eingebettete Ressource"
    * ^comment = "Eingebettete Ressource (hier: DocumentReference, die den Suchkriterien entspricht)"

Instance: Suchergebnis-Beispiel
InstanceOf: ISiKDokumentenSuchergebnisse
Usage: #example
Title: "Suchergebnis-Beispiel"
* total = 1
* link 
  * relation = #self
  * url = "http://meinfhirserver.de/DocumentReference?patient.identifier=A123456789"
* entry.fullUrl = "http://meinfhirserver.de/DocumentReference/dok-beispiel-server"
* entry.resource = dok-beispiel-server
