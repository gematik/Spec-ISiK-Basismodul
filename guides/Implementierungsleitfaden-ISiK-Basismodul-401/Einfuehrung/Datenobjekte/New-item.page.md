---
canonical: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServer
---
## {{page-title}}

#### (Reverse-)Include mit Verbindlichkeit


<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
RessourcenTyp: type, 
join searchInclude
{
     
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>

#### (Reverse-)Include verbindlich
<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
{
     RessourcenTyp: type,
     'Include (verbindlich)': searchInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='SHALL'),
    'Include (optional)': searchInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='MAY'),
     'Reverse Include (verbindlich)': searchRevInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='SHALL'),
    'Reverse Include (optional)': searchRevInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='MAY')
}

</fql>

#### (Reverse-)Include optional
<fql>
from
    CapabilityStatement
where
    url = %canonical
select
    RessourcenTyp: rest.resource.type,
    Include: rest.resource.searchInclude,
for rest.resource.searchInclude
  select
{

     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value

}

</fql>