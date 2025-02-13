---
expand: 5
---
## {{page-title}}

### Szenario
* minderjähriges Kind
* familienversichert über Mutter
* Selbstzahlerverhältnis mit abw. Rechnungsempfänger
* vorstationärer, stationärer und nachstationärer Besuch
* Abrechnung als DRG-Fall 
* stationärer Aufenthalt mit Wahlleistung Begleitperson (keine Kassenleistung, wird selbst bezahlt)

### Ressourcen-Graph

{{render:Material/images/Szenarien/Szenario1-BundleViewer.png}}

### Instanzen: Personen
<tabs>
    <tab title="Patientin">      
        {{render:SZ1Patient}}
        Link: {{link:SZ1Patient}}
    </tab>
    <tab title="Mutter">      
        {{render:SZ1Mutter}}
        Link: {{link:SZ1Mutter}}
    </tab>
</tabs>

### Instanzen: Versicherungsverhältnisse
<tabs>
    <tab title="Versicherung gesetzlich">
        {{render:SZ1VersicherungGesetzlich}}
        Link: {{link:SZ1VersicherungGesetzlich}}
    </tab>
    <tab title="Versicherung Selbstzahler">
        {{render:SZ1VersicherungSelbstzahler}}
        Link: {{link:SZ1VersicherungSelbstzahler}}
    </tab>
</tabs>

### Instanzen: Besuche
<tabs>
    <tab title="Vorstationärer">
        {{render:SZ1Vorstationaer}}
        Link: {{link:SZ1Vorstationaer}} 
    </tab>
    <tab title="Stationär">
        {{render:SZ1Stationaer}}
        Link: {{link:SZ1Stationaer}} 
    </tab>
    <tab title="Nachstationär">
        {{render:SZ1Nachstationaer}}
        Link: {{link:SZ1Nachstationaer}} 
    </tab>
</tabs>

### Instanzen: Abrechnungsfall
<tabs>
    <tab title="DRG-Abrechnungsfall">
        {{render:Resources/fsh-generated/resources/Account-SZ1DRGFall.json}}
        Link: {{link:Resources/fsh-generated/resources/Account-SZ1DRGFall.json}} 
    </tab>
</tabs>
