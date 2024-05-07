# Zusammenfassung

## Autor

- Krystian Usarz
  - <usarz.krystian7@gmail.com>
  - [Github](https://github.com/KrystianUsarz)

## Unbefugte Datenbeschaffung
Der Artikel StGB Art. 143 besagt Grundsätzlich, dass jeder, der sich zugang zu Daten um sich zu bereichern oder um sich einen Vorteil zu verschafften  zugang verschafft und diese nicht für Ihn bestimmt und gegen seinen unbefugten zugriff besonderst geschützt sind mit einer Freiheitsstrage bis zu 5 Jahren oder einer Geldstrafe bestraft wird. Die einzige ausnahme ist die Famillie, dort wird dies nur auf Antrag verfolgt.
 
Unbefugtes Eindringen in ein Datenverarbeitungssysthem
Wer sich zugang ine ein Fremdes gegen seinen Zugriff besonders gesichertes Datenverarbeitungssysthem eindringt wird auf Antrag mit Freiheitsstrafe bis zu drei Jahren oder einer Geldstrafe bestraft. Das selbe gilt für die unterstützung solcher Aktionen durch das weitergeben von Passwörtern oder Programmen.
 
## Schutzziele
- CIA
    - Confidentiality = Vertraulichkeit
      - Vertraulichkeit ist die Eigenschaft, dass Informationen für unbefugte Personen, Entitäten oder Prozesse, nicht verfügbar gemacht oder offenbart werden.
    - Integrity= Integrität
      - Datenintegrität bedeutet die Aufrechterhaltung und Sicherung der Genauigkeit und Vollständigkeit der Daten.
      - Daten dürfen nicht unberechtigt oder unentdeckt geändert werden können.
    - Availability = Verfügbarkeit
      - Verfügbarkeit bedeutet, dass Informationen abrufbar sein müssen, wenn sie benötigt werden.
    - Non-Repudiation = nicht-Abstreitbarkeit
      - Die nicht-Abstreitbarkeit bedeutet, dass eine Partei einer Transaktion nicht bestreiten kann, eine Transaktion erhalten zu haben.
      - Die andere Partei kann nicht verweigern, eine Transaktion gesendet zu haben.
 
## Informationsquellen zu Schwachstellen
 
- NCSC
- GovCert
- Medien (Sociale Medien, Zeitungen)
- CVE Details
- Security Veranstaltungen
  - Swiss Cyber Storm
  - Area 41

## Einstiegsauftrag zu CIA

### Prominente Sicherheitsverletzungen:
  - Equifax (2017): Eine Sicherheitslücke in einer Webanwendung führte dazu, dass das Unternehmen die personenbezogenen Daten von 145 Millionen US-Bürgern verlor. Gestohlen wurden unter anderem Namen, Sozialversicherungsnummern und Führerscheinnummern1.
  - Yahoo (2013): Durch einen Phishing-Angriff konnten sich Hacker Zugang zum Netzwerk des Unternehmens verschaffen. Dabei wurden insgesamt 3 Milliarden Benutzerkonten kompromittiert1.
  - Toyota: Eine Datenpanne trat auf, da sich ein Dritter mit Zugangsdaten, die er aus dem von einem Drittanbieter auf GitHub veröffentlichten Quellcode erhalten hatte, Zugang zu einem Unternehmensserver verschaffen konnte2.


### Anwendungen, in denen Vertraulichkeit, Verfügbarkeit, Integrität und Nicht-Abstreitbarkeit von entscheidender Bedeutung sind:
  1. Online-Banking: Vertraulichkeit ist entscheidend, um sicherzustellen, dass nur der Kontoinhaber Zugang zu seinen Finanzinformationen hat. Verfügbarkeit ist wichtig, damit Kunden jederzeit auf ihre Konten zugreifen können. Integrität stellt sicher, dass Transaktionen korrekt und vollständig sind. Nicht-Abstreitbarkeit ist wichtig, um sicherzustellen, dass einmal durchgeführte Transaktionen nicht abgestritten werden können3.
  2. Gesundheitswesen: Patientendaten müssen vertraulich behandelt werden. Verfügbarkeit ist entscheidend, damit medizinisches Personal jederzeit auf Patienteninformationen zugreifen kann. Integrität ist wichtig, um sicherzustellen, dass Patientendaten korrekt und unverändert sind. Nicht-Abstreitbarkeit ist wichtig, um sicherzustellen, dass medizinische Aufzeichnungen authentisch sind und nicht abgestritten werden können3.
  3. E-Commerce: Vertraulichkeit ist wichtig, um Kundendaten und Zahlungsinformationen zu schützen. Verfügbarkeit stellt sicher, dass Kunden jederzeit Einkäufe tätigen können. Integrität stellt sicher, dass Transaktionen korrekt und vollständig sind. Nicht-Abstreitbarkeit ist wichtig, um sicherzustellen, dass einmal durchgeführte Transaktionen nicht abgestritten werden können
  - [Quelle](https://www.kryptowissen.de/schutzziele.php)
 
## Vertraulcihkeit
 
**Definition von Vertraulichkeit:** Vertraulichkeit ist die Eigenschaft einer Nachricht, nur für einen beschränkten Empfängerkreis vorgesehen zu sein. Weitergabe und Veröffentlichung sind nicht erwünscht. [Vertraulichkeit wird durch Rechtsnormen geschützt, sie kann auch durch technische Mittel gefördert oder erzwungen werden1.](https://de.wikipedia.org/wiki/Vertraulichkeit)

#### Alltägliche Beispiele für Vertraulichkeit:
  1. Arbeitsplatz: Eine typische Bedrohung für die Vertraulichkeit von Daten ist, wenn der Arbeitsplatz akustisch oder visuell nicht richtig abgesichert ist und Unbefugte so einfach an Informationen gelangen können2.
  2. E-Mails: Unverschlüsselte E-Mails sind wie Postkarten. Alles, was darin steht, ist potenziell für jeden lesbar, während die E-Mail vom Sender zum Empfänger transportiert wird2.
  3. Gespräche: Vertraulichkeit kann durch organisatorische Maßnahmen erreicht werden, indem der Gesprächskreis klein ist, sich an einem Ort unterhält, an dem sich Dritte nicht aufhalten, die Lautstärke des Gesprächs anpasst und die Teilnehmer an die Vertraulichkeit erinnert oder sie auf die Vertraulichkeit verpflichtet3.

### Verschlüsselungstechniken:
  1. **Symmetrische Verschlüsselung:** Bei dieser Methode wird derselbe Schlüssel zum Verschlüsseln und Entschlüsseln der Daten verwendet. Ein bekanntes Beispiel ist der Advanced Encryption Standard (AES)4.
  2. **Asymmetrische Verschlüsselung:** Hier werden zwei Schlüssel verwendet - ein öffentlicher Schlüssel zum Verschlüsseln der Daten und ein privater Schlüssel zum Entschlüsseln. Ein bekanntes Beispiel ist das RSA-Verfahren (Rivest–Shamir–Adleman)4.
  3. **Elliptic Curve Cryptography (ECC):** Dies ist eine Form der asymmetrischen Verschlüsselung, die auf der Algebra von elliptischen Kurven basiert. Sie bietet eine hohe Sicherheit bei relativ kurzen Schlüssellängen4.

## Verfügbarkeit
 
**Unterschied zwischen DoS und DDoS:** Ein Denial of Service (DoS)-Angriff ist ein Angriff eines einzelnen Systems auf ein einzelnes System, während bei einem Distributed Denial of Service (DDoS)-Angriff mehrere Systeme ein einzelnes System angreifen1. Der Hauptunterschied besteht darin, dass ein DoS-Angriff von einem einzigen Standort ausgeht, während ein DDoS-Angriff von mehreren dezentralen Standorten aus unter Verschleierung seines Ursprungs erfolgt1.

### Drei verschiedene Arten von DDoS-Angriffen:
1. **Protokollangriffe:** Diese Art von Angriffen zielt darauf ab, Serverressourcen zu erschöpfen oder Netzwerkkomponenten wie Load-Balancer zu überlasten2.
2. **Volumetrische Angriffe:** Diese Angriffe zielen darauf ab, die Bandbreite eines Netzwerks zu überlasten, indem sie es mit sinnlosen Daten (Junk-Daten) überfluten2.
3. **Anwendungsschichtangriffe:** Diese Angriffe zielen auf Webserver-Anwendungen ab und versuchen, sie durch das Senden von scheinbar unschuldigen, aber tatsächlich schädlichen Anfragen zu überlasten2.
### Abwehrstrategien gegen DDoS-Angriffe:
1. **Firewall-Konfigurationen:** Eine gut konfigurierte Firewall kann helfen, böswilligen Datenverkehr zu blockieren und so einen DDoS-Angriff abzuwehren3.
2. **Traffic-Filtering-Technologien:** Diese Technologien können dazu beitragen, den Datenverkehr zu analysieren und schädlichen Datenverkehr zu identifizieren und zu blockieren3.
3. **Lastenausgleich:** Lastenausgleichssysteme können dazu beitragen, den Datenverkehr gleichmäßig auf mehrere Server zu verteilen, wodurch Ihr Netzwerk widerstandsfähiger gegen DDoS-Angriffe wird4.
4. **Regelmäßige Aktualisierungen:** Durch regelmäßige Aktualisierungen Ihrer Systeme und Sicherheitsmaßnahmen können Sie die Wahrscheinlichkeit eines erfolgreichen Angriffs erheblich reduzieren5.

## Integrität
 
**Definition von Integrität:** Integrität bezeichnet die Eigenschaft eines Menschen, ehrlich, aufrichtig und authentisch zu handeln. Eine Person mit hoher Integrität handelt nach moralischen und ethischen Grundsätzen und bleibt auch in schwierigen Situationen ihren Überzeugungen und Werten treu12.

### Reale Beispiele für Integrität:
  1. **Arbeitsplatz:** Eine Person mit Integrität gibt die Ideen von Mitarbeitern nicht als eigene aus und stellt sich vor Mitarbeiterinnen und Mitarbeiter, die gemobbt werden3.
  2. **E-Mails:** Eine Person mit Integrität würde nicht auf die Idee kommen, hinter dem Rücken zu lästern oder jemandem ins Gesicht zu lügen und etwas anderes zu sagen, als sie meinen4.
  3. **Gespräche:** Eine Person mit Integrität handelt so, dass sich ihre Prinzipien, persönlichen Überzeugungen und moralischen Wertmaßstäbe in ihrem Verhalten widerspiegeln1.

**Hashing-Verfahren:** Hashing ist ein Verfahren, bei dem mithilfe einer Hash-Funktion eine eindeutige Zeichenkette generiert wird. Diese Zeichenkette, auch Hash-Wert genannt, dient als eindeutiger Identifikator für einen bestimmten Datensatz5. Einige der bekanntesten und häufig verwendeten Hashing-Algorithmen sind MD5, SHA-1, SHA-256 und SHA-35.  
**Digitale Signaturen:** Eine digitale Signatur ist eine elektronische Unterschrift, bei der ein digitales Zertifikat hinterlegt ist. Digitale Signaturen entsprechen internationalen Vorgaben und bieten ein Höchstmaß an Zuverlässigkeit bei der Authentifizierung von Unterzeichnenden und digitalen Dokumenten6.  
**Anwendungen für Hashing-Verfahren und digitale Signaturen:** Datenorganisation: Hashing-Algorithmen werden häufig eingesetzt, um Daten effizient zu speichern, zu überprüfen und zu sichern5.  
**Sicherheitstechnik:** Durch die Verwendung von Hash-Funktionen können digitale Signaturen erzeugt werden, die die Integrität und Authentizität von digitalen Dokumenten gewährleisten5.  
**Kryptowährungen:** SHA-256, ein Hashing-Algorithmus, wird häufig in Kryptowährungen und digitalen Signaturen verwendet5.

## Nicht-abstreitbarkeit

**Definition von Nicht-Abstreitbarkeit:** Nicht-Abstreitbarkeit (engl. non-repudiation) bezieht sich auf die Nachweisbarkeit gegenüber Dritten. Das Ziel ist es, sicherzustellen, dass der Versand und Empfang von Daten und Informationen nicht in Abrede gestellt werden kann12. Es wird unterschieden zwischen der Nichtabstreitbarkeit der Herkunft (die Absenderin/der Absender soll das Versenden einer Nachricht nachträglich nicht bestreiten können) und der Nichtabstreitbarkeit des Erhalts (die Empfängerin/der Empfänger soll den Erhalt einer Nachricht nachträglich nicht bestreiten können)1.

**Beispiele von Situationen, in denen Nicht-Abstreitbarkeit eine Schlüsselrolle spielt:**
  1. E-Mail-Kommunikation: In der E-Mail-Kommunikation ist die Nicht-Abstreitbarkeit wichtig, um sicherzustellen, dass der Sender einer E-Mail das Senden der E-Mail nicht abstreiten kann und der Empfänger den Erhalt der E-Mail nicht abstreiten kann1.
  2. Online-Transaktionen: Bei Online-Transaktionen, insbesondere bei Finanztransaktionen, ist die Nicht-Abstreitbarkeit entscheidend, um sicherzustellen, dass eine durchgeführte Transaktion nicht abgestritten werden kann2.
  3. Digitale Signaturen: Digitale Signaturen bieten Nicht-Abstreitbarkeit, indem sie sicherstellen, dass eine signierte Nachricht nicht abgestritten werden kann2.

- [Quelle](https://datenschutz.ch/lexika/informationssicherheit-glossar/nichtabstreitbarkeit)
 
## Schwachstellen aus dem Unterricht
### Sniffing
- «Schnüffeln» von Daten im Netzwerk
- Daten
- Zugangsdaten
- Zertifikate
- Etc.
- Gegenmassnamen
    - Verschlüsseln  - NAC (Network Access Control)
### Spoofing
- Verschleiern der eigenen Identität oder Vortäuschung einer anderen Identität
- Arten von Spoofing
    - IP, E-Mail, DNS, ARP, URL, GPS, CallerID, etc.
- Gegenmassnahmen
    - «gesundes» Misstrauen
    - Signieren
## Man-in-the-Middle
- Angreifer positioniert sich logisch oder physisch zwischen Opfer und Ressource
- Informationen abfangen
- Mitlesen
- Manipulieren
- Gegenmassnahme
    - Ende-zu-Ende Verschlüsselung
## Reconnaissance / DDoS
- Reconnaissance (Aufklärung)
    - IP + Port Scans
    - DNS Scans
    - Social Media
- DDoS (nicht DoS)
    - Überlastung eines Ziels mit max. Requests / Bandbreite
- Gegenmassnahmen
    - Firewalling
    - Header Informationen minimieren
## Hijacking
- Hijacking (Übernehmen)
    - Sessions
    - Domains
    - Content
    - Malware / RAT
- Gegenmassnahmen
    - Zertifikate
    - Starkes Session Handling
    - Prozesse
    - Etc.
## Phishing
- Diebstall von Informationen durch gefälschte E-Mails, Webseiten, SMS, etc.
- Gegenmassnahmen
    - «gesundes» Misstrauen
    - Zertifikate
    - Awareness
## Exploits
- Ausnutzung von Schwachstellen in Software und Systemen um die Schutzziele zu verletzen
- Arten
   - RCE, LFI, RFI, DoS, Injections, etc.
- Gegenmassnahmen
    - Safe Coding
    - Patchen
    - IDS, IPS, WAF, etc.
## Sites & Writeups
- Hack the Box Writeup
- TryHackMe Writeup
- VulnHub Writeup
- Bug Bounty Writeup (Beispiel)
## OSINT
- Was ist OSINT?
- Open Source Itelligence
- Methodologie um Informationen zu…
    - erhalten
    - analysieren
    - korrelieren
- per-se öffentliche Informationen
## SQL Injection im Detail
- Query Sprache für relationale Datenbanken
- Prozedur
    - Applikation macht SQL Abfrage um DB Informationen abzufragen
    - DB gibt das Resultat der Applikation zurück und zeigt es an
- Befehle
    - Select
    - Insert
    - Update
    - Delete
    - Ausführung von Stored Procedures
- Bypass
    - ' or '1'='1
    - Reverse DNS
    - ‘; exec master..xp_cmdshell ‘nslookup domain.ch’
    - Reverse Ping
    - ‘; exec master..xp_cmdshell ‘ping x.x.x.x’
- Schutzmöglichkeiten 
    - Zugriff auf Applikation / Service
    - Input Validation für User Front-End
    - Limitieren von User Zugriffen
- SQL Injection Cheat Sheet
    - https://www.netsparker.com/blog/web-security/sql-injection-cheat-sheet/

## Unterschied DoS und DDoS
 
1. **Denial of Service (DoS)**
  - Probleme: Ein Angreifer kann den normalen Betrieb eines Geräts unterbrechen, indem er es mit Anfragen überlastet.
  - Folgen: Dies kann dazu führen, dass das Gerät für seine beabsichtigten Benutzer unzugänglich wird.
  - Behebung: Implementierung von Rate-Limiting, Intrusion-Detection-Systemen und Firewalls.
2. **Distributed Denial of Service (DDoS)**
  - Probleme: Mehrere Systeme greifen ein einzelnes System an, was zu einer Überlastung führt.
  - Folgen: Dies kann dazu führen, dass das Zielgerät für seine beabsichtigten Benutzer unzugänglich wird.
  - Behebung: Implementierung von DDoS-Minderungsmaßnahmen wie Blackholing und sinkholing, Anycast-Netzwerken und Intrusion-Prevention-Systemen.

Und hier ist der Unterschied zwischen DoS und DDoS:
  - **Erkennung/Abmilderung:** Ein DoS-Angriff stammt von einem einzigen Standort, was die Erkennung und Abmilderung erleichtert. Ein DDoS-Angriff hingegen stammt von mehreren Standorten, was die Erkennung und Abmilderung erschwert.
  - **Angriffsgeschwindigkeit und Datenverkehrsvolumen:** Ein DDoS-Angriff kann schneller ausgeführt werden und größere Datenmengen senden, da er von mehreren Standorten aus erfolgt.
  - **Ausführungsart und Rückverfolgung der Quelle(n):** Ein DDoS-Angriff verwendet ein Botnet, was die Rückverfolgung des tatsächlichen Ursprungs komplizierter macht als bei einem DoS-Angriff, der in der Regel von einem einzigen Rechner aus ausgeführt wird.

- [Quelle](https://www.fortinet.com/de/resources/cyberglossary/dos-vs-ddos)

## CVE bzw. CVSS Scoring System

1. **Common Vulnerabilities and Exposures (CVE)**
  - Probleme: Es gibt viele verschiedene Sicherheitsschwachstellen, die in verschiedenen Systemen und Anwendungen existieren können.
  - Folgen: Ohne eine standardisierte Methode zur Identifizierung dieser Schwachstellen kann es schwierig sein, sie effektiv zu verwalten und zu beheben.
  - Behebung: Das CVE-System bietet eine standardisierte Methode zur Identifizierung und Katalogisierung von öffentlich bekannten Sicherheitsschwachstellen123.
  - [Quelle](https://www.redhat.com/en/topics/security/what-is-cve)

2. **Common Vulnerability Scoring System (CVSS)**
  - Probleme: Es ist schwierig, die Schwere von Sicherheitsschwachstellen auf eine Weise zu bewerten, die konsistent und wiederholbar ist.
  - Folgen: Ohne eine standardisierte Bewertungsmethode kann es schwierig sein, zu entscheiden, welche Schwachstellen zuerst behoben werden sollten.
  - Behebung: Das CVSS bietet eine Methode zur Bewertung der Schwere von Sicherheitsschwachstellen. Es generiert eine Punktzahl von 0 bis 10 basierend auf der Schwere der Schwachstelle. CVSS-Werte wurden auch in die Ranglisten “Kritisch”, “Hoch”, “Mittel” und “Niedrig” gruppiert456.
  - [Quelle](https://www.sans.org/blog/what-is-cvss/)
 
Und hier ist der Unterschied zwischen CVE und CVSS:
 
- **CVE** ist ein System, das dazu dient, Sicherheitsschwachstellen zu identifizieren und zu katalogisieren. Jede Schwachstelle erhält eine eindeutige CVE-ID, die zur Identifizierung der spezifischen Schwachstelle verwendet wird123.
- **CVSS** hingegen ist ein System, das dazu dient, die Schwere von Sicherheitsschwachstellen zu bewerten. Es generiert eine Punktzahl von 0 bis 10, die auf der Schwere der Schwachstelle basiert. Diese Punktzahl kann dann verwendet werden, um zu entscheiden, welche Schwachstellen zuerst behoben werden sollten

## OWASP 

1. **Open Web Application Security Project (OWASP)**
  - Probleme: Es gibt viele verschiedene Sicherheitslücken, die in verschiedenen Systemen und Anwendungen existieren können.
  - Folgen: Ohne eine standardisierte Methode zur Identifizierung dieser Schwachstellen kann es schwierig sein, sie effektiv zu verwalten und zu beheben.
  - Behebung: OWASP ist eine Non-Profit-Organisation, die zum Ziel hat, für mehr Sicherheit in Anwendungen und Diensten des World Wide Webs zu sorgen12. Sie bietet eine standardisierte Methode zur Identifizierung und Katalogisierung von öffentlich bekannten Sicherheitsschwachstellen12.

Ziel und Zweck von OWASP:
 
- Ziel: OWASP hat das Ziel, die Sicherheit von Webanwendungen zu verbessern12. Sie weist auf Risiken für Webanwendungen hin und schafft dadurch Transparenz für Endanwender oder Organisationen hinsichtlich Websecurity1.
- Zweck: OWASP stellt Informationen, Dokumentationen, Tools und Lösungen bereit1. Sie unterstützt Entwickler, Entscheider, QA-Spezialisten und Penetrationstester1. Eine bekannte Veröffentlichung ist die jährlich zusammengestellte Top 10 Liste der häufigsten Angriffe und größten Risiken im Bereich Webapplikationen

- [Quelle](https://www.security-insider.de/was-ist-owasp-a-741869/)

## Kali Linux

1. **Kali Linux**
  - Probleme: Es gibt viele verschiedene Sicherheitslücken, die in verschiedenen Systemen und Anwendungen existieren können.
  - Folgen: Ohne eine standardisierte Methode zur Identifizierung dieser Schwachstellen kann es schwierig sein, sie effektiv zu verwalten und zu beheben.
  - Behebung: Kali Linux ist ein kostenloses, quelloffenes Betriebssystem, das für fortgeschrittene Penetrationstests und Sicherheitsprüfungen verwendet wird12. Es ist für ethische Hacker und Sicherheitsexperten entwickelt worden, die ihre Systeme auf Schwachstellen testen müssen12.
2. **Pentesting Framework**
  - Probleme: Es ist schwierig, die Schwere von Sicherheitsschwachstellen auf eine Weise zu bewerten, die konsistent und wiederholbar ist.
  - Folgen: Ohne eine standardisierte Bewertungsmethode kann es schwierig sein, zu entscheiden, welche Schwachstellen zuerst behoben werden sollten.
  - Behebung: Ein Pentest-Framework, oder Penetration Testing Framework, ist ein standardisierter Satz von Richtlinien und vorgeschlagenen Tools zur Strukturierung und Durchführung effektiver Pentests34.
3. **Security Analyse Framework**
  - Probleme: Es ist schwierig, die Schwere von Sicherheitsschwachstellen auf eine Weise zu bewerten, die konsistent und wiederholbar ist.
  - Folgen: Ohne eine standardisierte Bewertungsmethode kann es schwierig sein, zu entscheiden, welche Schwachstellen zuerst behoben werden sollten.
  - Behebung: Ein Sicherheitsframework definiert Richtlinien und Verfahren zur Einrichtung und Aufrechterhaltung von Sicherheitskontrollen56. Frameworks klären Prozesse, die zum Schutz einer Organisation vor Cybersicherheitsrisiken verwendet werden. Sie helfen IT-Sicherheitsprofis und Sicherheitsteams, ihre Organisationen konform und vor Cyberbedrohungen geschützt zu halten

## 24 Deadly sins

1. **24 Deadly Sins of Software Development**
  - Probleme: Es gibt viele verschiedene Sicherheitslücken, die in verschiedenen Systemen und Anwendungen existieren können.
  - Folgen: Ohne eine standardisierte Methode zur Identifizierung dieser Schwachstellen kann es schwierig sein, sie effektiv zu verwalten und zu beheben.
  - Behebung: “24 Deadly Sins of Software Security” ist ein Buch, das die häufigsten Design- und Programmierfehler aufzeigt und erklärt, wie man sie beheben oder besser noch, von Anfang an vermeiden kann123.
  - [Link zum Buch](https://www.amazon.com/Deadly-Sins-Software-Security-Programming/dp/0071626751)
2. **Exception/Error Handling**
  - Probleme: Unerwartete oder fehlerhafte Situationen können während der Programmausführung auftreten.
  - Folgen: Ohne eine effektive Methode zur Behandlung dieser Ausnahmen kann es zu Programmabstürzen oder unerwünschtem Verhalten kommen.
  - Behebung: Exception Handling ist ein kritischer Aspekt der Programmierung, der Entwicklern ermöglicht, unerwartete oder fehlerhafte Situationen elegant zu verwalten4567.
3. **Weak Random Numbers**
  - Probleme: Die Erzeugung von Zufallszahlen auf Computern ist eine Herausforderung, da Computer deterministische Maschinen sind.
  - Folgen: Schwache Zufallszahlen können die Sicherheit von Systemen beeinträchtigen, insbesondere wenn sie für kryptographische Zwecke verwendet werden.
  - Behebung: Es wird empfohlen, kryptographisch sichere Pseudozufallszahlengeneratoren (CSPRNGs) anstelle von schwachen PRNGs zu verwenden

## Entdecken von Lücken
1. **Fuzz-Testing**
  - Probleme: Software kann unerwartete oder ungültige Eingaben enthalten, die zu Fehlern oder Sicherheitslücken führen können.
  - Folgen: Ohne eine effektive Methode zur Behandlung dieser Eingaben kann es zu Programmabstürzen oder unerwünschtem Verhalten kommen.
  - Behebung: Fuzz-Testing ist eine automatisierte Software-Testmethode, die ungültige, fehlerhafte oder unerwartete Eingaben in ein System einfügt, um Softwarefehler und Schwachstellen aufzudecken123.
  - [Quelle](https://www.synopsys.com/glossary/what-is-fuzz-testing.html)
2. **Security Scanner**
  - Probleme: Es gibt viele verschiedene Sicherheitslücken, die in verschiedenen Systemen und Anwendungen existieren können.
  - Folgen: Ohne eine standardisierte Methode zur Identifizierung dieser Schwachstellen kann es schwierig sein, sie effektiv zu verwalten und zu beheben.
  - Behebung: Ein Sicherheitsscanner ist ein automatisiertes Sicherheitstestwerkzeug, das nach Fehlkonfigurationen oder Programmierfehlern sucht, die Cybersicherheitsbedrohungen darstellen. Sicherheitsscanner stützen sich entweder auf eine Datenbank mit bekannten Schwachstellen oder suchen nach gängigen Fehlerarten, um unbekannte Schwachstellen zu entdecken456.
  - [Quelle](https://snyk.io/de/learn/vulnerability-scanner/)
3. **Code Review Basics**
  - Probleme: Unerwartete oder fehlerhafte Situationen können während der Programmausführung auftreten.
  - Folgen: Ohne eine effektive Methode zur Behandlung dieser Ausnahmen kann es zu Programmabstürzen oder unerwünschtem Verhalten kommen.
  - Behebung: Code-Review ist ein Prozess zur Sicherstellung, dass Fehler und Fehler erkannt und behoben werden, bevor sie die Produktion erreichen. Dies erfordert sehr oft die Beteiligung von Entwicklern, die nicht direkt an der Implementierung des jeweiligen Codeabschnitts beteiligt sind.
  - [Quelle](https://www.freecodecamp.org/news/code-review-the-ultimate-guide-aa45c358bbf5/)

## Penetration Testing
 
- Was ist es: Penetration Testing, kurz Pentest, ist ein umfassender Sicherheitstest einzelner Rechner oder Netzwerke jeglicher Größe. Ein Penetrationstest prüft die Sicherheit von Systembestandteilen und Anwendungen eines Netzwerks oder Softwaresystems mit Mitteln und Methoden, die tauglich sind, um unautorisiert in das System einzudringen (Penetration). Penetrationstests können Sicherheitslücken aufdecken, aber nicht ausschließen12.
- Welche Regeln sind zu beachten: Die Art der Sicherheitstests orientiert sich am Gefahrenpotential eines gefährdeten Systems, Netzwerks oder einer Anwendung. Entsprechend zahlreich sind die Hilfswerkzeuge für Penetrationstests und entsprechend sollten derart umfassende Sicherheitstests lediglich erfahrene Sicherheitsforscher oder Systemadministratoren durchführen, die wissen, was sie machen, welche Ereignisse sie damit verursachen und welche Ergebnisse sie damit erzielen möchten1.
- Es ist wichtig zu beachten, dass das unautorisierte Eindringen in fremde Computersysteme, das Stören der Funktionsfähigkeit von Computern und das Manipulieren von Daten, nach §§ 202c, 303a sowie 303b StGB eine Straftat ist. Daher muss die Art und der Umfang der Hacking-Tätigkeit vom Auftraggeber abgesegnet sein, um sich hier nicht strafbar zu machen3.
- [Quelle](https://de.wikipedia.org/wiki/Penetrationstest_%28Informatik%29)

## Web Application Firewall

1. **Web Application Firewalls (WAF)**
  - Was ist es: Eine Web Application Firewall (WAF) ist ein Verfahren, das Webanwendungen vor Angriffen über das Hypertext Transfer Protocol (HTTP) schützen soll. Sie stellt damit einen Spezialfall einer Application Layer Firewall (ALF) oder eines Application Layer Gateways (ALG) dar1. Eine WAF prüft und filtert den Verkehr zwischen den Webanwendungen und dem Internet und kann dazu beitragen, Webanwendungen gegen Angriffe wie z. B. Cross-Site Request Forgery (CSRF), Cross-Site-Scripting (XSS), File Inclusion und SQL-Injektion zu verteidigen2.
  - Regeln: Eine WAF sitzt zwischen den Webanwendungen eines Unternehmens und den Anfragen aus dem Internet. Über Reverse Proxy überwacht, filtert oder blockiert sie Datenpakete, die von und zu einer Webanwendung unterwegs sind2.
2. **ModSecurity 3**
  - Was ist es: ModSecurity ist eine Open-Source, plattformübergreifende Web Application Firewall (WAF) Engine für Apache, IIS und Nginx3. Sie hat eine robuste ereignisbasierte Programmiersprache, die Schutz vor einer Reihe von Angriffen gegen Webanwendungen bietet und das Überwachen, Protokollieren und Echtzeitanalysieren von HTTP-Verkehr ermöglicht3.
  - Regeln: ModSecurity bietet die Möglichkeit, proaktiv Richtlinien und Regeln festzulegen. Anwendungssicherheitsteams sind in der Lage zu überwachen, was eine WAF durchlassen darf und was nicht. Dadurch können Teams rechtzeitig über einen laufenden Angriff informiert werden, damit sie erheblich schneller auf potenzielle Sicherheitsvorfälle reagieren können2.

- [Quelle](https://de.wikipedia.org/wiki/Penetrationstest_%28Informatik%29)