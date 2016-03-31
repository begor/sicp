#lang racket
(require rackunit
         rackunit/text-ui
         "../2_56.rkt")

(define deriv-tests
  (test-suite
   "Tests for exercise 2.56"
   (check-equal? (deriv '(** x 3) 'x) '(* 3 (** x 2)))
   (check-equal? (deriv '(* (* x y) (+ x 3)) 'x) '(+ (* x y) (* y (+ x 3))))
   (check-equal? (deriv '(+ (** x 3) (** x 2)) 'x) '(+ (* 3 (** x 2)) (* 2 x)))
   (check-equal? (deriv '(* x y) 'x) 'y)))

(run-tests deriv-tests)