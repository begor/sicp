#lang r5rs
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define three (list 'a 'b 'c))
(count-pairs three) ; 3

(define a '(a))
(define four (list a a))
(count-pairs four)
; 4
; four -> [#a][]->[#a][/]
; a    -> [a][/]


(define seven (list 'c))
(define b (list 'b))
(define c (list 'a))
(set-car! b c)
(set-cdr! b c)
(set-car! seven b)
(set-cdr! seven b)
; 7
; seven -> [#b][]->[#b][]->[b][/](#b)

(define inf '(a b c))
(set-cdr! (cddr inf) inf)
; inf