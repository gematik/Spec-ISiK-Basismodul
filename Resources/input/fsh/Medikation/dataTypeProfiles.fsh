Profile: MedicationQuantity
Parent: SimpleQuantity
Id: MedicationQuantity
Title: "Medication Quantity"
Description: "Quantity Datentyp der die Nutzung von UCUM vorgibt. Bei dimensionslosen Einheiten wie 'Tablette' wird ein code von '1' erwartet, 'Tablette' kann als String in Unit hinterlegt werden."
* insert Meta
* value 1..1 MS
* unit MS
* system 1..1 MS
* system = $cs-ucum
* code 1..1 MS
