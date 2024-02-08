;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname |20 Fold|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; --- List Fold ---
(: list-fold (%b (%a %b -> %b) (list-of %a) -> %b))

(check-expect (list-fold 0 + (list 1 2 3 4 5)) 15)
(check-expect (list-fold 1 * (list 1 2 3 4 5)) 120)

(define list-fold
  (lambda (for-empty for-cons list) ; Die neuen Variablen müssen den Parameter hinzugefügt werden!
    (cond
      ((empty? list) for-empty) ; 0, 1 oder was ganz anderes
      ((cons? list)
       (for-cons (first list)
                 (list-fold for-empty for-cons (rest list)))))))

; --- List filter ---
(: list-filter ((%a -> boolean) (list-of %a) -> (list-of %a)))

; Testfälle
(check-expect (list-filter even? (list 1 2 3 4)) (list 2 4))
(check-expect (list-filter even? (list 5 6 7 8)) (list 6 8))

(define list-filter
  (lambda (f list)
    (list-fold empty
               (lambda
                 (first rest) ; erstes Element
                 (if (f first) ; Rest (mit rekursivem Aufruf -> in list-fold)
                   (cons first rest) ; erstelle neue (gefilterte) Liste und gibt diese in den rekursiven Aufruf
                   rest)) ; rekursiver Aufruf mit nächsten Element
               list)))

; --- List Map ---
(: list-map ((%a -> %b) (list-of %a) -> (list-of %b)))

; Testfälle
(check-expect (list-map (lambda (x) (+ 1 x)) (list 1 2 3 4 5)) (list 2 3 4 5 6))
(check-expect (list-map (lambda (x) (+ 1 x)) (list 5 6 7 8 9)) (list 6 7 8 9 10))

(define list-map
  (lambda (f list)
    (list-fold empty
               (lambda
                 (first rest)
                 (cons (f first) rest)) ; mapping Funktion anwenden und rekrusiven Aufruf starten
               list)))

; --- Aufgaben ---

; 1.
(: list-length ((list-of %a) -> number))

(check-expect (list-length (list 1 2 3 4)) 4)
(check-expect (list-length (list 1 4)) 2)

(define list-length
  (lambda (list)
    (list-fold 0
               (lambda
                 (first rest)
                 (+ 1 rest)) ; 1 zum Zähler hinzufügen und rekursiven Aufruf starten
               list)))

; 2.
(: list-sum ((list-of number) -> number))

(check-expect (list-sum (list 1 2 3 4)) 10)
(check-expect (list-sum (list 5 6 7 8)) 26)

(define list-sum
  (lambda (list)
    (list-fold 0
               (lambda
                 (first rest)
                 (+ first rest)) ; erstes Element zum Zähler hinzufügen und rekursiven Aufruf starten
               list)))

; 3.
(: count-trues ((%a -> boolean) (list-of %a) -> number))

(check-expect (count-trues even? (list 1 2 3 4)) 2)
(check-expect (count-trues odd? (list 5 6 7 8)) 2)

(define count-trues
  (lambda (f list)
    (list-fold 0
               (lambda
                 (first rest)
                 (if (f first) ; Wenn das Ergebnis der Funktion `true` ist, dann 1 zum Zähler hinzufügen
                   (+ 1 rest)
                   rest)) ; sonst nur den rekursiven Aufruf starten
               list)))

; 4.
(: contains? ((list-of %a) %a -> boolean))

(check-expect (contains? (list 1 2 3 4) 3) #t)
(check-expect (contains? (list 5 6 7 8) 3) #f)

(define contains?
  (lambda (list element)
    (list-fold #f
               (lambda (first rest)
                 (cond
                   ((equal? first element) #t)
                   (else rest)))
               list)))

; 5.
(: remove-duplicates ((list-of %a) -> (list-of %a)))

(check-expect (remove-duplicates (list 1 2 2 3)) (list 1 2 3))
(check-expect (remove-duplicates (list 1 2 5 2 5 5 3)) (list 1 2 5 3))

(define remove-duplicates
  (lambda (list)
    (list-fold empty
              (lambda (first rest)
                (if (contains? rest first) ; rest mit list verleichen - nicht allgemein - sonst gibts immer true und gibt leere Liste zurück
                    rest ; ein Element weitergehen (das duplikat auslassen)
                    (cons first rest))) ; neue List ohne duplies erstellen -> im rekursiven Aufruf
              list)))