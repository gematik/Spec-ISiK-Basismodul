---
topic: markdown-PersonImGesundheitsberuf-PersonImGesundheitsberuf-Interaktionen
---
### Interaktionen

Für die Ressource Practitioner MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Practitioner?_id=1234567890```

     Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://www.hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "identifier" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Practitioner?identifier=42```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Practitioner.identifier" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "given" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Practitioner?given=Heidi```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Practitioner.name.given" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "family" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Practitioner?family=Alpenzauber```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Practitioner.name.family" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "name" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Practitioner?name=Heidi```

    ```GET [base]/Practitioner?name=Alpenzauber```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Practitioner.name" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "address" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Practitioner?address=Berlin```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Practitioner.address" finden sich in der [FHIR-Basisspezifikation - Abschnitt "String Search"](https://hl7.org/fhir/R4/search.html#string).

1. Der Suchparameter "gender" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Practitioner?gender=female```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Practitioner.gender" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

---
