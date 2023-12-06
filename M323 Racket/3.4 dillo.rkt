;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |3.4 dillo|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(define-record dillo
  make-dillo
  (dillo-weight natural)
  (dillo-alive? boolean))

(: make-dillo (natural boolean -> dillo))
(: dillo-weight (dillo -> natural))
(: dillo-alive? (dillo -> boolean))

(define dillo1 (make-dillo 55000 #t)) ; 55 kg, lebendig 
(define dillo2 (make-dillo 58000 #f)) ; 58 kg, tot
(define dillo3 (make-dillo 60000 #t)) ; 60 kg, lebendig
(define dillo4 (make-dillo 63000 #f)) ; 63 kg, tot

(: feed-dillo (dillo -> dillo))

(check-expect (feed-dillo dillo1) (make-dillo 55500 #t))
(check-expect (feed-dillo dillo2) dillo2)

(define feed-dillo
  (lambda (d)
    (cond
      [(dillo-alive? d) (make-dillo (+ (dillo-weight d) 500) #t)]
      [else d])))

(: run-over-dillo (dillo -> dillo))

(check-expect (run-over-dillo dillo1) (make-dillo 55000 #f))
(check-expect (run-over-dillo dillo2) dillo2)

(define run-over-dillo
  (lambda (d)
    (make-dillo (dillo-weight d) #f)))