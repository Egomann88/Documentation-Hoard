;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |2.14 rückennummber|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(define position
  (signature (enum "Torwart" "Abwehr" "Mittelfeld" "Sturm" "Ersatz")))

(: nummer->position (natural -> position))

(define nummer->position
  (lambda (num)
    (cond
      ((= num 1) "Torwart")
      ((and (>= num 2) (<= num 5)) "Abwehr")
      ((and (>= num 6) (<= num 8)) "Mittelfeld")
      ((and (>= num 9) (<= num 11)) "Sturm")
      ((and (>= num 12) (<= num 99)) "Ersatz"))))

; Testfälle
(check-expect (nummer->position 1) "Torwart")
(check-expect (nummer->position 3) "Abwehr")
(check-expect (nummer->position 5) "Abwehr")
(check-expect (nummer->position 7) "Mittelfeld")
(check-expect (nummer->position 9) "Sturm")
(check-expect (nummer->position 11) "Sturm")
(check-expect (nummer->position 12) "Ersatz")