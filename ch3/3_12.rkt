#lang r5rs
(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

(cdr x) ;; Since append has no side-effects, it will be '(b)

(define w (append! x y))

(cdr x) ;; Since append! is a mutator, result will be '(b c d)