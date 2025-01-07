## MII Profile zu Vitaldaten für ISIK (Akut- und Normalversorgung)
Im Rahmen des [Moduls zur Intensivmedizinische Versorgung (ICU) der MII](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html) stellt diese u.a. spezifische Profile bereit, die Vitalparameter im Rahmen der intensiv- wie normalstationären Versorgung erfassen.
Die Profile der MII sind medizinisch qualitätsgesichert und die Granularität der Kodierung ist präziser als die Kodierung der ISIK Profile im Modul Vitalparameter (Stand 13.02.2024).

### Motivation zur Übernahme
Durch die Übernahme der Profile der MII und Abbildung auf das ISIK Setting, können feingranular Kodierte Profile zu Vitalparametern im Krankenhauskontext genutzt werden - für die Normal- wie für die intensivmedizinische Versorgung.

### Vorgehen
Im Zuge der Ausbaustufe 4 sollen Vitalparameter-Profile der MII in ISiK festgelegt werden. Der Umfang der geplanten Festlegung wird auf dieser Seite dokumentiert.

Für folgende Profile, die den Festlegungen der MII entstammen, gelten gesonderte Festlegungen in Bezug auf die Notwendigkeit der Implementierung durch SW-Hersteller.

Die Liste deckt alle Profile ab aus der Subseite https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html und übernimmt entsprechend die Namen der Profile (Stand 8.2.2024).

Profile, die ausschließlich durch PDMS (oder - was als gleichwertig betrachtet wird - durch KIS, die als Dokumentationssystem in der Akutversorgung dienen) implementiert werden MÜSSEN, werden mit folgendem Flag gekennzeichnet: PDMS :warning: 

Profile, die durch alle bestätigungsrelevanten Systeme in diesem Modul implementiert werden MÜSSEN, werden mit folgendem Flag gekennzeichnet: ALLE :hospital:

Die Anforderung zur Implmenentierung - d.h. Bereitstellung einer Schnittstelle - sollen nur gelten, sofern das System entsprechende Daten bereits verwaltet.

## Liste der Profile mit Kennzeichnung des betroffenen Systemtyps zur Umsetzung
- Pulmonalarterieller wedge Blutdruck (Observation)
    - PDMS :warning:
- Intrakranieller Druck ICP (Observation)
    - ALLE :hospital:
- Atemfrequenz (Observation)
    - bereits verpflichtend 
- Kopfumfang (Observation)
    - bereits verpflichtend 
- Koerpergroesse (Observation)
    - bereits verpflichtend 
- Koerpergewicht (Observation)
    - bereits verpflichtend 
- Koerpergewicht Percentil altersabhängig (Observation)
    - ALLE :hospital: 
- Körpergrösse Percentil (Observation)
    - ALLE :hospital:
- Ideales Körpergewicht (Observation)
    - ALLE :hospital:
- Sauerstoffsaettigung im Blut preduktal durch Pulsoxymetrie (Obs)
    - PDMS :warning: 
- Sauerstoffsättigung im Blut postduktal durch Pulsoxymetrie (Obs)
    - PDMS :warning: 
- Sauerstoffsättigung im art. Blut durch Pulsoxymetrie (Obs)
    - ALLE :hospital:
- Linksventrikulaeres Schlagvolumenindex (Observation)
    - PDMS :warning:
- Linksv. Schlagvolumenindex durch Indikatorverd. (Observation)
    - PDMS :warning:
- Linksv. Schlagvolumen durch Indikatorverdünnung (Observation)
    - PDMS :warning:
- Pulmonalvaskulärer Widerstandsindex (Observation)
    - PDMS :warning:
- Systemischer vaskulärer Widerstandsindex (Observation)
    - PDMS :warning:
- Linksventrikulärer Herzindex (Observation)
    - PDMS :warning:
- Herzzeitvolumen (Observation)
    - PDMS :warning:
- Linksv. Herzindex durch Indikatorverdünnung (Observation)
    - PDMS :warning:
- Linksv. Herzzeitvolumen durch Indikatorverdünnung (Observation)
    - PDMS :warning:
- Herzfrequenz (Observation)
  - bereits verpflichtend
- Zentralvenöser Druck (Observation)
    - PDMS :warning:
- Blutdruck Generisch (Observation)
    - bereits verpflichtend (s.u.)
- Linksatrialer Druck (Observation)
    - PDMS :warning:
- Rechtsatrialer Druck (Observation)
    - PDMS :warning:
- Rechtsventrikulärer Druck (Observation)
    - PDMS :warning:
- Linksventrikulärer Druck (Observation)
    - PDMS :warning:
- Pulmonalarterieller Blutdruck (Observation)
    - PDMS :warning:
- Blutdruck (Observation)
    - bereits verpflichtend (siehe [ISIK Stufe 3 Blutdruck](https://simplifier.net/guide/Implementierungsleitfaden-ISiK-Modul-Vitalparameter-Stufe-3/ImplementationGuide-markdown-Blutdruck?version=current) - LOINC Codierung hier übereinstimmend )
- Puls (Observation)
    - ALLE :hospital:
- Koerpertemperatur Generisch (Observation)
    - bereits verpflichtend 
- Koerpertemperatur Kern (Observation)
    - ALLE :hospital:
- Koerpertemperatur Brustwirbelsaeule (Observation)
    - PDMS :warning: (UC ist Sepsis in Intensivversorgung)
- Koerpertemperatur Lendenwirbelsaeule (Observation)
    - PDMS :warning:
- Koerpertemperatur Gelenk (Observation)
    - ALLE :hospital:
- Koerpertemperatur Stirn (Observation)
    - ALLE :hospital:
- Koerpertemperatur Halswirbelsaeule (Observation)
    - PDMS :warning:
- Koerpertemperatur Brust (Observation)
    - PDMS :warning:
- Koerpertemperatur nasal (Observation)
    - ALLE :hospital:
- Koerpertemperatur Myokard (Observation)
    - PDMS :warning:
- Koerpertemperatur Atemwege (Observation)
    - PDMS :warning:
- Koerpertemperatur Blut (Observation)
    - PDMS :warning:
- Koerpertemperatur Leiste (Observation)
    - ALLE :hospital:
- Koerpertemperatur Achsel (Observation)
    - ALLE :hospital:
- Koerpertemperatur unter der Zunge (Observation)
    - ALLE :hospital:
- Koerpertemperatur vaginal (Observation)
    - ALLE :hospital:
- Koerpertemperatur Harnblase (Observation)
    - ALLE :hospital: (aber Grenzfall, z.B. bei Blasenkatheter)
- Koerpertemperatur Nasen-Rachen-Raum (Observation)
    - PDMS :warning:
- Koerpertemperatur Speiseroehre (Observation)
    - PDMS :warning:
- Koerpertemperatur rektal (Observation)
    - ALLE :hospital:
- Koerpertemperatur Trommelfell (Observation)
    - ALLE :hospital:


Die als "Generisch" ausgewiesenen Profile der MII eignen sich nicht zur unmittelbaren Implementierung, sind jedoch dafür geeignet die Implementierung zu Vereinfachen, da sie die geteilten strukturellen Eigenschaften der von ihnen abgeleiteten, spezifischen Profile festlegen.
