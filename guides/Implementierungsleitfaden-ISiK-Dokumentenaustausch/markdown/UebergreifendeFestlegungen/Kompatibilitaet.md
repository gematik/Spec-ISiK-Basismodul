
## Kompatibilität zu IHE-Profilen

Die Festlegungen in diesem ISiK-Modul wurden auf Grundlage des [IHE-MHD-Profils](https://build.fhir.org/ig/IHE/ITI.MHD/) getroffen.
Wo die Festlegungen seitens IHE zu eng gefasst waren, um die Kompatibilität wahren zu können, ohne die Umsetzung der ISiK Use Cases einzuschränken, wurden [entsprechende Change-Requests bei IHE Int.](https://github.com/IHE/ITI.MHD/issues?q=is%3Aissue+author%3AsimoneOnFhir+) eingereicht, mit dem Ziel, die Kompatibilität in künftigen Releases von IHE-MHD wieder herzustellen.

Die Intention der ISiK-Spezifikation ist es, die IHE-Interaktionen auf das notwendige Minimum für die einrichtungsinterne Kommunikation zu reduzieren, dabei jedoch alle erforderlichen Dokumenten-Metadaten für eine spätere Weitergabe der Dokumente an z.B. eine ePA oder ein IHE-MHD-basiertes Repository zu erheben. 

Das IHE-MHD Profil ist kompatibel zu IHE-XDS. Die Mappings von MHD zu XDS sind seitens IHE definiert. 

Dabei ist jedoch zu beachten, dass bei der Einstellung von Dokumenten in eine IHE-Registry weitere Metadaten über den Vorgang des Einstellens (Abgebildet im IHE-Konzept "SubmissionSet") hinzugefügt werden müssen, die im Kontext der ISiK Spezifikation keine Berücksichtigung finden.

Als Terminologien kommen bei ISiK - soweit sinnvoll und möglich - die XDS-ValueSets von IHE Deutschland zum Einsatz.

### Abweichungen zwischen ISiK und IHE-MHD

#### Dokumentenbereitstellung (gelöst)
Die Bereitstellung von Dokumenten (Übermittlung von Client an den Server) ist in IHE-MHD als [Transaction](https://hl7.org/fhir/R4/http.html#transaction) definiert.

Dabei ist jedoch zu beachten, dass eine Transaction in FHIR definiert ist, als die Ausführung mehrerer einzelner REST-Interaktionen in einem transaktionalen Kontext. Eine Transaction hat keinen Namen und außer der Verarbeitung nach dem "Ganz oder gar nicht"-Prinzip keine andere Logik als die äquivalente Sequenz der einzelnen REST-Interaktionen.

Innerhalb einer Transaktion sind folglich sämtliche Permutationen von REST-Interaktionen zulässig, die ein Server laut seinem Capability-Statement bereitstellt. Die Implementierung erfolgt generisch, als transaktionale Ausführung der einzelnen Interaktionen. Es gibt keine Transaktionen mit "besonderer Bedeutung".

Gegen dieses Prinzip verstößt die Festlegung in IHE-MHD.
Erstens ist die Ausführung der in der Transaktion definierten Interaktionen als atomare REST-Interaktionen in IHE-MHD nicht definiert, zweitens soll bei der Ausführung der Transaktion in MHD erweiterte Business-Logik ausgeführt werden, die fest mit *dieser* Transaktion verknüpft ist.
Die Implementierung von IHE-MHD ist unproblematisch, solange sie die einzige Transaktion ist und bleibt, die auf diesem Server bereitgestellt wird und Client und Server ein implizites Einverständnis darüber haben, dass *ausschließlich* diese eine Transaktion in der von IHE definierten Form mit der von IHE definierten Logik ausgeführt werden kann. 

Sobald ein Server jedoch weitere Transaktionen implementieren möchte, kommt es zu Problemen, da der generische Ansatz nicht mehr möglich ist. Die verschiedenen Transaktionen sind für Client sowie Server nicht mehr unterscheidbar/identifizierbar. 

Die Problematik wird in der internationalen FHIR-Community diskutiert und [IHE prüft derzeit](https://github.com/IHE/ITI.MHD/issues/100), ob eine Anpassung der Spezifikation verfolgt werden soll.

##### Update für ISiK Stufe 3
In ISiK Stufe 2 kam aufgrund der beschriebenen Problematik anstelle der Transaktion die im Rahmen von ISiK spezifizierte Operation "$submit-document" zum Einsatz. 
Zwischenzeitlich ist IHE der oben genannten Argumentation gefolgt und lässt als Alternative zur Transaction die Übermittlung von Dokumenten als einfache CREATE-Interaktion zu (IHE MHD ITI-105 "Simplified Publish").

Zur Angleichung an diese Entwicklung und der Harmonisierung mit IHE MHD tritt in Stufe 3 nun ITI-105 an Stelle der zuvor spezifizierten Operation.
Dies entspricht zwar einem "Breaking Change" zwischen Stufe 2 und Stufe 3, die Inkompatibilität zu IHE-MHD besteht dadurch jedoch in Stufe 3 nicht mehr.


#### Fallkontext (gelöst)

In IHE-MHD bzw. XDS ist kein Fallkontext für Dokumente vorgesehen. Bestenfalls kann die Fallnummer (ein Identifier!) als zusätzlicher Code in der EventCodeList verwahrt werden. In der FHIR-Architektur (und in allen weiteren ISiK-Modulen) wird ein Fallkontext jedoch durch die Verlinkung auf einen Encounter etabliert.
In dieser ISiK-Spezifikation kommt ebenfalls die Verlinkung zum Einsatz, da der Wunsch nach einer Harmonisierung mit der FHIR-Kernspezifikation und allen anderen ISiK-Modulen dem Wunsch nach Harmonisierung mit IHE-XDS überwiegt.
Um die technische Kompatibilität mit dem DocumentReference-Profil von IHE-MHD zu wahren [wurde der Änderungswunsch an IHE herangetragen](https://github.com/IHE/ITI.MHD/issues/88), den Constraint, der die Encounter-Verlinkung verbietet, zu lockern.

##### Update für ISiK Stufe 3
Der Change-Request wurde seitens IHE angenommen und in IHE-MHD Version 4.2.0 angewendet. Die Inkompatibilität wurde damit beseitigt!

#### Dokumentenstatus
Vor dem Hintergrund des einrichtungsübergreifenden Dokumentenaustausches geht IHE-MHD davon aus, dass alle kommunizierten Dokumente einen finalen Status haben.
Dies ist jedoch bei der einrichtungs*internen* Kommunikation, wie sie von ISiK spezifiziert wird, nicht gegeben. Im Gegenteil: die Suche und Filterung von Dokumenten anhand des Fertigstellungsstatus war ein häufig geäußerter Wunsch bei der Sammlung potentieller Use Cases.
Daher ist die Verwendung des Feldes `docStatus` in ISiK explizit erlaubt.
Um die technische Kompatibilität mit dem DocumentReference-Profil von IHE-MHD zu wahren [wurde der Änderungswunsch an IHE herangetragen](https://github.com/IHE/ITI.MHD/issues/96), den Constraint, der die Verwendung von `docStatus` verbietet, zu lockern.

Im Kontext von ISiK muss es auch möglich sein, den Status eines Dokumentes ändern zu können, ohne dabei das Dokument vollständig ersetzen zu müssen, wie es im IHE-MHD-Kontext der Fall ist. In ISiK wurde hierfür die Interaktion "Update von Dokumentenmetadaten" definiert.

##### Update für ISiK Stufe 3
Der Change-Request wurde seitens IHE abgelehnt. Hier besteht weiterhin eine Inkompatibilität zwischen ISiK und IHE-MHD. Die Empfehlung an Implementierer lautet, bei der ISiK-konformen, einrichtung*internen* Dokumentenaustausch, den Status mitzuführen, ihn jedoch bei der Überführung des Dokumentes in den einrichtungs*übergreifenden* Dokumentenaustausch zu entfernen. Weiterhin sollte sichergestellt werden, dass nur Dokumente mit dem docStatus "final" in den einreichtungsübergreifenden Kontext überführt werden.

Für die Interaktion "Update von Dokumentenmetadaten" gibt es in IHE MHD weiterhin keine Entsprechung.

#### Patientenübergreifende Suche
Im Kontext von IHE-MHD sind Clients verpflichtet, bei allen Suchen mindestens die Parameter `patient` oder `patient.identifier` sowie `status` zu verwenden. Typische UsesCases für die Dokumentensuche in einem Krankenhaus beinhalten jedoch auch die patientenübergreifende Suche, z.B. nach allen nicht abgeschlossenen Arztbriefen einer Station oder allen Spirometrie-Befunden der letzten Woche.
Diese Einschränkung wurde im ISiK-Profil daher aufgehoben.

#### Erzeugen von Metadaten (gelöst)
Für das automatische Erzeugen von IHE MHD-konformen Metadaten auf Basis von existierenden strukturierten Dokumenten (z.B. FHIR Documents) gibt es in IHE MHD keine entsprechende Interaktion. Eine entsprechende Funktionalität wäre jedoch sinnvoll, da entsprechende Mappings am besten von serverseitigen Implementierungen, wie sie mit dem Akteur "Document Recipient" in IHE MHD definiert werden, bereitgestellt werden könnten. Im Kontext von FHIR-Implementierungen wäre es unsinnig, komplexe Mappings und Nachschlage-Funktionen clientseitig implementieren zu müssen, nur um bereits vorhandene Dokumentenmetadaten in das vom Server erwartete Format zu bringen. Für die Stufe 2 wurde daher eine entsprechende Operation "$generate-metadata" mit dem Hinweis "Work in Progress" entworfen, die Server optional zur Verfügung stellen können, um Erfahrungen zu Implementierbarkeit und Nutzwert dieser Operation zu sammeln. 

Die Operation `$generate-metadata` wurde spezifiziert in Anlehnung an die Operation [`$generate` im current build der FHIR-Kernspezifikation](https://build.fhir.org/documentreference-operation-generate.html), die jedoch noch nicht in implementierbarem Zustand ist. Die hier getroffenen Änderungen werden parallel als Feedback zur Verbesserung der Kernspezifikation als [ChangeRequest](https://jira.hl7.org/browse/FHIR-34043) eingereicht.

#### Update für ISiK Stufe 3
Seitens IHE wurde die Interaktion [Generate Metadata [ITI-106]](https://profiles.ihe.net/ITI/MHD/ITI-106.html) basierend auf der ISiK-Spezifikation (mit leichten Änderungen) in MHD Version 4.2.0. hinzugefügt.
Die für ISiK spezifizierte Operation wird daher zurückgezogen und statt dessen die in IHE MHD definierte Operation genutzt. Die Inkompatibilität wurde damit beseitigt!
