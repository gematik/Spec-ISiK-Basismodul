Profile: ISiKEKG
Parent: EkgDE
Id: ISiKEKG
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über kurze, relevante EKG-Ausschnitte eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Es wurde entwickelt, um spezifische klinische Fragestellungen zu unterstützen, bei denen prägnante und gezielte EKG-Daten im Vordergrund stehen. Für vollständige und längere EKG-Aufzeichnungen sind alternative Formate vorgesehen, die für umfangreiche Daten besser geeignet sind.
### Motivation
Die Bereitstellung kurzer EKG-Ausschnitte ermöglicht eine präzise und effiziente Unterstützung bei der Diagnose akuter kardiologischer Fragestellungen, der Überwachung von Arrhythmien oder der Beurteilung bestimmter Ereignisse wie ST-Strecken-Veränderungen. Diese fokussierte Darstellung dient der Optimierung klinischer Entscheidungen und der schnellen Verarbeitung relevanter Daten.

In FHIR wird das EKG durch die Observation-Ressource repräsentiert, wobei spezifische Anforderungen für die Darstellung und Kodierung der Daten in diesem Profil berücksichtigt werden.

### Kompatibilität
Das Profil ISiKEKG ist vom Profil [EkgDE](http://fhir.de/StructureDefinition/observation-de-ekg) aus den deutschen Basisprofilen abgeleitet."
* insert ISiKVitalsignCommons
* component MS
  * insert Component-MS
* component[ekgLeads] MS
* component[ekgLeads].valueSampledData MS
  * ^comment = "Motivation MS: Die EKG-Daten werden mittels des SampledData Datentyps abgebildet."
  * ^short = "SampledData"
* component[ekgLeads].valueSampledData.origin MS
  * ^comment = "Motivation MS: Das Feld `origin` definiert den Referenzpunkt und die Einheit der Messreihe, um sicherzustellen, dass die gemessenen Werte im richtigen Kontext interpretiert werden können."
  * ^short = "Ausgangswert"
* component[ekgLeads].valueSampledData.period MS
  * ^comment = "Motivation MS: Das Feld `period` definiert die zeitliche Distanz zwischen zwei aufeinanderfolgenden Messwerten."
  * ^short = "Messintervall"
* component[ekgLeads].valueSampledData.dimensions MS
  * ^comment = "Motivation MS: Das Feld `dimensions` gibt die Anzahl der Achsen oder Dimensionen an, die in der Messreihe enthalten sind, und ist notwendig, um die Struktur der Daten korrekt zu verstehen."
  * ^short = "Dimensionen"
* component[ekgLeads].valueSampledData.data MS
  * ^comment = "Motivation MS: Das Feld `data` enthält die eigentlichen Messwerte der EKG-Daten."
  * ^short = "Messwerte"

Instance: ISiKEKGExample
InstanceOf: ISiKEKG
Usage: #example
* meta.profile[+] = Canonical(EkgDE)
* code.coding[loinc] = $loinc#11524-6 "EKG study"
* code.coding[snomed] = $sct#106073009 "EKG wave, interval AND/OR segment"
* subject.reference = "Patient/PatientinMusterfrau"
* status = #final
* category = $observation-category#procedure
* device.reference = "Device/ExampleDevice"
* effectiveDateTime = "2019-07-02"
* component[ekgLeads][+].code = $loinc#LP7386-8 "Lead I"
* component[ekgLeads][=].valueSampledData.origin.value = 2048
* component[ekgLeads][=].valueSampledData.period = 10
* component[ekgLeads][=].valueSampledData.dimensions = 1
* component[ekgLeads][=].valueSampledData.data = "2041 2043 2037 2047 2060 2062 2051 2023 2014 2027 2034 2033 2040 2047 2047 2053 2058 2064 2059 2063 2061 2052 2053 2038 1966 1885 1884 2009 2129 2166 2137 2102 2086 2077 2067 2067 2060 2059 2062 2062 2060 2057 2045 2047 2057 2054 2042 2029 2027 2018 2007 1995 2001 2012 2024 2039 2068 2092 2111 2125 2131 2148 2137 2138 2128 2128 2115 2099 2097 2096 2101 2101 2091 2073 2076 2077 2084 2081 2088 2092 2070 2069 2074 2077 2075 2068 2064 2060 2062 2074 2075 2074 2075 2063 2058 2058 2064 2064 2070 2074 2067 2060 2062 2063 2061 2059 2048 2052 2049 2048 2051 2059 2059 2066 2077 2073"
* component[ekgLeads][+].code = $loinc#LP7386-6 "Lead II"
* component[ekgLeads][=].valueSampledData.origin.value = 2048
* component[ekgLeads][=].valueSampledData.period = 10
* component[ekgLeads][=].valueSampledData.dimensions = 1
* component[ekgLeads][=].valueSampledData.data = "2041 2043 2037 2047 2060 2062 2051 2023 2014 2027 2034 2033 2040 2047 2047 2053 2058 2064 2059 2063 2061 2052 2053 2038 1966 1885 1884 2009 2129 2166 2137 2102 2086 2077 2067 2067 2060 2059 2062 2062 2060 2057 2045 2047 2057 2054 2042 2029 2027 2018 2007 1995 2001 2012 2024 2039 2068 2092 2111 2125 2131 2148 2137 2138 2128 2128 2115 2099 2097 2096 2101 2101 2091 2073 2076 2077 2084 2081 2088 2092 2070 2069 2074 2077 2075 2068 2064 2060 2062 2074 2075 2074 2075 2063 2058 2058 2064 2064 2070 2074 2067 2060 2062 2063 2061 2059 2048 2052 2049 2048 2051 2059 2059 2066 2077 2073"
* component[ekgLeads][+].code = $loinc#LP7386-4 "Lead III"
* component[ekgLeads][=].valueSampledData.origin.value = 2048
* component[ekgLeads][=].valueSampledData.period = 10
* component[ekgLeads][=].valueSampledData.dimensions = 1
* component[ekgLeads][=].valueSampledData.data = "2041 2043 2037 2047 2060 2062 2051 2023 2014 2027 2034 2033 2040 2047 2047 2053 2058 2064 2059 2063 2061 2052 2053 2038 1966 1885 1884 2009 2129 2166 2137 2102 2086 2077 2067 2067 2060 2059 2062 2062 2060 2057 2045 2047 2057 2054 2042 2029 2027 2018 2007 1995 2001 2012 2024 2039 2068 2092 2111 2125 2131 2148 2137 2138 2128 2128 2115 2099 2097 2096 2101 2101 2091 2073 2076 2077 2084 2081 2088 2092 2070 2069 2074 2077 2075 2068 2064 2060 2062 2074 2075 2074 2075 2063 2058 2058 2064 2064 2070 2074 2067 2060 2062 2063 2061 2059 2048 2052 2049 2048 2051 2059 2059 2066 2077 2073"