---
topic: UebergreifendeFestlegungen-KompatibilitaetDerGematikSpezifikation-Andere
---
## Kompatibilität zu anderen nationalen FHIR-basierten Spezifikationen

Grundlage des ISiK-Leitfadens sind in Deutschland bereits abgestimmte und erprobte Profile, unter anderem:
* die [Basisprofile von HL7 Deutschland e.V.](https://simplifier.net/basisprofil-de-r4)
* die [Spezifikationen der KBV](https://simplifier.net/organization/kassenrztlichebundesvereinigungkbv/~projects), insbesondere 
  * die [KBV-Basisprofile](https://simplifier.net/base1x0)
  * die [Formularübergreifenden Vorgaben für Digitale Muster](https://simplifier.net/for) (eRezept/eAU)
* die [Kerndatensatz-Module der Medizininformatik-Initiative](https://simplifier.net/organization/koordinationsstellemii/~projects), insbesondere die Module
  *  [Person](https://simplifier.net/medizininformatikinitiative-modulperson)
  *  [Fall](https://simplifier.net/medizininformatikinitiative-modulfall)
  *  [Diagnose](https://simplifier.net/medizininformatikinitiative-moduldiagnosen) und
  *  [Prozedur](https://simplifier.net/medizininformatikinitiative-modulprozeduren)
 
Dennoch erstellt die gematik für die Durchführung des Verfahrens eigene, technisch unabhängige Profile. Es wird angestrebt, dass Instanzen, die gegen gematik-Profile valide sind, ebenfalls gegen die zugrunde gelegten Profile valide sind. Sollte dies nicht der Fall sein, dann enthalten die Profile der gematik einen entsprechenden Hinweis mit einer Begründung, warum von dem Profil abgewichen wurde bzw. eine Information darüber, welche Schritte notwendig sind, um die Kompatibilität herzustellen. Dies kann beispielsweise die zusätzliche Implementierung weiterer Elemente sein, die nicht Bestandteil des ISiK-Bestätigungsverfahrens sind, für die Erfüllung des zugrundeliegenden Profils jedoch notwendig sind. Bei der Betrachtung der Kompatibilität wird stets von Implementierungen ausgegangen, die exakt die Minimalanforderungen (Pflichtfelder, Must-Support-Felder) der gematik-Spezifikation umsetzen. Weiterhin ist die Betrachtung auf harte Inkompatibilitäten begrenzt, d.h. widersprüchliche Kardinalitäten oder abweichende Kodierungen. Auf ggf. abweichende Must-Support-Felder mit optionaler Kardinalität, die zu keiner technischen Inkompatibilität führen, wird nicht explizit hingewiesen. 

Die Hinweise zur Kompatibilität sind jeweils im Unterkapitel "Kompatibilität" der einzelnen Datenobjekte zu finden.


Das Erfordernis der Erstellung eigener, unabhängiger Profile für ISiK ergibt sich aus folgenden Gründen:
 1. Technische Gründe: Im Rahmen von Connectathons können kurzfristige Bugfixes erforderlich werden, die von der gematik umsetzbar sein müssen, ohne auf einen Beschluss/ein Update seitens der MI-Initiative oder der KBV warten zu müssen.
 2. Tooling: Das von der gematik verwendete Tooling für die Bestätigung kann es erforderlich machen, dass Profile mit zusätzlichen Attributen/Extensions versehen werden müssen, die seitens anderer Organisationen nicht benötigt werden.
 3. Darstellung: Für die Teilnehmer am Bestätigungsverfahren soll auf einen Blick erkennbar sein, welche Elemente der Profile für die Bestätigung relevant sind. Um dies zu vereinfachen, setzt die gematik sog. "Must-Support"-Flags ein, um die relevanten Merkmale hervorzuheben. Die Bedeutung des Must-Support-Flags und der Umfang der entsprechend markierten Elemente kann in anderen Szenarien abweichen. Da es sich bei Must-Support-Flags jedoch um rein informative Attribute handelt, deren Einhaltung im Rahmen der Validierung nicht maschinell überprüft werden kann, hat dies keinen Einfluss auf die Kompatibilität. Slices und Extensions, die in den zugrundeliegenden Profilen optional und nicht Bestandteil des Bestätigungsverfahrens sind, können in den gematik-Profilen weggelassen werden, um die Lesbarkeit zu verbessern. Auch diese haben keine Auswirkungen auf die Kompatibilität.
