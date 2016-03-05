#lang racket
(require rackunit
         rackunit/text-ui
         "../2_55.rkt")

(define deriv-tests
  (test-suite
   "Tests for exercise 2.55"
   (check-equal? (deriv '(** x 3) 'x) '(* 3 (** x 2)))
   (check-equal? (deriv '(* x y) 'x) 'y)))

(run-tests deriv-tests)