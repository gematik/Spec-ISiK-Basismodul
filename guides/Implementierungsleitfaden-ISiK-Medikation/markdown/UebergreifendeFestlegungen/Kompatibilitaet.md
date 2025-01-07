# Kompatibilität

Der vorliegende Implementierungsleitfaden wurde aus der Analyse verschiedener in Deutschland bestehender Spezifikationen im Bereich Medikation heraus entwickelt.

Überwiegend wurde dabei eine Vereinigungsmenge aus diesen, teilweise mit stark unterschiedlicher Ausrichtung verfassten, Spezifikationen hergestellt. Allerdings wurde auch zum einen der Entwicklung der letzten Jahre Rechnung getragen, zum anderen wurden sehr spezifische Datenelemente, die für die Medikationskommunikation im stationären Bereich nicht von Bedeutung sind, nicht berücksichtigt.

## Kompatibilität zum Medizininformatik-Initiative Kerndatensatz Modul Medikation

Die Medikations-Spezifikationen der Medizininformatik-Initiative sowie in ISiK sind weitestgehend deckungsgleich.

Dies trifft auch für die verwendeten Terminologien zu, mit Ausnahme der Medikamenten-Codierung. Hier erlaubt ISiK die Verwendung von ABDATA WG14, jedoch nicht ATC-WHO. Unter Umständen muss hier also ein Mapping vorgenommen werden.

Weiterhin erlaubt die Medizininformatik-Initiative derzeit mehrfache Slices der einzelnen Codesysteme zum Medikament (z.B. PZN), während im vorliegenden Implementierungsleitfaden gemäß Abstimmung mit dem BfArm und in Übereinstimmung mit den Regeln für den FHIR CodeableConcept Datentyp jedes Codesystem jeweils nur ein Mal vorkommen darf. Im (bei bestimmungsgemäßer Verwendung der Codesysteme nicht zu erwartenden) Fall einer Instanz mit zwei unterschiedlichen Medikamenten-Codes aus demselben Codesystem muss also eine Einzelfallentscheidung getroffen werden.

## Kompatibilität zum KBV eRezept

Die eRezept-Spezifikation enthält zahlreiche Datenelemente, die ausschließlich im Kontext der Rezept-Verordnungen sowie des Abrechnungswesens Relevanz besitzen. Solche Datenelemente, die in der eRezept-Spezifikation zum großen Teil als FHIR-Extensions repräsentiert sind, werden in ISiK nicht explizit spezifiziert. Dennoch ist die Verwendung dieser Extensions in ISiK möglich und zulässig, sofern hierfür im konkreten Anwendungsfall ein Bedarf besteht.

Im umgekehrten Fall sind die in ISiK möglichen hochstrukturierten Angaben zur Dosierung im eRezept wesentlich eingeschränkt. Soll also aus einer ISiK-Verordnung ein eRezept generiert werden, müssen diese strukturierten Daten ggf. in eine textuelle Beschreibung überführt werden.

Weiterhin würde die Erzeugung eines eRezepts aus den ISiK-FHIR-Ressourcen ggf. die Umsetzung direkt codierter Medikamente in eine eigene Medication-Ressource und/oder die Umcodierung des Medikamentencodes sowie der codierten Medikamenten-Bestandteile in einen Freitext erfordern.

## Kompatibilität zum Bundesmedikationsplan/eMP

Der vorliegende Implementierungsleitfaden spezifiziert ein Superset der eMP-Spezifikation.

Die Kompatibilität zur Übernahme der Daten aus dem eMP ist somit gegeben.
Die Erzeugung eines eMP aus den ISiK-FHIR-Ressourcen (Profile "MedikationsInformation", "Medikament" und "MedikationsListe") erfordert ggf. die Umsetzung direkt codierter Medikamente in eine eigene Medication-Ressource und/oder die Umcodierung des Medikamentencodes sowie der codierten Medikamenten-Bestandteile in einen Freitext. Weiterhin sind einige ISiK-Datenelemente nicht im eMP abgebildet.

## Kompatibilität zum Medikationsplan Plus

Der Medikationsplan Plus liegt noch in der FHIR-Version STU3 vor. Hieraus ergeben sich einige Abweichungen, vornehmlich syntaktischer Natur.

Eine Übernahme von Daten aus dem Medikationsplan Plus nach ISiK sollte problemlos möglich sein, sofern ein entsprechendes Struktur-Mapping verwendet wird. In umgekehrter Richtung müssen unter Umständen die verwendeten Codierungen gemappt werden.

## Kompatibilität zu eMDAF

Der vorliegende Implementierungsleitfaden spezifiziert in Bezug auf die in der eMDAF-Spezifikation verwendeten FHIR-Ressourcentypen eine äquivalente Repräsentation.

Die bidirektionale Kompatibilität ist weitgehend gegeben. Abweichend von eMDAF wird jedoch ein bundeseinheitlicher Namensraum für das ABDATA WG14 Codesystem verwendet. Weiterhin ist die Verwendung des Codesystems für die KBV-BMP-Darreichungsform in ISiK nicht spezifiziert.
