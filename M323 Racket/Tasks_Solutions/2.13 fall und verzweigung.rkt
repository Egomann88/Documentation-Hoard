;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |2.13 fall und verzweigung|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(: max-2 (number number -> number))

(check-expect (max-2 2 3) 2)
(check-expect (max-2 6 12) 6)
(check-expect (max-2 1 8) 1)

(define max-2
  (lambda (a b)
    (cond
      [(< a b) a]
      [else b])))

(: max-3 (number number number -> number))

(check-expect (max-3 2 3 4) 2)
(check-expect (max-3 6 12 18) 6)
(check-expect (max-3 1 8 2) 1)

(define max-3
  (lambda (a b c)
    (max-2 a (max-2 b c))))

(: max-3? (number number number -> boolean))

(check-expect (max-3? 22 3 4) #f)
(check-expect (max-3? 6 12 18) #t)
(check-expect (max-3? 2 8 1) #f)

(define max-3?
  (lambda (a b c)
    (cond
      [(= a (max-3 a b c)) #t]
      [else #f])))

(: valid-value? (number number number -> boolean))

(check-expect (valid-value? 22 3 4) #f)
(check-expect (valid-value? 6 6 18) #t)
(check-expect (valid-value? 2 1 8) #t)

(define valid-value?
  (lambda (value min max)
    (cond
      [(< value min) #f]
      [(> value max) #f]
      [else #t])))

(: clamp (number number number -> number))

(check-expect (clamp 3 4 5) 4)
(check-expect (clamp 4 3 5) 4)
(check-expect (clamp 5 3 4) 4)
(check-expect (clamp 5 4 4) 4)

(define clamp
  (lambda (value min max)
    (cond
      [(valid-value? value min max) value]
      [(< value min) min]
      [else max])))