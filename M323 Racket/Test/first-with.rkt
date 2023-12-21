;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname first-with) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Erstes Element mit einer gegebenen Eigenschaft liefern
(: first-with ((%a -> boolean) (list-of %a) -> %b))

(check-expect (first-with even? (list 2 3 4 5)) 2)
(check-expect (first-with even? empty) #f)
(check-expect (first-with even? (list 3 5 7 9)) #f)

; Schreiben Sie hier die Funktion "first-with":
(define first-with
  (lambda (f list)
    (list-fold #f
               (lambda (first rest)
                (if (f first)
                     first
                     rest))
               list)))

; list-fold importieren, weil es bei mir in implementiert ist.
(: list-fold (%b (%a %b -> %b) (list-of %a) -> %b))

(define list-fold
  (lambda (for-empty for-cons list) ; Die neuen Variablen müssen den Parameter hinzugefügt werden!
    (cond
      ((empty? list) for-empty) ; Die 0 oder 1 sind im empty-Zweig, daher for-empty!
      ((cons? list)
       (for-cons (first list) ; Die * oder + sind im cons-Zweig, daher for-cons!
                 (list-fold for-empty for-cons (rest list))))))) ; Ebenso gehören Sie in den rekursiven Aufruf.