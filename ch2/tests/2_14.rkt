#lang racket
(require rackunit
         rackunit/text-ui
         "../2_12.rkt"
         "../2_14.rkt")

(define not-eq-tests
  (test-suite
   "Tests for exercise 2.13"
   (let ([a (make-center-percent 10 3)]
         [b (make-center-percent 50 10)]
         [c (make-center-percent 100 50)])
     (check-not-equal? (par1 a b) (par2 a b))
     (check-not-equal? (par1 c a) (par2 c a)) 1)))

(run-tests not-eq-tests)