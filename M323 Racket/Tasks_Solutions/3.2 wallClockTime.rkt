;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |3.2 uhrzeit|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(define hour (signature (integer-from-to 0 23)))
(define minute (signature (integer-from-to 0 59)))

; Eine Uhrzeit besteht aus Stunde und Minute.
(define-record wallclock-time
  make-wallclock-time
  (wallclock-time-hour   hour)
  (wallclock-time-minute minute))

(: make-wallclock-time (hour minute -> wallclock-time))
(: wallclock-time-hour (wallclock-time -> hour))
(: wallclock-time-minute (wallclock-time -> minute))

(define wt1 (make-wallclock-time 11 55)) ; fünf vor zwölf
(define wt2 (make-wallclock-time 0 0)) ; Mitternacht
(define wt3 (make-wallclock-time 1 1)) ; 1 Uhr 1

; Minuten seit Mitternacht berechnen
(: minutes-since-midnight (wallclock-time -> natural))

(check-expect (minutes-since-midnight wt1) 715) ; (+ (* 11 60) 55)
(check-expect (minutes-since-midnight wt2) 0)
(check-expect (minutes-since-midnight wt3) 61)

(define minutes-since-midnight
  (lambda (wt)
    (+ (* 60 (wallclock-time-hour wt))
       (wallclock-time-minute wt))))

; Aus Minuten seit Mitternacht die Uhrzeit berechnen
(: minutes-since-midnight->wallclock-time (natural -> wallclock-time))

(check-expect (minutes-since-midnight->wallclock-time (+ (* 11 60) 55)) wt1)
(check-expect (minutes-since-midnight->wallclock-time 0) wt2)
(check-expect (minutes-since-midnight->wallclock-time 61) wt3)

(define minutes-since-midnight->wallclock-time
  (lambda (msm)
    (make-wallclock-time (quotient msm 60) (remainder msm 60))))

; 3.4
(define-record wallclock-time-12h
  make-wallclock-time-12h
  (wallclock-time-12h-hour       hour)
  (wallclock-time-12h-minute     minute)
  (wallclock-time-12h-regulation string))

(: make-wallclock-time-12h (hour minute string -> wallclock-time-12h))
(: wallclock-time-12h-hour (wallclock-time-12h -> hour))
(: wallclock-time-12h-minute (wallclock-time-12h -> minute))
(: wallclock-time-12h-regulation (wallclock-time-12h -> string))

(: wallclock-time->wallclock-time-12h (wallclock-time -> wallclock-time-12h))

(check-expect (wallclock-time->wallclock-time-12h wt1) (make-wallclock-time-12h 11 55 "AM"))
(check-expect (wallclock-time->wallclock-time-12h wt2) (make-wallclock-time-12h 0 0 "AM"))
(check-expect (wallclock-time->wallclock-time-12h wt3) (make-wallclock-time-12h 1 1 "AM"))

(define wallclock-time->wallclock-time-12h
  (lambda (wct)
    (cond
      [(> (wallclock-time-hour wct) 12)
       (make-wallclock-time-12h (remainder (wallclock-time-hour wct) 12) (wallclock-time-minute wct) "PM")]
      [else
       (make-wallclock-time-12h (wallclock-time-hour wct) (wallclock-time-minute wct) "AM")])))