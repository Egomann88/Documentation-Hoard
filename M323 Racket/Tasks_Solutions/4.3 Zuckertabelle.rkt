;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |4.3 Zuckertabelle|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Zuckeranteile bestehen aus:
; - Fruktose-Menge (in g)
; - Glukose-Menge (in g)
(define-record sugars
  make-sugars
  sugars?
  (sugars-fructose-g rational)
  (sugars-glucose-g  rational))

(define sugars1 (make-sugars 1 1)) ; 1 g Fruktose, 1 g Glukose
(define sugars2 (make-sugars 2 3)) ; 2 g Fruktose, 3 g Glukose
(define sugars3 (make-sugars 5 5)) ; 5 g Fruktose, 5 g Glukose
(define sugars4 (make-sugars 10 2.5)) ; 10 g Fruktose, 2.5 g Glukose
(define sugars5 (make-sugars 10 13)) ; 10 g Fruktose, 13 g Glukose
(define sugars6 (make-sugars 15 10)) ; 15 g Fruktose, 10 g Glukose

; Eine Ampel ist einer der folgenden Werte:
; - rot
; - gelb
; - grün
(define traffic-light
  (signature
   (enum "red" "yellow" "green")))

; Ein Zuckergehalt ist eins der folgenden:
; - Gewicht in Gramm
; - Zuckeranteile
; - Ampelbezeichnung
(define sugar-content
  (signature
   (mixed rational
          sugars
          traffic-light)))

; Ampelbezeichnung für Zuckergehalt ermitteln
(: sugar-traffic-light (sugar-content -> traffic-light))

(check-expect (sugar-traffic-light 2) "green")
(check-expect (sugar-traffic-light 5) "yellow")
(check-expect (sugar-traffic-light 10) "yellow")
(check-expect (sugar-traffic-light 12.5) "yellow")
(check-expect (sugar-traffic-light 23) "red")

(check-expect (sugar-traffic-light sugars1) "green")
(check-expect (sugar-traffic-light sugars2) "yellow")
(check-expect (sugar-traffic-light sugars3) "yellow")
(check-expect (sugar-traffic-light sugars4) "yellow")
(check-expect (sugar-traffic-light sugars5) "red")
(check-expect (sugar-traffic-light sugars6) "red")

(check-expect (sugar-traffic-light "green") "green")
(check-expect (sugar-traffic-light "yellow") "yellow")
(check-expect (sugar-traffic-light "red") "red")

(define sugar-traffic-light
  (lambda (sc) ; sc = sugar-content
    (cond
      [(rational? sc) (sugar-weight->traffic-light sc)] ; Wenn die Zuckergehalt direkt angegeben wird und man den String berechnen muss 
      [(sugars? sc) (sugar-weight->traffic-light
                     (+ (sugars-fructose-g sc) (sugars-glucose-g sc)))] ; Wenn das Sugar Objekt gegeben ist und der Zuckerspiegel berechnet werden muss
      [(string? sc) sc]))) ; Wenn der String direkt angegeben wird, diesen Anzeigen

; Zuckeranteil in g in Ampel umwandeln
(: sugar-weight->traffic-light (rational -> traffic-light))

(check-expect (sugar-weight->traffic-light 2) "green")
(check-expect (sugar-weight->traffic-light 5) "yellow")
(check-expect (sugar-weight->traffic-light 10) "yellow")
(check-expect (sugar-weight->traffic-light 12.5) "yellow")
(check-expect (sugar-weight->traffic-light 22.5) "yellow")
(check-expect (sugar-weight->traffic-light 23) "red")

(define sugar-weight->traffic-light
  (lambda (sw)
    (cond
      [(< sw 5) "green"]
      [(and (>= sw 5) (<= sw 22.5)) "yellow"]
      [else "red"])))