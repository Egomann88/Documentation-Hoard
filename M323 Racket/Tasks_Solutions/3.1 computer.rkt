;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |3.1 computer|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(define-record computer
  make-computer
  (computer-processor string)
  (computer-ram natural)
  (computer-hard-drive natural))

(: computer-processor (computer -> string))
(: computer-ram (computer -> natural))
(: computer-hard-drive (computer -> natural))

(define gamer (make-computer "Cell" 4 1000))
(define workstation (make-computer "Xeon" 2 500))

(: total-memory (computer -> natural))

(check-expect (total-memory workstation) 502)
(check-expect (total-memory gamer) 1004)

(define total-memory
  (lambda (c)
    (+ (computer-ram c)
       (computer-hard-drive c))))

; Ein Modell ist eins der folgenden:
; - Billigmodell
; - Profi-Modell
; - Gamer-Modell
(define model
  (signature
   (enum "cheap" "professional" "gamer")))

; Standard-Computer zusammenstellen
(: standard-computer (model -> computer))

(check-expect (standard-computer "cheap") (make-computer "Sempron" 2 500))
(check-expect (standard-computer "professional") (make-computer "Xeon" 4 1000))
(check-expect (standard-computer "gamer") (make-computer "Quad" 4 750))

(define standard-computer
  (lambda (k)
    (cond
      [(string=? k "cheap") (make-computer "Sempron" 2 500)]
      [(string=? k "professional") (make-computer "Xeon" 4 1000)]
      [(string=? k "gamer") (make-computer "Quad" 4 750)])))