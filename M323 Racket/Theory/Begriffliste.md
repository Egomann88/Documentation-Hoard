# Begriffliste

## Lambda / Lambda-Kalkül

Eine anonyme Funktion, die nicht über einen Namen, sondern über Referenzen aufgerufen wird. Der Sinn dahinter ist die Flexibilität, Verständlichkeit und Kürze des Codes.

## Applikation

Die Applikation ist die Hauptfunktion bzw. das Hauptprogramm der funktionalen Programmierung. Sie stellt eine grosse Funktion dar, in der alle anderen Funktionen aufgerufen werden. Sie kann mit einem Argument als Eingabe aufgerufen werden, welches dann in den Funktionen verarbeitet bzw. die gewünschte Funktion startet.

## Gerüst der Funktion

Die Beschreibung (Kommentar), der Name und die Parameter einer Funktion.

## Rumpf der Funktion

Der Inhalt einer Funktion.

## Abdeckung (Tests)

Die Abdeckung bezieht sich auf die Anzahl der getesteten Zeilen im Verhältnis zu den gesamten Zeilen eines Codes. Das Ziel ist es, möglichst viele Teile des Codes mit Tests abzudecken.

## Signatur

Signaturen fungieren ähnlich wie Interfaces. Sie definieren den Namen, die Parameter und den Rückgabetyp einer Funktion. Sie sind nicht zwingend notwendig, aber sie helfen dabei, den Code zu verstehen und zu dokumentieren. Signaturen werden mit `define` definiert und mit `->` getrennt. Die linke Seite ist der Name der Funktion, und die rechte Seite ist der Rückgabetyp.

```racket
; Links die Parameter, rechts der Rückgabetyp
(: double-string (string -> string))
```

## Komposition

### Generell

Eine Abhängigkeit, z. B. zwischen Haus und Wand - Das Haus-Objekt kann nicht ohne Wand existieren.

### In der funktionalen Programmierung

Die Komposition ist eine Funktion, die andere Funktionen (Dependencies) aufruft oder eine Signatur (Interfaces) verwendet.

## Fallunterscheidung (cond)

Eine Fallunterscheidung ähnelt einem `switch-case`. Sie besteht aus beliebig vielen Bedingungen und `then`-Teilen. Der `else`-Teil ist optional.

## Binäre Verzweigung (if)

Eine Binäre Verzweigung ist ähnlich einem `if-else`. Sie besteht aus drei Teilen: der Bedingung, dem `then`-Teil und dem `else`-Teil. Der `else`-Teil ist obligatorisch.

## Record

Records erinnern an Klassen in der objektorientierten Programmierung. Sie haben Konstruktoren, Prädikate und Selektoren. Records sind eine Art von Datenstruktur, die es erlaubt, Daten zu gruppieren. Sie werden mit `define-record` definiert.

Die Struktur der Records ist vorgegeben und sieht so aus:

```racket
(define-record TestRecord
  make-TestRecord ; Konstruktor
  TestRecord? ; Prädikat
  (TestRecord-value1 string) ; Selektor
  (TestRecord-value2 natural)) ; Selektor

; Signaturen für den Record
(: make-TestRecord (string natural -> TestRecord))
(: TestRecord? (Any -> boolean))
(: TestRecord-value1 (TestRecord -> string))
(: TestRecord-value2 (TestRecord -> natural))
```

Die Funktionen (und Signaturen) werden automatisch generiert. Wenn man eigene Objekte erstellt, sollte man eigene Signaturen schreiben.

### Konstruktor

Der Konstruktor erstellt ein Objekt vom Typ `TestRecord` und erwartet zwei Argumente: einen String und eine natürliche Zahl.

Beispiel, wie man den Konstruktor aufruft und den Wert speichert:

```racket
(define test1 (make-TestRecord "Test" 5))
```

### Prädikat

Das Prädikat ist eine Funktion, die überprüft, ob das Objekt vom Typ `TestRecord` ist. Das Prädikat ist optional, und die Stelle wird ignoriert, wenn es nicht explizit definiert wird.

Das Prädikat kann für Abfragen benutzt werden:

```racket
(TestRecord? test1)
```

### Selektoren

Die Selektoren sind Funktionen, die den Wert des Objekts zurückgeben. Sie funktionieren nur als Getter. Wenn man einen Wert ändern will, muss das aktuelle Objekt neu erstellt bzw. überschrieben werden.

Beispiel, wie man die Selektoren aufruft und den Wert speichert:

```racket
(define test1-value1 (TestRecord-value1 test1)) ; Selektor aufrufen -> string
(define test1-value2 (TestRecord-value2 test1)) ; Selektor aufrufen -> natural
```

## Zusammengesetzte Daten (Objekte)

Zusammengefasste Daten werden in Racket auch als Objekte bezeichnet. Objekte werden von den Records erstellt und sind Instanzen eines Records. Objekte haben keine eigenen Funktionen; sie nutzen die Funktionen des Records.

Das [Record](#record) Kapitel zeigt die perfekten Beispiele, denn die erstellten Objekte sind Instanzen von `TestRecord`.

### Als Eingabe

Ein Objekt kann als Eingabe in eine Funktion gegeben werden, ähnlich wie ein normaler Wert.

```racket
(: func (TestRecord -> string))

(define func
  (lambda (obj)
    (TestRecord-value1 obj)))
```

Man kann das Objekt als Konstante oder als neues Objekt erstellen und weitergeben.

```racket
(define test1 (make-TestRecord "Test" 5)) ; Record per Konstruktor erstellen
```

In der Konsole:

```racket
(func test1) ; -> "Test"
```

oder

```racket
(func (make-TestRecord "Test" 5)) ; -> "Test"
```

### Als Ausgabe

Man kann das Objekt auch als Rückgabewert einer Funktion benutzen.

```racket
(: func (string natural -> TestRecord))

(define func
  (lambda (str num)
    (make-TestRecord str num)))
```

In der Konsole:

```racket
(func "Test" 5) ; -> #<TestRecord>
```

## "Auswahl" - Datendefinition

Die Datendefinition ist eine Art von Enumeration und Signierung. Sie wird benutzt, um eine Liste von Werten zu signieren. In der Theorie ist es eine Art von Interface, nur anstatt vorzugeben, was die Funktion erhält und zurückgibt, gibt es eine Liste von Werten, welche zu dieser Datendefinition gehören an.

```racket
(define pet
  (signature (enum "dog" "cat" "snake"))
```

Dieses Beispiel erstellt die Datendefinition `pet` und gibt an, dass Pet nur `"dog"`, `"cat"` oder `"snake"` sein kann. In das

 `enum` können beliebig viele Werte und von beliebigen Typen eingetragen werden.

## Abstraktion

Abstraktion ist ein anderer Begriff für Verallgemeinerung oder Reduktion. Damit ist gemeint, dass Funktionen oder Klassen so geschrieben werden, dass sie möglichst allgemein und flexibel sind. Das Ziel ist, dass sie in möglichst vielen Situationen benutzt werden können. Wenn man davon spricht, eine Funktion zu abstrahieren, dann meint man, dass sie verallgemeinert werden soll.

Beispiel: Eine Liste kann nur Zahlen enthalten. Wenn man die Funktion abstrahiert, dann kann die Liste auch Strings oder andere Objekte enthalten.

Abstraktion kann vieles bedeuten; grundlegend ist es ein offenes Konzept. Es reicht schon, den Namen einer Datei zu ändern, um sie zu abstrahieren.

-> Tisch - Abstrahieren zu > Möbel

### Abstraktion vs Funktion

Der Hauptunterschied ist, dass eine Abstraktion eine verallgemeinerte Funktion mit einem offenen Rahmen ist. Die Funktion hingegen hat eine konkrete Aufgabe und Abfolge von Schritten.

Das folgende Beispiel illustriert den Unterschied:

```javascript
/* Nichts ist abstrahiert */
function openModal() {
  document.getElementById("myModal").style.display = "block";

  document.getElementById("modal-title").innerText = "Das ist der Modal-Titel";
  document.getElementById("modal-content").innerText = "Modal-Content.";

  document.getElementById("modal-close").addEventListener("click", closeModal);
}

function closeModal() {
  document.getElementById("myModal").style.display = "none";
}

/* Hier wird abstrahiert */
_openModal("Das ist der Modal-Titel", "Modal-Content.", closeModal);

function _openModal(title, content, onClose) {
  document.getElementById("myModal").style.display = "block";
  setModalContent(title, content, onClose);
}

function setModalContent(title, content, onClose) {
  document.getElementById("modal-title").innerText = title;
  document.getElementById("modal-content").innerText = content;
  document.getElementById("modal-close").addEventListener("click", onClose);
}
```

Die Funktion `openModal` öffnet ein Modal und setzt den Titel und den Inhalt. Sie ist nicht weiterverwendbar, da sie festgeschrieben ist.

Das untere Beispiel hingegen kann mit verschiedenen Werten aufgerufen werden. Die Funktion `setModalContent` wird verwendet, um das Modal dynamisch zu aktualisieren, ohne es neu zu öffnen. Besonders ist hier, dass die `onClose`-Funktion als Parameter übergeben wird, da es immer den Fall geben kann, dass die Funktion einen zusätzlichen Schritt ausführen soll, bevor das Modal geschlossen wird.

### Generischer Typ

Ein generischer Typ ist ein Platzhalter, der es ermöglicht, denselben Code für verschiedene Datentypen zu verwenden, ohne ihn für jeden einzelnen Datentyp neu schreiben zu müssen. Das ist eine Basis des Programmierens und wird von allen Programmiersprachen unterschiedlich implementiert.

In Racket wird er mit `%` eingeleitet, gefolgt von Funktionen, welche den Typ zuweisen. Aus den Blöcken hatten wir ein Beispiel, wie man generische Listen erstellt:

```racket
(define list-of
  (lambda (element)
    (signature
     (mixed empty-list
            (cons-list-of element)))))

(define-record (cons-list-of element)
  cons
  cons?
  (first element)
  (rest  (list-of element)))

(: cons (%element (list-of %element) -> (cons-list-of %element)))
(: first ((cons-list-of %element) -> %element))
(: rest ((cons-list-of %element) -> (list-of %element)))
```

In C# werden generische Typen mit `T` dargestellt, wobei `T` für `Type` steht und den Prozess vereinfacht.

```csharp
public static List<T> ListOf<T>(T element) {
    return new List<T> { element };
}
```