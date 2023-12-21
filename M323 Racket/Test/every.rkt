;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname every) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; prüfen, ob Prädikat auf alle Elemente einer Liste zutrifft
(: every? ( (%a -> boolean) (list-of %a) -> boolean))

; Testfälle
(check-expect (every? even? (list 1 2 3 4 5))#f)
(check-expect (every? even? empty) #t)
(check-expect (every? even? (list 2 4 6)) #t)

; Schreiben Sie hier die Funktion "every?" mithilfe von "fold". Für die leere Liste beachten Sie den Testfall.
(define every?
  (lambda (f list)
    (fold #t
               (lambda (first rest)
                 (and (f first) rest))
               list)))