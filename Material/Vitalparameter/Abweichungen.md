Designentscheidung
- Max Kardinalitäten von coding slices wurden entfernt
- Profile aus der MII die den bisherigen, existenten Profilen entsprechen wurden in die bisherigen Profile gemerged, Anpassungen aus der MII wurden in "comments" des elements erfasst
- Änderung: unit sollte nicht per pattern fixiert werden -> entfernt
- Da es keinen generischen LOINC-Code "Pulse" gibt, und wir immer einen LOINC-Code fordern wurde Pulse der Loinc Code:8867-4 "Heart Rate" zugeordnet

Korrekturen:
- In teilen falscher IEE code: urn:std:iso:11073:10101, korrekt wäre: urn:iso:std:iso:11073:10101
- Kopfumfang: 363812007 (KBV, BasisDE) vs 363811000 ICU
- linksventrikulaerer-druck: category nicht belegt, kein LOINC Code
- Sonstige pulsatile Drücke: = $sct#75367002 kann nicht gesetzt werden weil children andere sct codes setzen
- Selbiges für 11073