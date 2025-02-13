---
topic: ImplementationGuide-markdown-Datenobjekte-Datenobjekte-ValueSet
---
## ValueSet [(ValueSet)](https://hl7.org/fhir/R4/valueset.html)

### Übersicht aller *verbindlicher* ValueSet-Bindings in diesem Modul
<fql>
from StructureDefinition

for differential.element

where binding.exists() and binding.strength = 'required'
select Pfad:id, Staerke:binding.strength, ValueSet:binding.valueSet

</fql>

### Übersicht aller *flexibler* ValueSet-Bindings
<fql>
from StructureDefinition

for differential.element

where binding.exists() and binding.strength != 'required'
select Pfad:id, Staerke:binding.strength, ValueSet:binding.valueSet

</fql>

