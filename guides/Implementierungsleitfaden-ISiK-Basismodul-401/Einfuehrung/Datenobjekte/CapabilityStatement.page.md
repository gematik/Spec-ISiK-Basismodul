---
topic: CapabilityStatement
canonical: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServer
---
## Konformitätserklärung [(CapabilityStatement)](https://hl7.org/fhir/R4/capabilitystatement.html)

<fql>
from
	CapabilityStatement
where
	url = %canonical
select
	Beschreibung:description
</fql>

<fql output="transpose" headers="true">
from
	CapabilityStatement
where
	url = %canonical
select
	CanonicalURL: url, Intention: kind, Status: status, Version: version
</fql>

### Anforderungen an die FHIR-API
<fql output="transpose" headers="true">
from
    CapabilityStatement
where
    url = %canonical
select
{
     Modus: rest.mode,
     Dokumentation: rest.documentation
}
order by type
</fql>


#### Interaktionen
<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
{
     Ressourcentyp: type,
     Profile: supportedProfile,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     READ: interaction.where(code = 'read').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     SEARCH: interaction.where(code = 'search-type').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     CREATE: interaction.where(code = 'create').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     UPDATE: interaction.where(code = 'update').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     DELETE: interaction.where(code = 'delete').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value


}
order by Ressourcentyp
</fql>

#### Ressourcentyp-spezifische Operations 

<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
RessourcenTyp: type,
join operation
{
     Name: name,
     Kontext: type,
     Spezifikation: definition,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql> 

<!--#### Globale Operations 

<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.operation
select
{
     Name: name,
     Spezifikation: definition,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>-->

#### Dokumenten-Endpunkt
<fql>
from
	CapabilityStatement
where
	url = %canonical
for document
select
	Modus: mode, Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
    Dokumentation: documentation, Profil: profile
</fql>

#### Suchparameter
<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
RessourcenTyp: type,
join searchParam
{
     SuchParameter: name,
     Type: token,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     Hinweise: documentation,
     Definition: definition
}
</fql>

#### (Reverse-)Include
<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
{
     RessourcenTyp: type,
     'Include (SHALL)': searchInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='SHALL'),
    'Include (MAY)': searchInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='MAY'),
     'Reverse Include (SHALL)': searchRevInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='SHALL'),
    'Reverse Include (MAY)': searchRevInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='MAY')
}

</fql>




