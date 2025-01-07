----

## Akteure
### Dokumentenserver
Das bestätigungsrelevante System nimmt die Rolle des Dokumentenservers ein. Ein Dokumentenserver nimmt Dokumente von Clients zur Speicherung/Archivierung/Verwaltung entgegen und erlaubt Clients die Suche nach und den Abruf von Dokumenten.

Der Dokumentenserver nimmt im IHE-MHD-Kontext die Rollen [Document Recipient](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133113-document-recipient) und [Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder) ein und implementiert die IHE-MHD-Interaktionen
* Simplified Publish [ITI-105] (verpflichtend)
* Generate Metadata [ITI-106] (optional)
* Find Document References [ITI-67] (verpflichtend)
* Retrieve Document [ITI-68] (verpflichtend)

### (Webbasierter/Mobiler) Client
Clients können Dokumente von einem Dokumentenserver abfragen, um sie z.B. einem Anwender anzuzeigen. Dabei können sie die für die Server verpflichtend festgelegten Suchkriterien beliebig kombinieren.
Clients sind nicht verpflichtet, alle von den Servern geforderten Suchkriterien zu unterstützen.
Weiterhin können Clients neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumentenserver übermitteln. Dabei müssen sie jedoch mindestens die in diesem Modul verpflichtend festgelegten Metadaten zu den Dokumenten bereitstellen.
Sowohl die Implementierung der Interaktion "Dokumentenabfrage" als auch "Dokumentenbereitstellung" sind für Clients optional.

Der Client nimmt im IHE-MHD-Kontext die Rollen [Document Source](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133111-document-source) und [Document  Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133112-document-consumer) ein und implementiert die IHE-MHD-Interaktionen
* Simplified Publish [ITI-105] (optional)
* Generate Metadata [ITI-106] (optional)
* Find Document References [ITI-67] (optional)
* Retrieve Document [ITI-68] (optional)

{{render:Material-Images-isikprimaerscope}} 
