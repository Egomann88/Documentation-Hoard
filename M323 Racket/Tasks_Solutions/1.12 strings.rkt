;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |1.12 strings|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
(: double-string (string -> string))

(check-expect (double-string "ad") "adad")
(check-expect (double-string "test1") "test1test1")

(define double-string
  (lambda (str)
    (string-append str str)))

(check-expect (quadruple-string "ad") "adadadad")
(check-expect (quadruple-string "test1") "test1test1test1test1")

(define quadruple-string
  (lambda (str)
    (string-append (double-string str) (double-string str))))

(check-expect (octuple-string "ad") "adadadadadadadad")
(check-expect (octuple-string "test1") "test1test1test1test1test1test1test1test1")

(define octuple-string
  (lambda (str)
    (string-append (quadruple-string str) (quadruple-string str))))

(check-expect (sixteentuple-string "ad") "adadadadadadadadadadadadadadadad")
(check-expect (sixteentuple-string "test1") "test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1")

(define sixteentuple-string
  (lambda (str)
    (string-append (octuple-string str) (octuple-string str))))