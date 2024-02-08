# Aufgabe 20 - Fold

1. Implementiere die `list-length` Funktion mit `fold`.

**Signatur und Testfälle:**

```racket
(: list-length ((list-of %a) -> number))

(check-expect (list-length (list 1 2 3 4)) 4)
(check-expect (list-length (list 1 4)) 2)
```

2. Implementiere die `list-sum` Funktion mit `fold`.

**Signatur und Testfälle:**

```racket
(: list-sum ((list-of number) -> number))

(check-expect (list-sum (list 1 2 3 4)) 10)
(check-expect (list-sum (list 5 6 7 8)) 26)
```

3. Implementiere die `count-trues` Funktion mit `fold`, um die Anzahl der `#t` in einer Liste zu zählen und als Zahl zurückzugeben.

**Signatur und Testfälle:**

```racket
(: count-trues ((%a -> boolean) (list-of %a) -> number))

(check-expect (count-trues even? (list 1 2 3 4)) 2)
(check-expect (count-trues odd? (list 5 6 7 8)) 2)
```

4. Implementiere die `contains?` Funktion mit `fold`, um zu überprüfen, ob ein Element in einer Liste enthalten ist und `#t` oder `#f` zurückzugeben.

**Signatur und Testfälle:**

```racket
(: contains? ((list-of %a) %a -> boolean))

(check-expect (contains? (list 1 2 3 4) 3) #t)
(check-expect (contains? (list 5 6 7 8) 3) #f)
```

5. Implementiere die `remove-duplicates` Funktion mit `fold`, um alle doppelten Elemente aus einer Liste zu entfernen.

**Signatur und Testfälle:**

```racket
(: remove-duplicates ((list-of %a) -> (list-of %a)))

(check-expect (remove-duplicates (list 1 2 2 3)) (list 1 2 3))
(check-expect (remove-duplicates (list 1 2 5 2 5 5 3)) (list 1 2 5 3))
```
