;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname get-vegetables-food) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Ein Essen ist eins der folgenden:
; - Frühstück
; - Mittagessen
; - Abendessen
(define food
  (signature (mixed breakfast
                    lunch
                    dinner)))

; Kohlenhydrate ist eins der folgenden:
; - Brot
; - Teigwaren
; - Reis
(define carbohydrate
  (signature (one-of "Brot" "Toast" "Teigwaren" "Reis" "Kartoffelstock" "Pommes Frites")))

; Gemüse ist eins der folgenden:
; - Bohnen
; - Romanesco
; - Blumenkohl
(define vegetables
  (signature (one-of "Bohnen" "Romanesco" "Blumenkohl" "Gurken" "Erbsen" "Brokkoli")))

; Fleisch ist eins der folgenden:
; - Schinken
; - Rindsfilet
; - Lachs
(define meat
  (signature (one-of "Schinken" "Rindsfleich" "Lachs" "Salami" "Kotlettt" "Hänchen")))

; Das Frühstück hat folgende Eigenschaften:
; - Kohlenhydrate
; - Gemüse
; - Fleich
(define-record breakfast
  make-breakfast
  breakfast?
  (breakfast-carbohydrate carbohydrate)
  (breakfast-vegetables vegetables)
  (breakfast-meat meat))

(define breakfast1 (make-breakfast "Brot" "Bohnen" "Schinken")) ; Frühstück mit Brot, Bohnen und Schinken
(define breakfast2 (make-breakfast "Toast" "Gurken" "Salami")) ; Frühstück mit Toast, Gurken und Salami

; Was für ein Gemüse ist im Frühstück enthalten.
(: get-vegetables-breakfast (breakfast -> vegetables))

(check-expect (get-vegetables-breakfast breakfast1) "Bohnen")
(check-expect (get-vegetables-breakfast breakfast2) "Gurken")

(define get-vegetables-breakfast
  (lambda (breakfast)
    (breakfast-vegetables breakfast)))

; Das Mittagessen hat folgende Eigenschaften:
; - Kohlenhydrate
; - Gemüse
; - Fleich
(define-record lunch
  make-lunch
  lunch?
  (lunch-carbohydrate carbohydrate)
  (lunch-vegetables vegetables)
  (lunch-meat meat))

(define lunch1 (make-lunch "Teigwaren" "Romanesco" "Rindsfleich")) ; Mittagessen mit Teigwaren, Romanesco und Rindfleisch
(define lunch2 (make-lunch "Pommes Frites" "Blumenkohl" "Kotlettt")) ; Mittagessen mit Pommes Frites, Blumenkohl und Kotlett

; Was für ein Gemüse ist im Mittagessen enthalten.
(: get-vegetables-lunch (lunch -> vegetables))

(check-expect (get-vegetables-lunch lunch1) "Romanesco")
(check-expect (get-vegetables-lunch lunch2) "Blumenkohl")

(define get-vegetables-lunch
  (lambda (lunch)
    (lunch-vegetables lunch)))

; Das Abendessen hat folgende Eigenschaften:
; - Kohlenhydrate
; - Gemüse
; - Fleich
(define-record dinner
  make-dinner
  dinner?
  (dinner-carbohydrate carbohydrate)
  (dinner-vegetables vegetables)
  (dinner-meat meat))

(define dinner1 (make-dinner "Reis" "Erbsen" "Lachs")) ; Abendessen mit Reis, Erbsen und Lachs
(define dinner2 (make-dinner "Kartoffelstock" "Brokkoli" "Hänchen")) ; Abendessen mit Kartoffelstock, Brokkoli und Hänchen

; Was für ein Gemüse ist im Mittagessen enthalten.
(: get-vegetables-dinner (dinner -> vegetables))

(check-expect (get-vegetables-dinner dinner1) "Erbsen")
(check-expect (get-vegetables-dinner dinner2) "Brokkoli")

(define get-vegetables-dinner
  (lambda (dinner)
    (dinner-vegetables dinner)))



; Was für ein Gemüse ist im Essen enthalten:
(: get-vegetables-food (food -> vegetables))

(check-expect (get-vegetables-food breakfast1)
              (get-vegetables-breakfast breakfast1))
(check-expect (get-vegetables-food breakfast2)
              (get-vegetables-breakfast breakfast2))
(check-expect (get-vegetables-food lunch1)
              (get-vegetables-lunch lunch1))
(check-expect (get-vegetables-food lunch2)
              (get-vegetables-lunch lunch2))
(check-expect (get-vegetables-food dinner1)
              (get-vegetables-dinner dinner1))
(check-expect (get-vegetables-food dinner2)
              (get-vegetables-dinner dinner2))

; Schreiben Sie hier die Funktion "get-vegetables-food"!
(define get-vegetables-food
  (lambda (food)
    (cond
      ((breakfast? food) (get-vegetables-breakfast food))
      ((lunch? food) (get-vegetables-lunch food))
      ((dinner? food) (get-vegetables-dinner food))
      (else "Unknown food type"))))