#lang racket
(require rackunit
         rackunit/text-ui
         "../2_59.rkt")

(define set-tests
  (test-suite
   "Tests for exercise 2_59"
   (let ([even '(2 4 6)]
         [odd '(1 3 5)]
         [prime '(1 3 5 7)])
     (check-equal? (union-set odd even) '(1 3 5 2 4 6))
     (check-equal? (union-set odd prime) '(1 3 5 7)))))
         

(run-tests set-tests)