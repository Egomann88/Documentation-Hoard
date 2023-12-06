;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |3.9 brüche|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Ein Bruch hat folgende Eigenschaften:
; - Zähler (nominator)
; - Nenner (denominator)
(define-record fraction
  make-fraction
  (fraction-nominator number)
  (fraction-denominator number))

; Signaturen:
(: make-fraction (number number -> fraction))
(: fraction-nominator (fraction -> number))
(: fraction-denominator (fraction -> number))
   

; Beispiele für Testfälle:
(define f-1/2 (make-fraction 1 2))
(define f-3/4 (make-fraction 3 4))
(define f-5/7 (make-fraction 5 7))
(define f-20/10 (make-fraction 20 10))
(define f-1236/323121 (make-fraction 1236 323121))

; Berechnung des ggT vom Zähler und Nenner eines Bruchs
(: fraction-gcd (fraction -> number))

(check-expect (fraction-gcd f-1/2) 1)
(check-expect (fraction-gcd f-20/10) 10)

(define fraction-gcd
  (lambda (frac)
    (gcd (fraction-nominator frac)
         (fraction-denominator frac))))

; Kürzen eines Bruches
(: fraction-reduce (fraction -> fraction))

(check-expect (fraction-reduce f-20/10) (make-fraction 2 1))
(check-expect (fraction-reduce f-1236/323121) (make-fraction 412 107707))

(define fraction-reduce
  (lambda (frac)
    (make-fraction
     (/ (fraction-nominator frac) (fraction-gcd frac))
     (/ (fraction-denominator frac) (fraction-gcd frac)))))

; Testet zwei Brüche auf Gleichheit
(: fraction-=? (fraction fraction -> boolean))

(check-expect (fraction-=? f-1/2 (make-fraction 1 2))  #t)
(check-expect (fraction-=? f-3/4 (make-fraction 5 3))  #f)

(define fraction-=?
  (lambda (frac-1 frac-2)
    (and (= (fraction-nominator (fraction-reduce frac-1)) 
            (fraction-nominator (fraction-reduce frac-2)))
         (= (fraction-denominator (fraction-reduce frac-1))
            (fraction-denominator (fraction-reduce frac-2))))))

; Multiplikation von Brüchen
(: fraction-* (fraction fraction -> fraction))

(check-expect (fraction-* f-1/2 f-3/4) (make-fraction 3 8))
(check-expect (fraction-* f-5/7 f-3/4) (make-fraction 15 28))

(define fraction-*
  (lambda (frac-1 frac-2)
    (fraction-reduce
     (make-fraction
      (* (fraction-nominator frac-1) (fraction-nominator frac-2))
      (* (fraction-denominator frac-1) (fraction-denominator frac-2))))))

; Division von Brüchen
(: fraction-/ (fraction fraction -> fraction))

(check-expect (fraction-/ f-1/2 f-3/4) (make-fraction 2 3))
(check-expect (fraction-/ f-5/7 f-3/4) (make-fraction 20 21))

(define fraction-/
  (lambda (frac-1 frac-2)
    (fraction-reduce
     (make-fraction
      (* (fraction-nominator frac-1) (fraction-denominator frac-2))
      (* (fraction-denominator frac-1) (fraction-nominator frac-2))))))

; Addition von Brüchen
(: fraction-+ (fraction fraction -> fraction))

(check-expect (fraction-+ f-1/2 f-3/4) (make-fraction 5 4))
(check-expect (fraction-+ f-5/7 f-3/4) (make-fraction 41 28))

(define fraction-+
  (lambda (frac-1 frac-2)
    (fraction-reduce
     (make-fraction
      (+ (* (fraction-nominator frac-1) (fraction-denominator frac-2))
         (* (fraction-nominator frac-2) (fraction-denominator frac-1)))
      (* (fraction-denominator frac-1) (fraction-denominator frac-2))))))

; Subtraktion von Brüchen
(: fraction-- (fraction fraction -> fraction))

(check-expect (fraction-- f-1/2 f-3/4) (make-fraction -1 4))
(check-expect (fraction-- f-3/4 f-5/7) (make-fraction 1 28))

(define fraction--
  (lambda (frac-1 frac-2)
    (fraction-reduce
     (fraction-+ frac-1
                 (make-fraction (- (fraction-nominator frac-2))
                                (fraction-denominator frac-2))))))


