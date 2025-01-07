Mapping:  CompositionDocumentReferenceMapping
Source:   ISiKDokumentenMetadaten 
Target:   "http://hl7.org/fhir/StructureDefinition/Composition"
Id:       CompositionDocumentReferenceMapping
Title:    "Metadaten eines strukturieren Dokumentes (Document-Bundle)"
//Syntax:
//* -> "{map string}" "{comment string}" #{mime-type code}
//* <element> -> "{map string}" "{comment string}" #{mime-type code}

//* -> "Dokument-Bundle"
* masterIdentifier -> "Bundle.identifier" 
* identifier -> "Composition.identifier"
* status -> "=current"
* docStatus -> "Composition.status"
* type.coding[KDL] -> "Composition.type.coding[KDL]" 
* type.coding[XDS] -> "Composition.type.coding[XDS]" "Kann mittels Lookup in den KDL->XDS ConceptMaps anhand des KDL-Type-Codes ermittelt werden"
* category.coding[XDS] -> "Composition.category.coding[XDS]" "Kann mittels Lookup in den KDL->XDS ConceptMaps anhand des KDL-Type-Codes ermittelt werden"
* subject -> "Lookup Composition.subject.resolve().identifier[PID]" "Ermittlung des korrekten Patienten auf dem Server anhand des Identifiers (PID) und/oder weiterer Kriterien erforderlich"
* author -> "Composition.author"
* relatesTo.target -> "Lookup Composition.relatesTo.targetReference.resolve().identifier" "Ermittlung der zu ersetzenden DocumentReference anhand des identifiers der referenzierten Composition erforderlich"
* relatesTo.code -> "Composition.relatesTo.code"
* description -> "Composition.title"
* content.attachment.contentType -> "`application/html` für den extrahierten Narrative, `application/fhir+xml` oder `application/fhir+json` für das Bundle"
* content.attachment.language -> "=de sofern keine abweichende Angabe in Composition.language"
* content.attachment.creation -> "Composition.date"
* content.attachment.url -> "vom Server festgelegter Speicherort des Bundles/Narratives"
* content.format -> "=urn:ihe:iti:xds:2017:mimeTypeSufficient"
* context.encounter -> "Lookup Composition.encounter.resolve().identifier" "Ermittlung des korrekten Encounters auf dem Server anhand des Identifiers(Fallnummer) und/oder weiterer Kriterien erforderlich"
* context.facilityType -> "=KHS, sofern nichts anderes bekannt"