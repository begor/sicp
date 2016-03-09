#lang racket
(require rackunit
         rackunit/text-ui
         "../2_65.rkt")

(define binary-trees-tests
  (test-suite
   "Tests for exercise 2_65"
   (let ([evens (list->tree '(0 2 4))]
         [odds (list->tree '(1 3 5))]
         [primes (list->tree '(1 3 5 7))])
     (check-equal? (union-set evens odds) (list->tree '(0 1 2 3 4 5)))
     (check-equal? (intersection-set evens odds) '())
     (check-equal? (intersection-set primes odds) (list->tree '(1 3 5))))))
         

(run-tests binary-trees-tests)