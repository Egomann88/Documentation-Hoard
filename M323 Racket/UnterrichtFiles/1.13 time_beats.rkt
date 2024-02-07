;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |1.13 time_beats|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(: time->beats (natural natural natural natural -> number))

; (check-expect (time->beats 0 0 0 0) 0.0)
(check-expect (time->beats 3 2 9 6) 126.50)

(define time->beats
  (lambda (hours minutes sek zhSek)
    (round(+ (* hours 41.6667) (* minutes 0.6944) (* sek 0.0116) (* zhSek 0.0000116)))))