#lang racket
(require rackunit
         rackunit/text-ui
         "../2_57.rkt")

(define deriv-tests
  (test-suite
   "Tests for exercise 2.57"
   (check-equal? (augend '(+ a b c d)) '(+ b c d))
   (check-equal? (multiplicand '(* a b (+ c d) 3 4)) '(* b (+ c d) 3 4))
   (check-equal? (deriv '(** x 3) 'x) '(* 3 (** x 2)))
   (check-equal? (deriv '(* (* x y) (+ x 3)) 'x) '(+ (* x y) (* y (+ x 3))))
   (check-equal? (deriv '(+ (** x 3) (** x 2)) 'x) '(+ (* 3 (** x 2)) (* 2 x)))
   (check-equal? (deriv '(* x y) 'x) 'y)))

(run-tests deriv-tests)