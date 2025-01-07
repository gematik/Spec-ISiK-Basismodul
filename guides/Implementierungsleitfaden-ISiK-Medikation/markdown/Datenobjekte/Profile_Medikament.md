## Medikament [(Medication)](https://www.hl7.org/fhir/R4/medication.html)

---

### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament, hybrid}}

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament')
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
    url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament'
for differential.element
where mustSupport = true
  and short.exists()
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```

### Beispiele

Valide Beispiele für das Profil Medikament:

Medikament codiert (Wirkstoff):
{{json:ExampleISiKMedikament1}}

Infusionslösung:
{{json:ExampleISiKMedikament2}}

Medikament codiert (PZN):
{{json:ExampleISiKMedikament3}}

Medikamentenrezeptur aus Fertigarzneimitteln:
{{json:ExampleISiKMedikament4}}

Medikamentenrezeptur aus Wirkstoffen:
{{json:ExampleISiKMedikament5}}

Medikament als Freitext:
{{json:ExampleISiKMedikament6}}

Medikament (hier: Paracetamol) in Wasser aufgelöst:
{{json:ExampleISiKMedikament7}}

Zytostatikum mit relativer Wirkstärken-Angabe (mg/kg Körpergewicht):
{{json:ExampleISiKMedikament8}}

Zytostatikum mit absoluter Wirkstärken-Angabe:
{{json:ExampleISiKMedikament9}}

### Übergangslösung für die Chargendokumentation beim Verblistern

Für eine Einführung in den Sachverhalt, siehe [Chargendokumentation: Lösung für Verblisterer gefunden](https://www.deutsche-apotheker-zeitung.de/news/artikel/2023/11/13/chargendokumentation-loesung-fuer-verblisterer-gefunden).
Die dort angesprochene Lösung kann gegebenenfalls auch auf den stationären Sektor übertragen werden und im Modul ISiK Medikation Anwendung finden.

#### `Medication.lot-number`

**Bedeutung:** Chargennummer

**Hinweise:** Bitte beachten Sie gegebenenfalls die Regelungen der zwischen GKV-SV und DAV für den [Bereich der Apotheken](https://www.gkv-datenaustausch.de/leistungserbringer/apotheken/apotheken.jsp). Insbesondere den Technischen Anhang 7 (TA7) zur Arzneimittelabrechnungsvereinbarung gemäß § 300 Absatz 3 SGB V in der aktuellsten Fassung, [Erste Änderungsvereinbarung](https://www.gkv-spitzenverband.de/media/dokumente/krankenversicherung_1/arzneimittel/rahmenvertraege/apotheken/20240101_1.AeV_Arzneimittelabrechnungsvereinbarung_300_Abs.3_SGBV.pdf).

**Relevanter Passus:** Soweit die Übermittlung der Chargenbezeichnung beim „Stellen“ von Arzneimitteln technisch nicht möglich ist, wird bis zur Schaffung entsprechender technischer Möglichkeiten analog § 312 Absatz 1 Nummer 3 SGB V ausnahmsweise bis zum 30. Juni 2025 von der Verpflichtung zur Chargendokumentation abgesehen.
Anstelle der tatsächlichen Chargenbezeichnungen ist „STELLEN“ in das entsprechende Datenfeld einzutragen.
Dabei sind die Abrechnungs- und rahmenvertraglichen Regelungen im Übrigen einzuhalten, insbesondere ist sicherzustellen, dass die in Anlage 9 § 2 Satz 1 des Rahmenvertrages nach § 129 Absatz 2 SGB V beschriebenen Mitwirkungspflichten auf Nachfrage erfüllt werden. Siehe auch, [Ergänzung in der Anlage 1 zur Arzneimittelabrechnungsvereinbarung gemäß § 300 Abs. 3 SGB V](https://www.gkv-datenaustausch.de/media/dokumente/leistungserbringer_1/apotheken/technische_anlagen_aktuell/FAQ-Liste_TA7-V004_001_20231127.pdf) in der FAQ-Liste zur TA7. 

### Interaktionen

Für die Ressource Medication MÜSSEN die REST-Interaktionen "READ", "CREATE" und "UPDATE" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Medication?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Medication?code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23```

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "form" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Medication?form=http://standardterms.edqm.eu|11210000```

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "ingredient" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Medication?ingredient=Medication/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

1. Der verkettete Suchparameter "ingredient.code" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Medication?ingredient.code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23```

    Use Case Zusammenhang: Um eine {{pagelink:ImplementationGuide/markdown/Zusammenfassung/UseCases.md, text:Wechselwirkung}} zwischen Medikamenten auf Basis des Wirkstoffes zu vermeiden.

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

	  Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining).

1. Der Suchparameter "ingredient-code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Medication?ingredient-code=http://fhir.de/CodeSystem/bfarm/atc|L01DB01```

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "lot-number" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Medication?lot-number=X123456```

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Medication?status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).
