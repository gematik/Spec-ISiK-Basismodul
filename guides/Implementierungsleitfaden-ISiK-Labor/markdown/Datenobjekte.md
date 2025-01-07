# Datenobjekte

Folgende Datenobjekte aus dem Modul [ISiK Basis Stufe 4](https://simplifier.net/guide/isik-basis-v4?version=current) werden in diesem Modul verwendet:
* [Patient](https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_Patient?version=current)

Falls in einem Anwendungsfall Laborwerte kommuniziert werden, für die in diesem Implementierungsleitfaden kein spezifisches Profil existiert, SOLL hierfür das generische Profil ISiKLaboruntersuchung unter Verwendung geeigneter LOINC-Codes sowie Einheiten verwendet werden. 
<!---

**TBD**

**TODO: Searchparameter (vorläufige Liste, noch zu detaillieren)**
- category(?)
- code
- date
- encounter (+ chained)
- patient (+ chained)
- status
- value-quantity

-->

Die Verwendung in diesem Modul bedeutet:
Wenn dieses Modul auf Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen konform zu den Vorgaben aus dem Basismodul sein.
Die Referenzierung von im Basismodul spezifizierten Datenobjekten, bedeutet nicht, dass die Interaktionen für die entsprechenden Datenobjekte aus dem Basismodul auch im Modul Labor bestätigungsrelevant sind.

Darüber hinaus gelten in diesem Modul folgende Datenobjekt-spezifische Festlegungen:

{{index:current}}
