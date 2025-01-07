# Motivation

Die bedarfsgerechte Bereitstellung von klinischen Dokumenten spielt bei der Patientenversorgung eine wichtige Rolle.
Dokumente liegen in den meisten Fällen in elektronischer Form vor (digital erstellt oder eingescannt). Die in den Einrichtungen etablierten Kommunikationsverfahren mittels HL7 Version 2 haben jedoch ausschließlich die Server-zu-Server-Kommunikation im Fokus und erlauben keine standardisierte query-getriebene Dokumentenbereitstellung, wie sie zum Beispiel für webbasierte und mobile Applikationen erforderlich wäre.
Eine solche Form der Dokumentenverfügbarkeit ist jedoch die Voraussetzung dafür, ärztlichem und pflegerischem Personal relevante klinische Informationen an jedem Ort und zu jeder Zeit im benötigten Umfang zur Verfügung zu stellen.

Das ISiK-Modul "Dokumentenaustausch" möchte diese technologische Lücke schließen und webbasierten Applikationen darüber hinaus auch die Bereitstellung neu erstellter Dokumente (z.B. Formulare, die auf einem Tablet ausgefüllt wurden; Bilddokumentation, die mithilfe einer Smartphone-App erstellt wurde; Befunddokumentation, die an webbasierten Clients verfasst wurde; mit einer Smartphone-Kamera gescannte Dokumente; etc.) in den entsprechenden Dokumentenverwaltungssystemen mit einfachen Mitteln ermöglichen.

Bei der Festlegung dieser Spezifikation findet das IHE-MHD-Profil eine besondere Beachtung, um alle im ISiK-Kontext kommunizierten Dokumente mit möglichst wenig zusätzlichem Aufwand auch in einer IHE-XDS/MHD Kommunikation austauschen zu können.

Der Fokus dieser Spezifikation liegt zunächst auf den Festlegungen zum Datenaustausch *innerhalb* einer Einrichtung, soll künftig jedoch auch Best Practice-Empfehlungen zur Einstellung von Dokumenten in die ePA eines Patienten, der Weiterleitung an andere Leistungserbringer via KIM oder dem einrichtungsübergreifenden Dokumentenaustausch via MHD/XDS enthalten.

{{render:Material-Images-isikkontextunderwscope}}
