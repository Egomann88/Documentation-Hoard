# Begriffliste

## Lambda / Lambda-Kalkül

Eine anonyme Funktion, die nicht über einen Namen, sondern über Referenzen aufgerufen wird. Der Sinn dahinter ist die Flexibilität, Verständlichkeit und Kürze des Codes.

## Applikation

Die Applikation ist die "Hauptfunktion" / das "Hauptprogramm" der funktionalen Programmierung. Man kann sie als eine grosse Funktion, in der alle anderen Funktionen aufgerufen werden, sehen. Man kann sie mit einem Argument als Eingabe aufrufen. Dieses Argument wird dann in den Funktionen verarbeitet bzw. startet die gewunschte Funktion.

## Gerüst der Funktion

Die Beschreibung (Kommentar), der Name und die Parameter.

## Rumpf der Funktion

Der Inhalt der Funktion.

## Abdeckung (Tests)

Die Abdeckung ist die Anzahl der getesteten Zeilen im Verhältnis zu den gesamten Zeilen. Das Ziel ist es, möglichst viel mit Tests abzudecken.

## Signatur

Signaturen funktionieren wie Interfaces. Sie definieren den Namen, Parameter und Rückgabetyp einer Funktion. Sie sind nicht zwingend notwendig, aber sie helfen, den Code zu verstehen und zu dokumentieren. Signaturen werden mit `define` definiert und mit `->` getrennt. Die linke Seite ist der Name der Funktion und die rechte Seite ist der Rückgabetyp.

```racket
; Links die Parameter, rechts der Rückgabetyp
(: double-string (string -> string))
```

## Komposition

### Generell

Eine Abhänigkeit (Dependency) z.B. Haus und Wand - Das Haus-Objekt kann nicht ohne Wand existieren.

### In der funktionalen Programmierung

Die Komposition ist eine Funktion, welche andere Funktionen (Dependencies) aufruft oder eine Signaturen
(Interfaces).

## Fallunterscheidung (cond)

Eine Fallunterscheidung ist eine Art von `switch-case`. Es gibt beliebig viele Bedingungen und `then`-Teile. Der `else`-Teil ist optional.

## Binäre Verzweigung (if)

Eine Binäre Verzweigung ist eine Art ein `if-else`. Es gibt drei Teile: die Bedingung, den `then`-Teil und den `else`-Teil. Der `else`-Teil ist obligatorisch.

## Record

Record errinnern an Klassen in der objektorientierten Programmierung. Sie haben Konstruktoren, Prädikate und Selektoren. Records sind eine Art von Datenstruktur, die es erlaubt, Daten zu gruppieren. Sie werden mit `define-record` definiert.

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

Die Funktionen (und Signaturen) werden automatisch generiert. Wenn man eigene Objekete erstellt, sollte man eigene Signaturen schreiben.

### Konstruktor

Der Konstruktor erstellt ein Objekt vom Typ `TestRecord`. Erwartet zwei Argumente, ein String und eine natürliche Zahl.

Beispiel, wie man den Konstruktor aufruft und den Wert speichert:

```racket
(define test1 (make-TestRecord "Test" 5))
```

### Prädikat

Das Prädikat ist eine Funktion, die überprüft, ob das Objekt vom Typ `TestRecord` ist. Das Prädikat ist optional und die Stelle wird ignoriert, wenn es nicht explizit definiert wird.

Das Prädikat kann man für Abfragen benutzen:

```racket
(TestRecord? test1)
```

### Selektoren

Die Selektoren sind Funktionen, die den Wert des Objekts zurückgeben bzw beinhaleten. Sie funktionieren nur als Getter. Wenn man einen Wert ändern will, muss das aktuelle Objekt neu erstellt bzw. überschrieben werden.

Beispiel, wie man die Selektoren aufruft und den Wert speichert:

```racket
(define test1-value1 (TestRecord-value1 test1)) ; Selektor aufrufen -> string
(define test1-value2 (TestRecord-value2 test1)) ; Selektor aufrufen -> natural
```

## Zusammengesetzte Daten (objekte)

Zusammengefasste Daten sind in Racket auch als Objekte bekannt. Objekte werden von den Records erstellt und sind eine Instanz von einem Record. Objekte haben keine eigenen Funktionen, sie benutzen die Funktionen des Records.

Das [Record](#record) Kapitel zeigt die perfekten Beispiele, denn die erstellten Objekte sind Instanzen von `TestRecord`.

### Als Eingabe

Ein Objekt kann man als Eingabe in eine Funktion geben, wie man einen normalen Wert gibt.

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

Dieses Beispiel erstellt die Datendefinition `pet` und gibt an, dass Pet nur `"dog"`, `"cat"` oder `"snake"` sein kann. In das `enum` können beliebig viele Werte und von beliebigen Typen eingetragen werden.
