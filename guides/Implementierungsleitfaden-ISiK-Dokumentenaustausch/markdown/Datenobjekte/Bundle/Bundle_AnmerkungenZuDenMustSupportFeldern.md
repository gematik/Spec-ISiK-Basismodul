### Anmerkungen zu Must-Support-Feldern

@```from
	StructureDefinition
where 
    url = 'https://gematik.de/fhir/isik/StructureDefinition/Profile: ISiKDokumentenSuchergebnisse' 
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```