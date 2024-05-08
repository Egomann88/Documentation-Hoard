# Zusammenfassung

## Autoren

### Bearbeitet und weitergeführt von

- **Justin Urbanek**
  - [Github](https://github.com/Egomann88)

### Original erstellt von

- **Krystian Usarz**
  - <usarz.krystian7@gmail.com>
  - [Github](https://github.com/KrystianUsarz)

## Unbefugte Datenbeschaffung

**Art. 143 StGB** besagt, wenn eine Person sich _Zugang_ zu Daten verschafft, welche nicht für diese bestimmt sind und die Daten gegen unbefugten Zugriff geschützt sind, kann eine Freiheitsstrafe von bis zu 5 Jahren oder eine Geldstrafe erhalten.

## Unbefugtes Eindringen in ein Datenverarbeitungssystem

Personen, welche in ein fremdes, gegen unbefugten Zugriff geschütztes Datenverarbeitungssystem eindringen, können mit einer Freiheitsstrafe von bis zu 3 Jahren oder einer Geldstrafe bestraft werden. Die Unterstützung solcher Aktionen durch das Weitergeben von Passwörtern oder Programmen ist ebenfalls strafbar.

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
- Medien (soziale Medien, Zeitungen)
- CVE Details
- Security Veranstaltungen
  - Swiss Cyber Storm
  - Area 41

## Einstiegsauftrag zu CIA

### Prominente Sicherheitsverletzungen

- Equifax (2017): Eine Sicherheitslücke in einer Webanwendung führte dazu, dass das Unternehmen die personenbezogenen Daten von 145 Millionen US-Bürgern verlor. Gestohlen wurden unter anderem Namen, Sozialversicherungsnummern und Führerscheinnummern.
- Yahoo (2013): Durch einen Phishing-Angriff konnten sich Hacker Zugang zum Netzwerk des Unternehmens verschaffen. Dabei wurden insgesamt 3 Milliarden Benutzerkonten kompromittiert.
- Toyota: Eine Datenpanne trat auf, da sich ein Dritter mit Zugangsdaten, die er aus dem von einem Drittanbieter auf GitHub veröffentlichten Quellcode erhalten hatte, Zugang zu einem Unternehmensserver verschaffen konnte.

### Anwendungen, in denen Vertraulichkeit, Verfügbarkeit, Integrität und Nicht-Abstreitbarkeit von entscheidender Bedeutung sind

1. Online-Banking:
    - Vertraulichkeit ist entscheidend.
    - Verfügbarkeit, damit Kunden jederzeit auf ihre Konten zugreifen können.
    - Integrität stellt sicher, dass Transaktionen korrekt und vollständig sind.
    - Nicht-Abstreitbarkeit ist wichtig, um sicherzustellen, dass einmal durchgeführte Transaktionen nicht abgestritten werden können.
2. Gesundheitswesen:
    - Patientendaten müssen vertraulich behandelt werden.
    - Verfügbarkeit, damit medizinisches Personal jederzeit auf Patienteninformationen zugreifen kann.
    - Integrität, um sicherzustellen, dass Patientendaten korrekt und unverändert sind.
    - Nicht-Abstreitbarkeit, um sicherzustellen, dass medizinische Aufzeichnungen authentisch sind und nicht abgestritten werden können.
3. E-Commerce:
    - Vertraulichkeit schützt Kundendaten und Zahlungsinformationen.
    - Verfügbarkeit sorgt, dass Kunden jederzeit Einkäufe tätigen können.
    - Integrität stellt sicher, dass Transaktionen korrekt und vollständig sind.
    - Nicht-Abstreitbarkeit, damit durchgeführte Transaktionen nicht abgestritten werden können.

## Vertraulichkeit

**Definition von Vertraulichkeit:** Vertraulichkeit ist die Eigenschaft einer Nachricht, nur für einen beschränkten Empfängerkreis vorgesehen zu sein. Weitergabe und Veröffentlichung sind nicht erwünscht. Vertraulichkeit wird durch Rechtsnormen geschützt, sie kann auch durch technische Mittel gefördert oder erzwungen werden.

### Alltägliche Beispiele für Vertraulichkeit

1. **Arbeitsplatz:** Der Arbeitsplatz nicht korrekt akustisch oder visuell abgesichert.

2. **E-Mails:** Unverschlüsselte E-Mails sind wie Postkarten. Alles, was darin steht, ist potenziell für jeden lesbar, während die E-Mail vom Sender zum Empfänger im Ende-zu-Ende Stil transportiert wird.

3. **Gespräche:** Vertraulichkeit kann durch organisatorische Massnahmen erreicht werden. z.B. Eine Sitzung von Teammitgliedern ist so schlank wie möglich gehalten und finden an einem Ort statt, an dem Dritte keinen Zutritt haben.

### Verschlüsselungstechniken

1. **Symmetrische Verschlüsselung:** Bei dieser Methode wird derselbe Schlüssel zum Verschlüsseln und Entschlüsseln der Daten verwendet.
    - z.B. [Advanced Encryption Standard (AES)](https://studyflix.de/informatik/aes-verschlusselung-1611)
2. **Asymmetrische Verschlüsselung:** Hier werden zwei Schlüssel verwendet – ein öffentlicher Schlüssel zum Verschlüsseln der Daten und ein privater Schlüssel zum Entschlüsseln.
    - z.B. [RSA-Verfahren (Rivest–Shamir–Adleman)](https://studyflix.de/informatik/rsa-verschlusselung-1608)
3. **Elliptic Curve Cryptography (ECC):** Eine Form der asymmetrischen Verschlüsselung, die auf den [elliptischen Kurven](https://de.wikipedia.org/wiki/Elliptische_Kurve) basiert.

## Verfügbarkeit

### Dos und DDoS

#### Unterschied zwischen DoS und DDoS

Ein **Denial of Service** (DoS)-Angriff ist ein Angriff von einem (einzelnen) System auf ein anderes System, während bei einem **Distributed Denial of Service** (DDoS)-Angriff mehrere Systeme ein einzelnes System angreifen. Der Hauptunterschied ist, dass ein DoS-Angriff von einem Standort ausgeht und ein DDoS-Angriff von mehreren (dezentralen) Standorten, meist mit Verschleierung des Ursprungs, erfolgt.

#### Drei verschiedene Arten von DDoS-Angriffen

1. **Protokollangriffe** erschöpfen Serverressourcen oder überlasten Netzwerkkomponenten wie Load-Balancer.

2. **Volumetrische Angriffe** zielen darauf ab, die Bandbreite eines Netzwerks zu überlasten, indem es mit Junk-Daten überflutet wird.

3. **Anwendungsschichtangriffe** greifen Webserver-Anwendungen ab und versuchen diese durch das Senden von scheinbar unschuldigen Anfragen zu überlasten.

#### Abwehrstrategien gegen DDoS-Angriffe

1. **Security Patches**
2. **Firewall-Konfigurationen**
3. **Traffic-Filtering-Technologien** wie Intrusion Prevention Systems (IPS) und Intrusion Detection Systems (IDS).
4. **Lastenausgleich** – Datenverkehr auf mehrere Server verteilen.

## Integrität

### Definition von Integrität

Integrität bezeichnet die Eigenschaft eines Menschen, ehrlich, aufrichtig und authentisch zu handeln. Eine Person mit hoher Integrität handelt nach moralischen und ethischen Grundsätzen und bleibt auch in schwierigen Situationen ihren Überzeugungen und Werten treu.

### Reale Beispiele für Integrität

- Eine Person mit Integrität gibt die Ideen von anderen nicht als eigene aus und setzt sich für Mitmenschen ein.
- Eine Person mit Integrität würde nicht, hinter dem Rücken eines anderen zu lästern oder jemandem anzulügen.

### Wie Integrität in der IT angewendet wird

1. **Hashing-Verfahren**
    - Hashing beinhaltet die Generierung einer eindeutigen Zeichenkette, genannt Hash-Wert, die als eindeutiger Identifikator für einen bestimmten Datensatz dient.
    - Gängige Hashing-Algorithmen: MD5, SHA-1, SHA-256 und SHA-3
2. **Digitale Signaturen**
    - Digitale Signaturen, unterstützt durch digitale Zertifikate, entsprechen internationalen Standards und bieten ein hohes Mass an Zuverlässigkeit und Sicherheit.
3. **Sicherheitsmassnahmen**
    - Man nutzt Hash-Funktionen um digitale Signaturen zu generieren und diese gewährleisten die Integrität von Daten.
4. **Kryptowährungen**
    - SHA-256, wird häufig bei der Signatur von Kryptowährungen und Transaktionen verwendet.

## Nicht-abstreitbarkeit

### Definition von Nicht-Abstreitbarkeit

Nicht-Abstreitbarkeit bezieht sich auf die Nachweisbarkeit gegenüber Dritten und stellt sicher, dass eine Partei einer Transaktion diese nicht abstreiten kann.

### Beispiele von Situationen, in denen Nicht-Abstreitbarkeit eine Schlüsselrolle spielt

1. Bankwesen: Im Bankwesen ist die Nicht-Abstreitbarkeit wichtig, um sicherzustellen, dass Transaktionen authentisch sind und nicht abgestritten werden können.

2. E-Commerce: Im E-Commerce ist die Nicht-Abstreitbarkeit wichtig, um sicherzustellen, dass Transaktionen zwischen Käufer und Verkäufer authentisch sind und nicht abgestritten werden können.

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

- Diebstahl von Informationen durch gefälschte E-Mails, Webseiten, SMS, etc.
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

- Hack the Box
- TryHackMe
- VulnHub
- Bug Bounties

## OSINT

- Was ist OSINT?
- Open Source Intelligence
- Methodologie um Informationen zu...
  - erhalten
  - analysieren
  - korrelieren
- per-se öffentliche Informationen

## SQL Injection

- Prozedur
  - Applikation macht SQL Abfrage um DB Informationen abzufragen
  - DB gibt das Resultat der Applikation zurück und zeigt es an

- Befehle
  - Select
  - Insert
  - Update
  - Delete
  - Ausführung von Stored Procedures

- Schutzmöglichkeiten
  - Zugriff auf Applikation / Service
  - Input Validation für User Front-End
  - Limitieren von User Zugriffen
- [SQL Injection Cheat Sheet](https://www.netsparker.com/blog/web-security/sql-injection-cheat-sheet/)

### Bypassing

- Bypass
  - `' or '1'='1`
- Reverse DNS
  - `‘; exec master..xp_cmdshell ‘nslookup domain.ch’`
- Reverse Ping
  - `‘; exec master..xp_cmdshell ‘ping x.x.x.x’`

## CVE & CVSS Scoring System

### Common Vulnerabilities and Exposures (CVE)

Das CVE (Common Vulnerabilities and Exposures) System ist eine Struktur zur Identifizierung und Standardisierung von Namen für Schwachstellen in Software und Hardware.

CVE-Einträge sind knapp und enthalten keine technischen Daten oder Informationen zu Risiken, Auswirkungen und Lösungen. Sie dienen dazu, eindeutige Schwachstellen zu erkennen und die Entwicklung von Sicherheitswerkzeugen und -lösungen zu koordinieren.

### Common Vulnerability Scoring System (CVSS)

Das Common Vulnerability Scoring System (CVSS) ist ein Satz offener Standards zur Bewertung von Sicherheitslücken, indem diesen eine Zahl zugewiesen wird, um ihre Schwere zu beurteilen. Die Bewertungen reichen von 0,0 bis 10,0, wobei höhere Zahlen auf eine grössere Schwere der Sicherheitslücke hinweisen.

### Unterschied zwischen CVE und CVSS

- CVE ist ein System zur Identifizierung und Standardisierung von Namen für Schwachstellen in Software und Hardware.

- CVSS ist ein Satz offener Standards zur Bewertung von Sicherheitslücken, indem diesen eine Zahl zugewiesen wird, um ihre Schwere zu beurteilen.

## OWASP

### **Open Web Application Security Project (OWASP)**

- **Probleme:** Es gibt viele verschiedene Sicherheitslücken, die in verschiedenen Systemen und Anwendungen existieren können.

- **Folgen:** Ohne eine standardisierte Methode zur Identifizierung dieser Schwachstellen kann es schwierig sein, sie effektiv zu verwalten und zu beheben.

- **Behebung:** **OWASP**. Eine Non-Profit-Organisation, die zum Ziel hat, für mehr Sicherheit in Anwendungen und Diensten des World Wide Webs zu sorgen. Sie bietet eine standardisierte Methode zur Identifizierung und Katalogisierung von öffentlich bekannten Sicherheitsschwachstellen.

### Ziel und Zweck

OWASP hat das Ziel, die Sicherheit von Webanwendungen zu verbessern, indem sie auf Risiken für Webanwendungen hin weisen und Transparenz für Endanwender oder Organisationen hinsichtlich Websecurity schaffen.

OWASP stellt Informationen, Dokumentationen, Tools und Lösungen bereit. Sie unterstützt Entwickler, Entscheider, QA-Spezialisten und Penetrationstester. Eine bekannte Veröffentlichung ist die jährlich zusammengestellte Top-10-Liste der häufigsten Angriffe und grössten Risiken im Bereich Webapplikationen.

## Kali Linux

- **Probleme:** Sicherheitslücken, in verschiedenen Systemen und Anwendungen

- **Folgen:** Ohne Methode zur Identifizierung von Schwachstellen wird es schwierig diese zu verwalten und zu beheben.

- **Behebung:** Kali Linux ist ein kostenloses, open-source Betriebssystem, das für fortgeschrittene Penetrationstests und Sicherheitsprüfungen verwendet werden kann. Es ist für white Hacker und Sicherheitsexperten entwickelt worden, die Systeme auf Schwachstellen testen.

## Pentesting Framework

- **Probleme:** Wenn Schwachstellen nicht wiederholbar überprüft werden können, ist es schwierig zu überprüfen, ob sie behoben wurden.

- **Folgen:** Ohne Methode zur Überprüfung von Schwachstellen kann es schwierig sein, zu entscheiden, ob sie behoben wurden.

- **Behebung:** Ein Penetration Testing, kurz Pentest-Framework, ist ein standardisierter Satz von Richtlinien und vorgeschlagenen Tools zur Strukturierung und Durchführung effektiver Pentests.

## Security Analyse Framework

- **Probleme:** Schwachstellen, die nicht wiederholbar überprüft werden können, können nicht anständig bewertet werden.

- **Folgen:** Schwachstellen können nicht priorisiert werden.

- **Behebung:** Sicherheitsframeworks definieren Richtlinien und Verfahren, welche Sicherheitskontrollen erleichtern.

## 24 Deadly Sins of Software Development

- **Probleme:** Viele Programmierfehler und Designfehler durch unerfahrene Entwickler.

- **Folgen:** Eine Vielzahl von Sicherheitslücken und Schwachstellen in Software und schwer lesbarer und wartbarer Code.

- **Behebung:** ["24 Deadly Sins of Software Security"](https://www.amazon.com/Deadly-Sins-Software-Security-Programming/dp/0071626751) ist ein Buch, das die häufigsten Design- und Programmierfehler aufzeigt und erklärt, wie man sie beheben oder von Anfang an vermeiden kann.

## **Exception/Error Handling**

- **Probleme:** Unerwartete oder fehlerhafte Situationen können während der Programmausführung auftreten.

- **Folgen:** Ohne eine effektive Methode zur Behandlung dieser Ausnahmen kann es zu Programmabstürzen oder unerwünschtem Verhalten kommen.

- **Behebung:** Exception Handling ist ein kritischer Aspekt der Programmierung, der Entwicklern ermöglicht, unerwartete oder fehlerhafte Situationen elegant zu verwalten.

## **Weak Random Numbers**

- **Probleme:** Schlechte Zufallszahlen bergen das Risiko, dass man ihren Seed ausrechnen kann.

- **Folgen:** Ist der Seed bekannt, so sind die Zufallszahlen nicht mehr zufällig und alle Operationen, die auf ihnen basieren, sind nicht mehr sicher.

- **Behebung:** Kryptographische Pseudozufallszahlengeneratoren (CSPRNGs) anstelle von schwachen PRNGs verwenden.

## Entdecken von Lücken

### **Fuzz-Testing**

- **Probleme:** Software kann unerwartete oder ungültige Eingaben enthalten, die zu Fehlern oder Sicherheitslücken führen können.

- **Folgen:** Ohne eine Methode zur Behandlung dieser Eingaben kann es zu Programmabstürzen oder unerwünschtem Verhalten kommen.

- **Behebung:** Fuzz-Testing ist eine automatisierte Software-Testmethode, die ungültige, fehlerhafte oder unerwartete Eingaben in ein System einfügt, um Softwarefehler und bewusst Schwachstellen aufzudecken.

### **Security Scanner**

- **Probleme:** Es gibt viele verschiedene Sicherheitslücken, die in verschiedenen Systemen, Frameworks, Libraries usw. existieren.

- **Folgen:** Viele dieser Schwachstellen können unbemerkt bleiben und zu Sicherheitsproblemen führen.

- **Behebung:** Ein Sicherheitsscanner ist ein automatisiertes Sicherheitstestwerkzeug, das nach Fehlkonfigurationen oder Programmierfehlern sucht, welche Bedrohungen ausnutzen können.
  - Sicherheitsscanner stützen sich entweder auf eine Datenbank mit bekannten Schwachstellen oder suchen nach gängigen Fehlerarten, um unbekannte Schwachstellen zu entdecken.

### **Code Review Basics**

- **Probleme:** Unterschiedliche Codierungsstile und -praktiken unkontrolliert auftreten, was die Wartbarkeit des Codes erschwert oder allgemeine Coding-Anforderungen nicht erfüllt.

- **Folgen:** Die Qualität des Codes sinkt, was zu Fehlern, unerwartetem Verhalten und erschwerten Wartungsarbeiten in der Software führt.

- **Behebung:** Code-Reviews einzuführen. Klare Richtlinien für Codierungsstandards und kontinuierliche Überprüfungen durch Reviewer einführen.

## Penetration Testing

Penetration Testing, kurz Pentest, ist ein Sicherheitstest einzelner Rechner oder Netzwerke jeglicher Grösse.

Ein Penetrationstest prüft die Sicherheit von Systembestandteilen, Anwendungen oder Netzwerke, indem er versucht, wie eine unautorisierte Person in das System einzudringen. Penetrationstests decken Sicherheitslücken auf, aber schliessen sie nicht aus.

### Regeln für Penetration Testing

1. **Zustimmung einholen:** Sicherstellen, die ausdrückliche (schriftliche) Zustimmung des Eigentümers des zu testenden Systems zu haben.

2. **Verantwortungsvolles Verhalten:** Penetrationstest verantwortungsbewusst durchführen
    - Jegliche Handlungen, die das getestete System oder andere Benutzer gefährden könnten vermeiden.
    - Strikt an die definierten Testbereiche halten.

3. **Dokumentation:** Alle Schritte und Ergebnisse des Penetrationstests dokumentieren, um die Ergebnisse zu analysieren und Massnahmen zur Behebung von Schwachstellen zu ergreifen.

### Rechtliche Hinweise

Unerlaubte Penetrationstests sind strafbar. Gemäss [Artikel 143](https://www.swissrights.ch/gesetz/Artikel-143-StGB-2020-DE.php) des Schweizerischen Strafgesetzbuches (StGB) ist das unbefugte Eindringen in ein Computersystem strafbar und kann mit Geldstrafen oder Freiheitsstrafe geahndet werden.

**Immer die erforderliche Zustimmung einholen!**

## Web Application Firewall

### Was ist eine Web Application Firewall (WAF)?

Eine Web Application Firewall (WAF) ist eine Sicherheitslösung, die den Datenverkehr zwischen einer Webanwendung und dem Internet überwacht und filtert. Sie dient zum Schutz vor bekannten Angriffsmustern wie [SQL-Injection](#sql-injection) oder Cross-Site-Scripting (XSS).

### Regeln für WAF

Die Regeln der WAF definieren, welche Arten von Anfragen erlaubt oder blockiert werden sollen, basierend auf vordefinierten Sicherheitsrichtlinien und Angriffssignaturen.

## ModSecurity 3

### Was ist ModSecurity?

ModSecurity ist eine Open-Source, plattformübergreifende Web Application Firewall (WAF) Engine für Apache, IIS und Nginx. Sie hat eine ereignisbasierte Programmiersprache, die Schutz vor Angriffen gegen Webanwendungen bietet.

Zusätzlich ermöglicht sie das Überwachen, Protokollieren und Echtzeit Analysieren von HTTP-Verkehr.

### Regeln für ModSecurity 3

Mit ModSecurity können proaktiv Richtlinien und Regeln festgelegt werden, um den HTTP-Verkehr zu überwachen und zu filtern. Dies ermöglicht es Sicherheitsteams, zu kontrollieren, welche Anfragen die WAF durchlassen darf und welche blockiert werden sollen.

Durch diese Funktion können Teams rechtzeitig über potenzielle Angriffe informiert werden und schnell darauf reagieren.

## Quellen

- [Art. 143 StGB](https://www.swissrights.ch/gesetz/Artikel-143-StGB-2020-DE.php)
- [Advanced Encryption Standard (AES)](https://studyflix.de/informatik/aes-verschlusselung-1611)
- [RSA-Verfahren (Rivest–Shamir–Adleman)](https://studyflix.de/informatik/rsa-verschlusselung-1608)
- [elliptischen Kurven](https://de.wikipedia.org/wiki/Elliptische_Kurve)
- [SQL Injection Cheat Sheet](https://www.netsparker.com/blog/web-security/sql-injection-cheat-sheet/)
- [kryptowissen.de](https://www.kryptowissen.de/schutzziele.php)
- [Vertraulichkeit](https://de.wikipedia.org/wiki/Vertraulichkeit)
- [Dos vs DDos](https://www.fortinet.com/de/resources/cyberglossary/dos-vs-ddos)
- [Nicht-Abstreitbarkeit](https://datenschutz.ch/lexika/informationssicherheit-glossar/nichtabstreitbarkeit)
- [CVE](https://www.redhat.com/en/topics/security/what-is-cve)
- [CVSS](https://www.sans.org/blog/what-is-cvss/)
- [OWASP](https://www.security-insider.de/was-ist-owasp-a-741869/)
- [Fuzz-testing](https://www.synopsys.com/glossary/what-is-fuzz-testing.html)
- [Vulnerability-scanner](https://snyk.io/de/learn/vulnerability-scanner/)
- [Code Review Guide](https://www.freecodecamp.org/news/code-review-the-ultimate-guide-aa45c358bbf5/)
- [Penerationstest](https://de.wikipedia.org/wiki/Penetrationstest_%28Informatik%29)
- [24 Deadly Sins of Software Security](https://www.amazon.com/Deadly-Sins-Software-Security-Programming/dp/0071626751)
