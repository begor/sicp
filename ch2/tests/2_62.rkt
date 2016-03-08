#lang racket
(require rackunit
         rackunit/text-ui
         "../2_62.rkt")

(define ordered-set-tests
  (test-suite
   "Tests for exercise 2_62"
   (check-equal? (union-set '(1 2 3 4 5) '(4 5 6 7)) '(4 5))
   (check-equal? (union-set '(1 2 3) '(4 5 6)) '())
   (check-equal? (union-set '(1 2 3) '(0 1 2 4 5 6)) '(1 2))))
         

(run-tests ordered-set-tests)