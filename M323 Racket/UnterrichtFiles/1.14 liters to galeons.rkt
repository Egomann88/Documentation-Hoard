;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |1.14 liters to galeons|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(: liters-per-hundred-kilometers (natural natural -> number))

(check-expect (liters-per-hundred-kilometers 50 500) 10)
(check-expect (liters-per-hundred-kilometers 77 640) 12.03125)

(define liters-per-hundred-kilometers
  (lambda (liters kilometers)
    (* (/ liters kilometers) 100)))

; 2. gallons

(: miles-per-gallon (natural natural -> number))

(define miles-per-gallon
  (lambda (miles gallons)
    (/ miles gallons)))

; 3.
(define kilometers_per_mile 1.61)

(: kilometers_to_miles (natural -> number))
(: miles_to_kilometers (natural -> number))

(define kilometers_to_miles
  (lambda (kilometers)
    (/ kilometers kilometers_per_mile)))

(define miles_to_kilometers
  (lambda (miles)
    (* miles kilometers_per_mile)))

; 4.
(define liters_per_gallon 3.79)

(: liters_to_gallons (natural -> number))
(: gallons_to_liters (natural -> number))

(define liters_to_gallons
  (lambda (liters)
    (/ liters liters_per_gallon)))

(define gallons_to_liters
  (lambda (gallons)
    (* gallons liters_per_gallon)))