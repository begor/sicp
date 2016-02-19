#lang racket
(require rackunit
         rackunit/text-ui
         "../2_17.rkt")


(define last-pair-tests
  (test-suite
   "Tests for exercise 2.17"
   (check-equal? (last-pair (list 1 2 3 4 5)) '(5))
   (check-equal? (last-pair (list 1 2 (list 2 3))) '((2 3)))
   (check-equal? (last-pair (list 1)) '(1))))


(run-tests last-pair-tests)