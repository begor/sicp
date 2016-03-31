#lang racket
(require rackunit
         rackunit/text-ui
         "../2_61.rkt")

(define ordered-set-tests
  (test-suite
   "Tests for exercise 2_61"
   (check-equal? (adjoin-set 4 '(1 2 3 7 9 15)) '(1 2 3 4 7 9 15))
   (check-equal? (adjoin-set 3 '(1 2 3 7 9 15)) '(1 2 3 7 9 15))
   (check-equal? (adjoin-set 0 '(1 2 3 7 9 15)) '(0 1 2 3 7 9 15))))
         

(run-tests ordered-set-tests)