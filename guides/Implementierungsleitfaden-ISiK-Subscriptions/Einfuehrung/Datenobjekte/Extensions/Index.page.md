## {{page-title}}

## Verwendete Extensions
<fql>
from StructureDefinition

for differential.element

where type.code = 'Extension'
select Pfad:id, Extension: type.profile

</fql>

