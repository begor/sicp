#lang racket
(require rackunit
         rackunit/text-ui
         "../2_18.rkt")


(define reverse-tests
  (test-suite
   "Tests for exercise 2.18"
   (check-equal? (reverse (list 1 2 3 4 5)) '(5 4 3 2 1))
   (check-equal? (last-pair (list 1)) '(1))))


(run-tests reverse-tests)