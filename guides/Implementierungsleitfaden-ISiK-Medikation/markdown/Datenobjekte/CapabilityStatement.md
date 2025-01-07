## Konformitätserklärung [(CapabilityStatement)](https://hl7.org/fhir/R4/capabilitystatement.html)

Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html)-Ressource bereitstellen.

Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Spezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden.
Der MODE-Parameter kann ignoriert werden.

Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik für den jeweiligen Bereich dieser Spezifikation dar. (`kind` = "requirements"). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)-Extension mit den möglichen Werten "SHALL" (=MUSS) und "MAY" (=KANN) verwendet.

Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind`= "instance" liefern und im Element `software` den Namen und die Versionsnummer angeben.

Darüber hinaus MUSS in 'CapabilityStatement.instantiates' die Canonical URL des nachfolgenden CapabilityStatement in der jeweiligen CapabilityStatement Instanz angegeben werden.

Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die in dem folgenden, für den zu bestätigenden Bereich relevanten, CapabilityStatement mit "SHALL" gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit "MAY" gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.

Implementiert ein System mehr als einen der drei Bereiche dieser Spezifikation, so MUSS dessen CapabilityStatement die Vereinigung der Funktionalitäten der betreffenden CapabilityStatements dieses Implementierungsleitfadens enthalten. Bei gleichartigen Elementen mit unterschiedlicher Anforderungsstärke (expectation) MUSS die stärkere Anforderung umgesetzt werden ("SHALL" gilt vor "MAY"). Ebenso MÜSSEN in diesem Fall die Canonical URLs der CapabilityStatements aller unten genannter implementierter Bereiche in 'CapabilityStatement.instantiates' angegeben werden.

Die Verwendung der [CapabilityStatement-Expectation](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich.

Die für dieses Modul bestätigungsrelevanten Teile des [Moduls "Basis"](https://simplifier.net/guide/isik-basis-v4?version=current) sind in den CapabilityStatements ebenfalls enthalten.


### CapabilityStatement (Requirement) ISiK-Medikation - Bereich Medikationsinformation

Canonical: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationInformation

{{render:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationInformation}}

### CapabilityStatement (Requirement) ISiK-Medikation - Bereich Medikationsverordnung

Canonical: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerordnung

{{render:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerordnung}}

### CapabilityStatement (Requirement) ISiK-Medikation - Bereich Medikationsverabreichung

Canonical: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichung

{{render:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichung}}

### CapabilityStatement (Requirement) ISiK-Medikation - Bereich AMTS

Der lesende Zugriff auf die typischen Eingangs-Parameter eines AMTS-Systems (Medikationsangaben, Laborwerte usw.) wurde vor dem Hintergrund integriert, dass die entsprechenden Informationen vom AMTS-System nach der Bewertung wieder zurückgegeben werden können (im Sinn von zugrundeliegenden, zum Zeitpunkt der Bewertung vorhandene Informationen).

Canonical: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationAMTS

{{render:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationAMTS}}
