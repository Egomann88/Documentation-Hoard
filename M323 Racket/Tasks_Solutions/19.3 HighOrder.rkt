;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname 19.3_HihgOrde) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; ----- Funktionen auf Listen -----

(define list-of-number (signature (list-of number)))

; Beispiele
(define list0 empty) ; leere Liste
(define list1 (cons 17 empty)) ; Eine einelementige Liste: 17 (+ empty)
(define list2 (cons 5 (cons 17 empty))) ; Eine 2elementige Liste: 5 17
(define list3 (cons 3 list2)) ; Eine 3elementige Liste: 3 5 17

; ---- Funktionen, welche von den Listen konsumieren ----

; Summe der Elemente einer Liste berechnen
(: list-sum (list-of-number -> number))

; Testfälle
(check-expect (list-sum list0) 0)
(check-expect (list-sum list1) 17)
(check-expect (list-sum list2) 22)
(check-expect (list-sum list3) 25)

(define list-sum
  (lambda (list)
    (cond
      ((empty? list) 0)
      ((cons? list)
       (+ (first list)
          (list-sum (rest list)))
       ))))

; Produkt der Elemente einer Liste
(: list-product (list-of-number -> number))

; Testfälle
(check-expect (list-product list0) 1)
(check-expect (list-product list1) 17)
(check-expect (list-product list2) 85)
(check-expect (list-product list3) 255)

(define list-product
  (lambda (list)
    (cond
      ((empty? list) 1)
      ((cons? list)
       (* (first list)
          (list-product (rest list)))))))

; ---- Funktionen, die etwas produzieren ----

; Gerade Elemente einer Liste herausfiltern
(: evens (list-of-number -> list-of-number))

; Beispiel
(define list4 (cons 2 (cons 3 (cons 5 (cons 10 empty)))))

; Testfall
(check-expect (evens list4) (cons 2 (cons 10 empty)))

(define evens
  (lambda (list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (evens (rest list)))
       (if (even? f)
           (cons f r)
           r)))))

; Eine zweite Funktion, die ähnlich ist wie evens --> Ziel: Danach die Abstaktion durchführen können.

; Positive Elemente einer Liste herausfiltern
(: positives (list-of-number -> list-of-number))

; Beispiel
(define list5 (cons 12 (cons -15 (cons -5 (cons 4 empty)))))

; Testfall
(check-expect (positives list5) (cons 12 (cons 4 empty)))

(define positives
  (lambda (list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (positives (rest list)))
       (if (positive? f)
           (cons f r)
           r)))))

; Kurzbeschreib: Funktion auf alle Elemente einer Liste anwenden.
(: list-map ((%a -> %b) (list-of %a) -> (list-of %b)))

(define list-map
  (lambda (f list) ; "f" muss über lambda gebunden werden.
    (cond
      ((empty? list) empty)
      ((cons? list)
       (cons
        (f (first list)) ; "inc" und "run-over-animal sind nicht sehr ähnlich, daher nennen wir den Ersatz nun "f" für Funktion.
        (list-map f (rest list))))))) ; "f" muss auch über den rekursiven Aufruf wieder als Parameter gesetzt werden.

; Kurzbeschreib: Listenelemente herausfiltern, die ein Kriterium erfüllen
(: list-filter ((%a -> boolean) (list-of %a) -> (list-of %a)))

(define list-filter ; Sowohl evens? als auch positive? etwas filtern heraus. --> list-filter
  (lambda (p? list) ; p? ist noch nicht definiert, deshalb wird p? über lambda gebindet.
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (list-filter p? (rest list))) ; Der rekursive Aufruf braucht auch den Parameter p?
       (if (p? f) ; Das konkrete Prädikat wegmachen und p? als Ersatz-Prädikat hinschreiben.
           (cons f r)
           r)))))

; 1.
(: is-odd? (number -> boolean))

(define is-odd?
  (lambda (n) ; Hilfsfunktion zur Überprüfung auf Ungeradheit
    (not (= (remainder n 2) 0))))

(check-expect (list-map is-odd? list1) (cons #t empty))
(check-expect (list-map is-odd? list2) (cons #t (cons #t empty)))
(check-expect (list-map is-odd? list3) (cons #t (cons #t (cons #t empty))))
(check-expect (list-map is-odd? list4) (cons #f (cons #t (cons #t (cons #f empty)))))

; 2.
(: between_20_and_50? (number -> boolean))

(define between_20_and_50?
  (lambda (n)
    (cond
      [(and (> n 19) (< n 51)) #t]
      [else #f])))

(define myList (cons 10 (cons 22 (cons 31 (cons 56 empty)))))
(check-expect (list-filter between_20_and_50? myList) (cons 22 (cons 31 empty)))

; 3.
(define startList (cons 1 (cons 2 (cons 5 (cons 17 (cons 24 (cons 13 empty)))))))
(define expectList (cons 3 (cons 25 empty)))

(: increase-by-one (number -> number))

; alle listenelemente um eins erhöhen damit 3 und 25 erscheinen
(define increase-by-one
  (lambda (n)
    (+ n 1)))

; alles ausser 3 und 25 rausfiltern
(: is-3-or-25? (number -> boolean))

(define is-3-or-25?
  (lambda (n)
    (cond
      [(or (= n 3) (= n 25)) #t]
      [else #f])))

; Zuerst die Liste um 1 erhöhen und dann 3 & 25 rausfiltern 
(check-expect (list-filter is-3-or-25? (list-map increase-by-one startList)) expectList)

; 4.
(: not-x? ((%a -> %b) %c -> boolean))

(define not-x?
  (lambda (f object)
    (not (f object))))