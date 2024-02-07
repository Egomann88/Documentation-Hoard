; reguläre empty-list implementierung
(define-record empty-list
  make-empty-list
  empty?)

(define empty (make-empty-list))

; abstrahierte list-of implementierung
(define list-of
  (lambda (element)
    (signature
     (mixed empty-list
            (cons-list-of element)))))

(: cons-list-of (signature -> signature))

; Eine Cons-Liste besteht aus:
; - dem ersten Element
; - einer Liste mit den restlichen Elementen
(define-record (cons-list-of element)
  cons
  cons?
  (first element)
  (rest  (list-of element)))

(: cons (%element (list-of %element) -> (cons-list-of %element)))
(: first ((cons-list-of %element) -> %element))
(: rest ((cons-list-of %element) -> (list-of %element)))

; list-of number für die reliability abstrahiert
(define list-of-number (list-of number))

; Beispiele
(define list0 empty) ; leere Liste
(define list1 (cons 17 empty))
(define list2 (cons 2 (cons 3 (cons 5 (cons 10 empty)))))
(define list3 (cons 12 (cons -15 (cons -5 (cons 4 empty)))))

; Gerade Elemente einer Liste herausfiltern
(: evens (list-of-number -> list-of-number))

; Testfälle
(check-expect (evens list0) empty)
(check-expect (evens list1) empty)
(check-expect (evens list2) (cons 2 (cons 10 empty)))
(check-expect (evens list3) (cons 12 (cons 4 empty)))

(define evens
  (lambda (list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (evens (rest list)))
       (if (even? f)
           (cons f r)
           r)))))

; Eine zweite Funktion, die ähnlich ist wie evens --> Ziel: Danach die Abstaktion durchführen können.

; Positive Elemente einer Liste herausfiltern
(: positives (list-of-number -> list-of-number))

; Testfall
(check-expect (positives list0) empty)
(check-expect (positives list1) (cons 17 empty))
(check-expect (positives list3) (cons 12 (cons 4 empty)))

(define positives
  (lambda (list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (positives (rest list)))
       (if (positive? f)
           (cons f r)
           r)))))