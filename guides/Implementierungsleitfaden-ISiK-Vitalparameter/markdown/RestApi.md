# REST-API

Es gelten die Festlegungen aus dem [Basismodul](https://simplifier.net/guide/isik-basis-v4/markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen_Rest?version=current).

## Datenübernahme - Zusammenspiel von KIS & Patientendatenmanagementsysteme (PDMS)

Jedes System ist für seine eigenen Daten verantwortlich, ein aktives Pushen per `POST` Interaktion ist nicht vorgesehen. Im Falle einer gewollten Datenübernahme zwischen Systemen greifen diese gegenseitig mittels `GET` Interaktion aufeinander zu und fragen die zu übernehmenden Daten selbstständig ab.

**Beispiel:** Bei der Überleitung eines Patienten von Intensiv- auf Normalstation sollen die letzten Blutdrücke, Sauerstoffsättigungen sowie das Körpergewicht in die Kurvenansicht des KIS übernommen werden. Hierzu wird das KIS zu einem FHIR-Client welcher die benötigten Werte vom FHIR-Endpunkt des PDMS abruft.
