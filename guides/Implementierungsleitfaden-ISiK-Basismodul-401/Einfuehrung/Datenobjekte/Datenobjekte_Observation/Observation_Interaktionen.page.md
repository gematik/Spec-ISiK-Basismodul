---
topic: ImplementationGuide-markdown-Observation-Observation-Interaktionen
---
### Interaktionen

Für die Ressource Observation MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?_id=1234567890```

     Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://www.hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "status" MUSS unterstützt werden:

   Beispiel:

   ``` GET [base]/Observation?status=http://hl7.org/fhir/observation-status|final```

   Anwendungshinweise: Weitere Informationen zur Suche nach "status"
   finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "category" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|social-history```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Observation.category" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "code" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/Observation?code=http://terminology.hl7.org/CodeSystem/observation-category|social-history```

   Anwendungshinweise: Weitere Informationen zur Suche nach "Observation.category" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "patient" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/Observation?patient=Patient/123```

   Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

   Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend.

1. Der Suchparameter "subject" MUSS unterstützt werden:

   Beispiele:

   ```GET [base]/Observation?subject=Patient/123```

   Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter "date" MUSS unterstützt werden:

   Beispiel:

   ``` GET [base]/Observation?date=ge2013-01-14&date=le2021-12-31```

   Anwendungshinweise: Weitere Informationen zur Suche nach "date"
   finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://www.hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "combo-code" MUSS unterstützt werden:

   Beispiel:

   ```GET [base]/Observation?combo-code=85354-9```

   Anwendungshinweise: Weitere Informationen zur Suche nach "combo-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token"](https://www.hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "combo-code-value-quantity" MUSS unterstützt werden:

   Beispiel:

   ```GET [base]/Observation?combo-code-value-quantity=http://loinc.org|8480-6$120|http://unitsofmeasure.org|mm[Hg]```

   Anwendungshinweise: Weitere Informationen zur Suche nach "combo-code-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Composite Search Parameters"](https://www.hl7.org/fhir/R4/search.html#combining).

1. Der Suchparameter "component-code" MUSS unterstützt werden:

   Beispiel:

   ```GET [base]/Observation?component-code=http://loinc.org|85354-9```

   Anwendungshinweise: Weitere Informationen zur Suche nach "component-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token"](https://www.hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "encounter" MUSS unterstützt werden:

   Beispiel:

   ```GET [base]/Observation?encounter=Encounter/234```

   Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

---
