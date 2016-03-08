#lang racket
(require rackunit
         rackunit/text-ui
         "../2_60.rkt")

(define set-tests
  (test-suite
   "Tests for exercise 2_60"
   (let ([odd '(1 3 5)]
         [prime '(1 3 5 7)])
     (check-equal? (union-set odd prime) '(1 3 5 1 3 5 7))
     (check-equal? (adjoin-set 3 prime) '(3 1 3 5 7)))))
         

(run-tests set-tests)