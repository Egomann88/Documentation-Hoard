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