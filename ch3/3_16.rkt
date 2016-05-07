#lang r5rs
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define a '(a))
(define aa (cons a a))
(define three (list 'a 'b 'c)) ; 3 
(define four (list a a)) ; 4
(define seven (cons aa aa)) ; 7
(define inf (set-cdr! a a)) ; recursion overflow since cdr of a is itself a