;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname number_of_3_greater_than_20) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Prüft, ob eine 3er Zahl grösser als 20 ist.
(: number_of_3_greater_than_20? (number -> boolean))

; Testfälle
(check-expect (number_of_3_greater_than_20? 12) #f)
(check-expect (number_of_3_greater_than_20? 20) #f)
(check-expect (number_of_3_greater_than_20? 24) #t)
(check-expect (number_of_3_greater_than_20? 45) #t)
(check-expect (number_of_3_greater_than_20? 65) #f)

; Schreiben Sie hier das Prädikat (Hilfsfunktion) number_of_3_greater_than_20? hier!
(define number_of_3_greater_than_20?
  (lambda (num)
    (and (equal? (remainder num 3) 0) (> num 20))))

; Testfälle mit der filter Funktion
(check-expect (filter number_of_3_greater_than_20? (list 10 12 24 45 65 72)) (list 24 45 72))
(check-expect (filter number_of_3_greater_than_20? (list 6 11 21 34 48 62 99)) (list 21 48 99))