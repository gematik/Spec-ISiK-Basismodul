### Kompatibilität

Dieses Profil basiert auf dem [Profil "MHD DocumentReference Comprehensive UnContained References Option" (Version 4.2.0) von IHE International](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.UnContained.Comprehensive.DocumentReference.html).

### Abweichungen vom IHE-Profil

* Die Verwendung von `DocumentReference.docStatus` ist im ISiK-Kontext gestattet.
* `DocumentReference.category` muss vom Client bei Vorhandensein eines KDL-Codes in `DocumentReference.type` nicht gefüllt werden. Bei der Verarbeitung auf dem Server im Rahmen der Interaktion "Dokumentenbereitstellung" wird `DocumentReference.category` anhand der [KDL-Mappings](https://simplifier.net/kdl/~resources?category=ConceptMap&sortBy=RankScore_desc) ergänzt und damit die IHE-Kompatibilität hergestellt.
* `DocumentReference.sourcePatientInfo` muss im Rahmen von ISiK nicht gefüllt werden


### Einschränkungen des IHE-Profils
Elemente mit ValueSet-Bindings ohne verbindliche Vorgabe seitens IHE wurden auf die in Deutschland gebräuchlichen Terminologien (gemäß der Festlegungen von IHE Deutschland e.V.) eingeschränkt.


