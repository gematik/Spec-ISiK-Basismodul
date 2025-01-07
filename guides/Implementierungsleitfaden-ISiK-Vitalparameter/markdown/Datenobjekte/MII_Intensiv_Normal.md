# MII-Profile - Vitalparameter für die Intensiv- und Normalversorgung

An dieser Stelle werden weitere Festlegungen zu Profilen getroffen, die für die Intensiv- sowie Normalversorgung vorgesehen sind und dem Kontext des Moduls zur Intensivmedizinische Versorgung (ICU) der MII entstammen.

## Motivation zur Übernahme
Im Rahmen des [Moduls zur Intensivmedizinische Versorgung (ICU) der MII](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html) stellt die MII Profile bereit, die sich für die Verarbeitung von Vitalparametern im Rahmen der intensiv- sowie normalstationären Versorgung eignen.
Die Profile der MII sind medizinisch qualitätsgesichert und weisen eine feingranulare Kodierung vor.

Durch die Übernahme der Profile der MII und Abbildung auf das ISIK-Setting, können feingranular kodierte Profile zu Vitalparametern im Krankenhauskontext genutzt werden - für die Normal- wie für die intensivmedizinische Versorgung.
Insbesondere dienen die Profile der Abbildung des Workflows zur Überleitung zwischen Intensiv- und Normalversorgung (siehe {{pagelink:ImplementationGuide/markdown/UebergreifendeUseCases/Intensivversorgung.md}}).

## Designentscheidung
- Maximale Kardinalitäten von Coding Slices wurden von der MII übernommen
- Die Profil-Eigenschaften der MII-Profile, die den bisherigen, existenten Profilen in ISiK entsprechen, wurden in die existenten Profile übernommen.

## Intensivversorgung - PDMS 

### Normativer Status Intensivversorgung
Für folgende Profile, die den Festlegungen der MII entstammen, gelten gesonderte Festlegungen in Bezug auf die Notwendigkeit der Implementierung durch SW-Hersteller.

**Hinweis:** Hier wird jeweils die Canonical URL geführt. Die Profile lassen sich derzeit über die entsprechende [Simplifier Ressourcen-Seite](https://simplifier.net/isik-vitalparameter-v4/~resources?category=Profile&fhirVersion=R4&sortBy=LastUpdateDate_desc) einsehen.

### Profile und Beispiele für die Intensivversorgung
Folgende Profile MÜSSEN durch PDMS implementiert werden und - was als gleichwertig betrachtet wird - durch KIS, die als Dokumentationssystem in der Akutversorgung dienen (aber nicht durch die weiteren bestätigungsrelevanten Systeme):

- Pulmonalarterieller wedge Blutdruck (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalarterieller-blutdruck
    -  Beispiel: https://simplifier.net/isik-sandbox/Pulmonalarterieller-wedge-Blutdruck
- Sauerstoffsättigung im Blut preduktal durch Pulsoxymetrie (Obs) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-blut-preduktal-durch-pulsoxymetrie
    -  Beispiel: https://simplifier.net/isik-sandbox/Sauerstoffsaettigung-im-Blut-Preduktal-durch-Pulsoxymetrie
- Sauerstoffsättigung im Blut postduktal durch Pulsoxymetrie (Obs) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-blut-postduktal-durch-pulsoxymetrie
    -  Beispiel: https://simplifier.net/isik-sandbox/Sauerstoffsaettigung-im-Blut-Postduktal-durch-Pulsoxymetrie
- Linksventrikulaeres Schlagvolumenindex (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaeres-schlagvolumenindex
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksventrikulaeres-Schlagvolumenindex
- Linksv. Schlagvolumenindex durch Indikatorverd. (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-schlagvolumenindex-durch-indikatorverd  
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung
- Linksv. Schlagvolumen durch Indikatorverdünnung (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksventrikulaeres-Schlagvolumen-Durch-Indikatorverduennung
- Pulmonalvaskulärer Widerstandsindex (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalvaskulaerer-widerstandsindex
    -  Beispiel: https://simplifier.net/isik-sandbox/Pulmonalvaskulaerer-Widerstandsindex
- Systemischer vaskulärer Widerstandsindex (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-systemischer-vaskulaerer-widerstandsindex
    -  Beispiel: https://simplifier.net/isik-sandbox/Systemischer-vaskulaerer-Widerstandsindex
- Linksventrikulärer Herzindex (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-links-herzindex-indikatorverduennung
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksventrikulaerer-Herzindex
- Herzzeitvolumen (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-herzzeitvolumen
    -  Beispiel: https://simplifier.net/isik-sandbox/Herzzeitvolumen
- Linksv. Herzindex durch Indikatorverdünnung (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-links-herzindex-indikatorverduennung
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksventrikulaerer-Herzindex-Durch-Indikatorverduennung
- Linksv. Herzzeitvolumen durch Indikatorverdünnung (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-herzzeitvolumen-durch-indikatorverd
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung
- Zentralvenöser Druck (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-zentralvenoeser-blutdruck
    -  Beispiel: https://simplifier.net/isik-sandbox/Zentralvenoeser-Blutdruck
- Linksatrialer Druck (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksatrialer-druck
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksatrialer-Druck
- Rechtsatrialer Druck (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-rechtsatrialer-druck
    -  Beispiel: https://simplifier.net/isik-sandbox/Rechtsatrialer-Druck
- Rechtsventrikulärer Druck (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-rechtsventrikulaerer-druck
    -  Beispiel: https://simplifier.net/isik-sandbox/Rechtsventrikulaerer-Druck
- Linksventrikulärer Druck (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventrikulaerer-druck
    -  Beispiel: https://simplifier.net/isik-sandbox/Linksventrikulaerer-Druck
- Pulmonalarterieller Blutdruck (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-pulmonalarterieller-blutdruck
    -  Beispiel: https://simplifier.net/isik-sandbox/Pulmonalarterieller-Blutdruck
- Koerpertemperatur Brustwirbelsaeule (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-brustwirbelsaeule
    - Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Brustwirbelsaeule
- Koerpertemperatur Lendenwirbelsaeule (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-lendenwirbelsaeule
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Lendenwirbelsaeule
- Koerpertemperatur Halswirbelsaeule (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-halswirbelsaeule
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Halswirbelsaeule
- Koerpertemperatur Brust (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-brust
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Brust
- Koerpertemperatur Myokard (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-myokard
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Myokard
- Koerpertemperatur Atemwege (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-atemwege
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Atemwege
- Koerpertemperatur Blut (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-blut
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Blut
- Koerpertemperatur Nasen-Rachen-Raum (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-nasen-rachen-raum
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Nasen-Rachen-Raum
- Koerpertemperatur Speiseroehre (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-speiseroehre
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Speiseroehre

## Normalversorgung - alle bestätigungsrelevanten Systeme 

### Normativer Status Normalversorgung
Alle bestätigungsrelevanten Systeme für dieses Modul MÜSSEN Ressourcen verarbeiten können, die zu folgenden Profilen konform sind.


### Profile und Beispiele für die Normalversorgung

- Intrakranieller Druck ICP (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-intrakranieller-druck-icp
    -  Beispiel: https://simplifier.net/isik-sandbox/Intrakranieller-Druck-ICP
- Koerpergewicht Percentil altersabhängig (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpergewicht-percentil-altersabhaengig
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpergewicht-Percentile-altersabhaengig 
- Körpergrösse Percentil (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpergroesse-percentil
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpergroesse-Percentil
- Ideales Körpergewicht (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-ideales-koerpergewicht
    -  Beispiel: https://simplifier.net/isik-sandbox/Ideales-Koerpergewicht
- Sauerstoffsättigung im art. Blut durch Pulsoxymetrie (Obs) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie
    -  Beispiel: https://simplifier.net/isik-sandbox/Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie
- Puls (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-puls
    -  Beispiel: https://simplifier.net/isik-sandbox/Puls
- Koerpertemperatur Kern (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-kern
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Kern
- Koerpertemperatur Gelenk (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-gelenk
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Gelenk
- Koerpertemperatur Stirn (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-stirn
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Stirn
- Koerpertemperatur nasal (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-nasal
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-nasal
- Koerpertemperatur Leiste (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-leiste
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Leiste
- Koerpertemperatur Achsel (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-achsel
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Achsel 
- Koerpertemperatur unter der Zunge (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-unter-der-zunge
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-unter-der-Zunge
- Koerpertemperatur vaginal (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-vaginal
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-vaginal
- Koerpertemperatur Harnblase (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-harnblase
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Harnblase 
- Koerpertemperatur rektal (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-rektal
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-rektal
- Koerpertemperatur Trommelfell (Observation) - https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-trommelfell
    -  Beispiel: https://simplifier.net/isik-sandbox/Koerpertemperatur-Trommelfell

Weiterhin gelten alle Profile des ISiK Moduls als relevant für die Normalversorgung.

## Hintergrundinformation
Die als "Generisch" ausgewiesenen Profile des [Moduls zur Intensivmedizinische Versorgung (ICU) der MII](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html) eignen sich nicht zur unmittelbaren Implementierung, sind jedoch dafür geeignet die Implementierung zu Vereinfachen, da sie die geteilten strukturellen Eigenschaften der von ihnen abgeleiteten, spezifischen Profile festlegen.

Die Liste deckt alle Profile ab aus der Subseite [Monitoring und Vitaldaten des MII IGs](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html) (Stand 8.2.2024).