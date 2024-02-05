;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |1.11 fahrenheit|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(check-expect (fahrenheit->celsius 32) 0)
(check-expect (fahrenheit->celsius 212) 100)
(check-expect (fahrenheit->celsius 98.6) 37)

(check-expect (celsius->fahrenheit 0) 32)
(check-expect (celsius->fahrenheit 100) 212)
(check-expect (celsius->fahrenheit 37) 98.6)

(define fahrenheit->celsius
  (lambda (f)
    (* 5 (/ (- f 32) 9))))

(define celsius->fahrenheit
  (lambda (c)
    (+ 32 (/ (* c 9) 5))))