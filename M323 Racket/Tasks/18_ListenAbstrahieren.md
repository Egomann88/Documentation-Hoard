# Aufgabe 18 - Listen abstrahieren

Für die folgenden Aufgaben soll dieser vereinfachte _(abstrahierte)_ Record für Listen verwendet werden:

```racket
; list-of number für die reliability abstrahiert
(define list-of-number (list-of number))
```

1. Schreibe eine Funktion `evens`, die eine Liste von Zahlen entgegennimmt und nur die geraden Zahlen zurückgibt.

Vorgegebene Signatur, Liste und Testfall:

```racket
; Gerade Elemente einer Liste herausfiltern
(: evens (list-of-number -> list-of-number))

; Beispiel
(define list4 (cons 2 (cons 3 (cons 5 (cons 10 empty)))))

; Testfall
(check-expect (evens list4) (cons 2 (cons 10 empty)))
```

Weil die Funktion sehr schnell sehr komplex wird, hier ein Lösungsvorschlag:

```racket
(define evens
  (lambda (list)
    (cond
      ((empty? list) empty)
      ((cons? list) ; bis hier alles wie gehabt
       (define f (first list)) ; innerhalb der funktion eine "variable" mit dem element erstellen
       (define r (evens (rest list))) ; rekursiver aufruf mit dem rest der liste (keine ahnung warum das hier funktioniert, aber es funktioniert)
       (if (...) ; prüfen, ob das element gerade ist
           (...) ; wenn ja wird eine neue liste mit dem aktuellen element und dem rest erstellt
           ...))))) ; wenn nein, wird nur der rest zurückgegeben, damit im nächsten aufruf das jetzige element entfernt wird
```

Die Definition von `f` und `r` ist nicht zwingend notwendig, aber es macht die Funktion eindeutig lesbarer. Definitionen innerhalb von Funktionen existieren nur in dieser Funktion und werden nicht nach aussen getragen.

Tipp: Die (vordefinierte) Funktion `even?` prüft, ob eine Zahl gerade ist.

2. Schreibe die Funktion `positives`, die eine Liste von Zahlen entgegennimmt und nur die positiven Zahlen zurückgibt.

Nutze die folgenden vorgegebene Signatur, Liste und Testfall:

```racket
; Positive Elemente einer Liste herausfiltern
(: positives (list-of-number -> list-of-number))

; Beispiel
(define list5 (cons 12 (cons -15 (cons -5 (cons 4 empty)))))

; Testfall
(check-expect (positives list5) (cons 12 (cons 4 empty)))
```

Die Funktion `positives` ist sehr ähnlich zu `evens`, aber schreiben musst du sie selbst.

Tipp: Die (vordefinierte) Funktion `positive?` prüft, ob eine Zahl positiv ist.
