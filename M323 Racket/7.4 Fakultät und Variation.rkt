;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |7.4 Fakultät und Variation|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; 1.
(: faktor (natural -> natural))

(check-expect (faktor 5) 120)
(check-expect (faktor 4) 24)
(check-expect (faktor 7) 5040)

(define faktor
  (lambda (num)
    (cond
      [(= num 0) 1]
      [else (* num (faktor (- num 1)))])))

; 2.
(: sum (natural -> natural))

(check-expect (sum 9) 45)
(check-expect (sum 45) 1035)
(check-expect (sum 22) 253)

(define sum
  (lambda (num)
    (cond
      [(= num 0) 0]
      [else (+ num (sum (- num 1)))])))

; 3.
(: variation (natural natural -> natural))

(check-expect (variation 10 3) 720)
(check-expect (variation 2 0) 1)
(check-expect (variation 2 2) 2)
(check-expect (variation 5 3) 60)

(define variation
  (lambda (n k)
    (/ (faktor n) (faktor (- n k)))))

; 4.
(: komination (natural natural -> natural))

(check-expect (komination 10 3) 120)
(check-expect (komination 8 8) 1)
(check-expect (komination 5 0) 1)
(check-expect (komination 6 2) 15)
(check-expect (komination 42 6) 5245786)

(define komination
  (lambda (n k)
    (/ (faktor n) (* (faktor (- n k)) (faktor k)))))

; 4.1
(: binom (natural natural -> natural))

(check-expect (binom 10 3) 120)
(check-expect (binom 8 8) 1)
(check-expect (binom 5 0) 1)
(check-expect (binom 6 2) 15)

(define binom
  (lambda (n k)
    (cond
      [(or (= k 0) (= k n)) 1]
      [else (+ (binom (- n 1) (- k 1)) (binom (- n 1) k))])))