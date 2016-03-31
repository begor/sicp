#lang racket
(require rackunit
         rackunit/text-ui
         "../2_34.rkt")

(define horner-tests
  (test-suite
   "Tests for exercise 2.34"
   (check-equal? (horner-eval 2 (list 1 3 0 5 0 1)) 79)
   (check-equal? (horner-eval 3 (list 8 0 3 0 5 1 0 0 7)) 46610)))

(run-tests horner-tests)