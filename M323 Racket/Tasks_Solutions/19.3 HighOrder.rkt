;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname 19.3_HihgOrde) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; --- List Filter ---
(: list-filter ((%a -> boolean) (list-of %a) -> (list-of %a)))

(check-expect (list-filter even? (list 1 2 3 4 5 6 7 8 9)) (list 2 4 6 8))
(check-expect (list-filter odd? (list 1 2 3 4 5 6 7 8 9)) (list 1 3 5 7 9))
(check-expect (list-filter positive? (list -1 2 -3 4 -5 6 -7 8 -9)) (list 2 4 6 8))
(check-expect (list-filter between_20_and_50? (list 10 20 30 40 50 60 70 80 90)) (list 20 30 40 50))
(check-expect (list-filter is-3-or-25? (list 1 2 3 4 5 6 7 8 25)) (list 3 25))

(define list-filter
  (lambda (func? list) ; func? ist noch nicht definiert, deshalb wird es über lambda gebunden.
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (list-filter func? (rest list))) ; Der rekursive Aufruf braucht logischerweise die Filter-Funktion
       (if (func? f) ; statt konkreten Bedingungen, wird func? genuzt
           (cons f r) ; bleibt gleich
           r)))))

; Hilfsfunktionen
(: between_20_and_50? (number -> boolean))

(define between_20_and_50?
  (lambda (n)
    (and (>= n 20) (<= n 50))))

; 1.
(: is-3-or-25? (number -> boolean))

(define is-3-or-25?
  (lambda (n)
    (or (= n 3) (= n 25))))

; --- List Map ---
(: list-map ((%a -> %b) (list-of %a) -> (list-of %b)))

(check-expect (list-map is-odd? (list 1 2 3 4 5 6 7 8 9)) (list #t #f #t #f #t #f #t #f #t))
(check-expect (list-map increase-by-one (list 1 2 3 4 5 6 7 8 9)) (list 2 3 4 5 6 7 8 9 10))

(define list-map
  (lambda (func list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (cons
        (func (first list)) ; Hilfsfunktion auf das erste Element anwenden
        (list-map func (rest list))))))) ; rekursiver Aufruf mit dem Rest der Liste

; Hilfsfunktionen
; 1.
(: is-odd? (number -> boolean))

(define is-odd?
  (lambda (n) ; Hilfsfunktion zur Überprüfung auf Ungeradheit
    (not (= (remainder n 2) 0))))

; 2.
(: increase-by-one (number -> number))

(define increase-by-one
  (lambda (n)
    (+ n 1)))