#lang racket
(require rackunit
         rackunit/text-ui
         "../2_20.rkt")

(define same-parity-tests
  (test-suite
   "Tests for exercise 2.20"
     (check-equal? (same-parity 2 3 4 5 6 7 8 9) '(2 4 6 8))
     (check-equal? (same-parity 1 2 3 4 5 6 7 8 9) '(1 3 5 7 9))))

(run-tests same-parity-tests)