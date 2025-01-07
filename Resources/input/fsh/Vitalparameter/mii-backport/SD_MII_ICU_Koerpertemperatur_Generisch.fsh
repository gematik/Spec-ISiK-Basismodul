Profile: SD_MII_ICU_Koerpertemperatur_Generisch
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-koerpertemperatur-generisch
Title: "SD MII ICU Koerpertemperatur Generisch"
* insert Meta
* code
  * coding[sct] ^patternCoding.system = "http://snomed.info/sct"
  * coding[loinc] ^patternCoding.system = "http://loinc.org"
  * coding[IEEE-11073] ^patternCoding.system = $IEEE11073
* valueQuantity = $unitsofmeasure#Cel "degree Celsius"
  * unit 1..