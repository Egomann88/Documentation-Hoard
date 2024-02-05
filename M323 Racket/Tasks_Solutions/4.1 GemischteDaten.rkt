;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |4.1 GemischteDaten|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(define-record dillo
  make-dillo
  dillo?
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

; Parrot
(define-record parrot
  make-parrot
  parrot?
  (parrot-weight   natural)
  (parrot-sentence string))

(: make-parrot (natural string -> parrot))
(: parrot? (any -> boolean))
(: parrot-weight (parrot -> natural))
(: parrot-sentence (parrot -> string))

(define parrot1 (make-parrot 10000 "Der Gärtner war's.")) ; 10kg, Miss Marple
(define parrot2 (make-parrot 5000 "Ich liebe Dich.")) ; 5kg, Romantiker

; Ein Tier ist eins der folgenden:
; - Gürteltier
; - Papagei
(define animal
  (signature
    (mixed dillo parrot)))

(: animal? (any -> boolean))

(check-expect (animal? dillo1) #t)
(check-expect (animal? parrot1) #t)
(check-expect (animal? "foo") #f)

(define animal?
  (lambda (a)
    (cond
      ((dillo? a) #t)   ; Überprüfe, ob es ein Gürteltier ist
      ((parrot? a) #t)  ; Überprüfe, ob es ein Papagei ist
      (else #f))))          ; Wenn es kein gültiges Tier ist, gib #f zurück


; Gewicht eines Tiers feststellen
(: animal-weight (animal -> natural))

(check-expect (animal-weight dillo1) 55000)
(check-expect (animal-weight dillo2) 58000)
(check-expect (animal-weight parrot1) 10000)
(check-expect (animal-weight parrot2) 5000)

(define animal-weight
  (lambda (a)
    (cond
      [(dillo? a) (dillo-weight a)]
      [(parrot? a) (parrot-weight a)])))

; Papagei mit 50 g Futter füttern
(: feed-parrot (parrot -> parrot))

(check-expect (feed-parrot parrot1) (make-parrot 10050 "Der Gärtner war's."))
(check-expect (feed-parrot parrot2) (make-parrot 5050 "Ich liebe Dich."))

(define feed-parrot
  (lambda (p)
    (make-parrot (+ (parrot-weight p) 50) (parrot-sentence p))))

(: feed-animal (animal -> animal))

(check-expect (feed-animal parrot1) (feed-parrot parrot1))
(check-expect (feed-animal parrot2) (feed-parrot parrot2))
(check-expect (feed-animal dillo1) (feed-dillo dillo1))
(check-expect (feed-animal dillo2) (feed-dillo dillo2))

(define feed-animal
  (lambda (a)
    (cond
      [(dillo? a) (feed-dillo a)]
      [(parrot? a) (feed-parrot a)])))