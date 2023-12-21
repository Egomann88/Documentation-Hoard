;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname power2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Zweierpotenzen berechnen
(: power2 (natural -> natural))

(check-expect (power2 0) 1) ; 2^0 = 1
(check-expect (power2 1) 2) ; 2^1 = 2
(check-expect (power2 2) 4) ; 2^2 = 4
(check-expect (power2 3) 8) ; 2^3 = 8

; Schreiben Sie hier die Funktion "power2" hin.
(define power2
  (lambda (n)
    (expt 2 n)))