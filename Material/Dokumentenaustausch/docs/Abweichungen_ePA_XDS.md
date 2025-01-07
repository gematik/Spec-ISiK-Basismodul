### Abweichungen zwischen ePA-XDS und IHE-XDS

1. keine Verwendung des Ordnerkonzepts
In ePA 2.0 hinzugefügt, jedoch i.S.v. Gruppierung für Benutzerfreigaben
2. keine Verwendung von Dokumentbeziehungen
In 2.0 wurde replace hinzugefügt
3. keine Verwendung von CT für Zeitsynchronisation
Tja.
4. kein Patientenindex
Versichertennummer wird als MPI angenommen
5. kein HPD-Verzeichnis
Wird für eRezept/KIM derzeit aufgebaut, basierend auf FHIR
Spezifikation: https://simplifier.net/vzd-fhir-directory/telematikidns
(Kompatibilität zu mCSD (Teil von MHDS) angestrebt?)
6. kein ATNA Secure Node oder Secure Application für Node Authentication; stattdessen TLS 1.2 Authentisierung + VAU-Protokoll zur Schlüsselaushandlung (UMA geplant - OAuth2 Äquivalent)
Voraussichtlich nicht kompatibel zur Planung im Security-Modul (SMART), muss aber auch nicht 100% komaptibel sein, da die Anforderungen unterschiedlich sind.
7. Home Community ID identisch zur Repository Unique ID
Im Dokumenten-Modul wird auch stets nur eine Registry angenommen.
8. neues Code-System für Confidentiality Codes zur Umsetzung der Zugriffssteuerung, für Author Specialty, Practice Setting Code
Wurden inzwischen bei IHE-DE eingetütet und vor einigen Wochen Publiziert. Müssen noch in den deutschen Basisprofilen aktualisiert werden. 
9. Nachnutzung und Erweiterung des Informationsmodells aus XDM beim Anbieterwechsel – keine Verwendung der eigentlichen Transaktion ITI-32
Derzeit keine Überlappung zum Dokumenten-Modul