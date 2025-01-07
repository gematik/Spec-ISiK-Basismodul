## MedikationsVerabreichung [(MedicationAdministration)](https://www.hl7.org/fhir/R4/medicationadministration.html)

---

### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung, hybrid}}

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung')
for differential.element
select
Path: path,
join binding.where(valueSet.exists())
{
  Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
  Strength: strength,
  URL: valueSet
}
```

---

### Anmerkungen zu Must-Support-Feldern

@```from
	StructureDefinition
where
    url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung'
for differential.element
where mustSupport = true
  and short.exists()
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```

## Beispiele

Valide Beispiele für das Profil MedikationsVerabreichung:

Einfache Einnahme:
{{json:ExampleISiKMedikationsVerabreichung}}

Zytostatika-Infusion:
{{json:ExampleISiKMedikationsVerabreichung2}}

Verabreichung einer Infusion mit Angabe der Dosierungs-Rate in zwei Varianten (Quantity und Ratio):

{{json:ExampleISiKMedikationsVerabreichung3}}

{{json:ExampleISiKMedikationsVerabreichung4}}

## Interaktionen

Für die Ressource MedicationAdministration MÜSSEN die REST-Interaktionen "READ", "CREATE" und "UPDATE" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23```

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "context" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?context=Encounter/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der verkettete Suchparameter "context.identifier" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?context.identifier=http://mein-krankenhaus.example/fhir/sid/fallnummern|7567867```

    ```GET [base]/MedicationAdministration?context.identifier=7567867```

    Use Case Zusammenhang: Um bei einem wiederkehrenden Patienten eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} des Falls und damit eine falsche Verabreichung zu vermeiden.

    Anwendungshinweise: Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

      Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining).

1. Der Suchparameter "effective-time" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?effective-time=2022-03-23```

    Anwendungshinweise: Weitere Informationen zur Suche nach Date-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Date"](https://hl7.org/fhir/R4/search.html#date).

1. Der Suchparameter "medication" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?medication=Medication/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der verkettete Suchparameter "medication.code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?medication.code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23```

    Use Case Zusammenhang: Um eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Kontraindikation}} bei der Verabreichung auf Basis des Wirkstoffes zu vermeiden.

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

	  Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining).

1. Der Suchparameter "patient" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/MedicationAdministration?patient=Patient/123```

   Anwendungshinweise: Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der verkettete Suchparameter "patient.identifier" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?patient.identifier=http://mein-krankenhaus.example/fhir/sid/patienten|1032702```

    ```GET [base]/MedicationAdministration?patient.identifier=1032702```

    Use Case Zusammenhang: Um bei der Verabreichung eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Verwechslung}} zwischen verschiedenen Patienten vermeiden.

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

	  Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining).

1. Der Suchparameter "performer" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?performer=Practitioner/101112```

    Anwendungshinweise: Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der verkettete Suchparameter "performer.identifier" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationAdministration?performer.identifier=http://fhir.de/sid/bundesaerztekammer/efn|123456789123456```

    ```GET [base]/MedicationAdministration?performer.identifier=123456789123456```

    Use Case Zusammenhang: Um mich als Heilberufler über die {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Historie}} meiner Medikationsverabreichungen zur informieren.
    <!-- Use Case Zusammenhang: Um bei der Verabreichung die notwendige {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Expertise}} eines entsprechend spezialisierten Facharztes (z.B. Onkologie) zu gewährleisten.-->

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

      Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining).

1. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/MedicationRequest?status=completed```

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).
