;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |2.14 rückennummber (nicht nach vorgabe)|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(define-record position
  make-position
  positions?
  (position-name string)
  (position-num-min natural)
  (position-num-max natural))

(define position1 (make-position "Torwärtin" 1 1))
(define position2 (make-position "Abwehrspielerin" 2 5))
(define position3 (make-position "Mittelfeldspielerin" 6 9))
(define position4 (make-position "Stürmerin" 10 11))
(define position5 (make-position "Ersatzspielerin" 12 99))

(: nummer->position (natural position -> boolean))

(define nummer->position
  (lambda (number position)
    (define n1 (position-num-min position))
    (define n2 (position-num-max position))
    (cond
      [(and (> number n1) (< number n2)) #t]
      [else #f])))