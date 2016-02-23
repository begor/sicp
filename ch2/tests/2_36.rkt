#lang racket
(require rackunit
         rackunit/text-ui
         "../2_36.rkt")

(define accumulate-n-tests
  (test-suite
   "Tests for exercise 2.36"
     (check-equal? (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))) '(22 26 30))))

(run-tests accumulate-n-tests)