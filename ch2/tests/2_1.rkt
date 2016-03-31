#lang racket
(require rackunit
         rackunit/text-ui
         "../2_1.rkt")


(define make-tests
  (test-suite
   "Tests for exercise 2.1"
   (check-equal? (make-rat -1 -2) '(1 . 2) "Both numer and denom are negative")
   (check-equal? (make-rat 1 2) '(1 . 2) "Both numer and denom are positive")
   (check-equal? (make-rat -1 2) '(-1 . 2) "Negative numer and positive denom")
   (check-equal? (make-rat 1 -2) '(-1 . 2) "Positive numer and negative denoms")))

 

(run-tests make-tests)