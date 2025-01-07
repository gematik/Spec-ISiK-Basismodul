# Checklist for Specification

## Checklist for [Project Management of FHIR Specifications](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Konzeption-und-Durchf%C3%BChrung-von-Spezifikations-Projekten.page.md?version=current)

tbd. - no checklist yet, but see [the page](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Konzeption-und-Durchf%C3%BChrung-von-Spezifikations-Projekten.page.md?version=current) or [this page](https://fshschool.org/courses/fsh-seminar/02-creating-an-ig.html).

## Reviewer / Quality Assurance Checklist during Profiling
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
<!--- Please do not hesitate to add additional boxes during review -->
- [ ] The Present PR does not need a thorough review process, due to brevity, low complexity or because it represents a rather minor change; otherwise go trough the list! ... and read the linked manual, if you did not do it yet!

### content review steps ([based on Best Practice IG Germany](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation?version=current))
- [ ] no content review needed
- [x] [cardinalities in profiles](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Umgang-mit-Kardinalit%C3%A4ten.page.md?version=current) are added with caution (specially 'max') and are thoroughly motivated in a comment
- [x] modifying-Elements are [highlighted](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Umgang-mit-Modifying-Elements.page.md?version=current)
- [x]  [meta.profile Elements](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Umgang-mit-Meta-Daten.page.md?version=current) not added or added with extreme caution
- [x] [StructureDefinition.description](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Dokumentation-und-Nachvollziehbarkeit.page.md?version=current) is filled
- [ ] [Constrained Elements](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Profilierung/Dokumentation-und-Nachvollziehbarkeit.page.md?version=current) contain
    - [ ] naming in ElementDefinition.short 
    - [ ] ElementDefinition.comment contains a motivation
- [x] [Capability Statement](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Erstellung-eines-CapabilityStatements.page.md?version=current) exists 
    - [ ] the textual searchparameters of every instance do correspond to the definition within the CapabilityStatement
- [x] [relevant examples exist](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Erstellung-von-Beispieldaten.page.md?version=current)

**Neu:**
- [x] [StructureDefinition.title]
- suffixe?
- Zusammenfassung & Motivation redundant


### formal intellectual review steps of [Implementation Guide](https://simplifier.net/guide/Best-Practice-bei-der-Implementierung-und-Spezifizierung-mit-HL7/%C3%9Cbersicht/Spezifikation/Erstellung-eines-Implementierungsleitfadens.page.md?version=current) 
- [ ] no formal review needed
- [x] proofreading for orthography 

- [ ] there are no (critical) validation Errors in the CI pipeline 
    - [ ]  inspected and no critical errors found(In the "github action view" -> Option button -> "View raw logs") - possibly list non-critical below
- [ ] skim reading for correct rendering of IG (possibly using IG-grep of string String like "Could not render")

### automated review steps:
- [ ] no formal review needed
- [ ] check IG-pages for broken links (possibly using plug-in)
  - Tools for link checking: 
    - `docker run --rm -it -u $(id -u):$(id -g) ghcr.io/linkchecker/linkchecker:latest https://simplifier.net/guide/isik-medikation-v4\?version\=current`
    - 
