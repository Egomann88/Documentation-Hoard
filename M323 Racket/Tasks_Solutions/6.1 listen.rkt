;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname |6.1 listen|) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; leere List
(define-record empty-list
  make-empty-list
  empty?) ; eig. sollte es empty-list heissen, aber es wird mit einem custom prädikat gekürzt

; custom prädikat
(define empty (make-empty-list))

; Eine Cons-Liste besteht aus:
; - dem ersten Element
; - einer Liste aus Zahlen mit den restlichen Elementen
(define-record cons-list
  cons ; make-cons-list abgekürzt
  cons? ; cons-list? abgekürzt
  (first number) ; cons-first abgekürzt
  (rest  list-of-numbers)) ; cons-rest abgekürzt

; auszählung aller Listentypen
(define list-of-numbers
  (signature
   (mixed empty-list
          cons-list)))

; leere Liste
(define list0 empty)
; einelementige Liste mit der Zahl 42
(define list1 (cons 42 empty))
; Liste mit den Zahlen 1 2 3
(define list3 (cons 1 (cons 2 (cons 3 empty))))
; Liste mit den Zahlen e und pi
(define list2 (cons 2.7183 (cons 3.14159 empty)))
; Liste mit den Zahlen 2 3 5 7
(define list4 (cons 2 (cons 3 (cons 5 (cons 7 empty)))))

; Summe der Elemente einer Liste von Zahlen berechnen
(: list-sum (list-of-numbers -> number))

(check-expect (list-sum list2) 5.85989)
(check-expect (list-sum list3) 6)
(check-expect (list-sum list4) 17)

(define list-sum
  (lambda (list)
    (cond
      [(empty? list) 0]
      [(cons? list)
       (+ (first list) (list-sum (rest list)))])))

; Produkt der Elemente einer Liste von Zahlen berechnen
(: list-product (list-of-numbers -> number))
3
(check-expect (list-product list1) 42)
(check-expect (list-product list3) 6)
(check-expect (list-product list4) 210)

(define list-product
  (lambda (list)
    (cond
      [(empty? list) 1]
      [(cons? list)
       (* (first list) (list-product (rest list)))])))