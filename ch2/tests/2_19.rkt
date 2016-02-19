#lang racket
(require rackunit
         rackunit/text-ui
         "../2_19.rkt")

(define cc-tests
  (test-suite
   "Tests for exercise 2.13"
   (let ([us-coins (list 50 25 10 5 1)]
         [uk-coins (list 100 50 20 10 5 2 1 0.5)])
     (check-equal? (cc 100 us-coins) 292)
     (check-equal? (cc 100 uk-coins) 104561))))

(run-tests cc-tests)