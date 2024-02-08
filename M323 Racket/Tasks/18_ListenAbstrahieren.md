# Aufgabe 18 - Listen abstrahieren

Für die folgenden Aufgaben verwenden wir diesen vereinfachten Record für Listen:

```racket
(define list-of-number (list-of number))
```

1. Schreibe eine Funktion `evens`, die eine Liste von Zahlen entgegennimmt und nur die geraden Zahlen zurückgibt.

**Signatur und Testfall:**

```racket
; Gerade Elemente einer Liste herausfiltern
(: evens (list-of-number -> list-of-number))

; Beispiel
(define list4 (cons 2 (cons 3 (cons 5 (cons 10 empty)))))

; Testfall
(check-expect (evens list4) (cons 2 (cons 10 empty)))
```

**Hier ist ein Lösungsvorschlag:**

```racket
(define evens
  (lambda (list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (evens (rest list)))
       (if (even? f)
           (cons f r)
           r))))))
```

Die Definitionen von `f` und `r` verbessern die Lesbarkeit der Funktion, sind aber nicht zwingend notwendig. Definitionen innerhalb von Funktionen sind lokal und beeinflussen den äußeren Bereich nicht.

Tipp: Die Funktion `even?` prüft, ob eine Zahl gerade ist.

2. Schreibe die Funktion `positives`, die eine Liste von Zahlen entgegennimmt und nur die positiven Zahlen zurückgibt.

**Signatur und Testfall:**

```racket
; Positive Elemente einer Liste herausfiltern
(: positives (list-of-number -> list-of-number))

; Beispiel
(define list5 (cons 12 (cons -15 (cons -5 (cons 4 empty)))))

; Testfall
(check-expect (positives list5) (cons 12 (cons 4 empty)))
```

Die Funktion `positives` ist ähnlich zu `evens`, aber du musst sie selbst schreiben.

Tipp: Die Funktion `positive?` prüft, ob eine Zahl positiv ist.