#lang racket
(require rackunit
         rackunit/text-ui
         "../2_28.rkt")

(define fringe-tests
  (test-suite
   "Tests for exercise 2.28"
   (let ([x (list (list 1 2) (list 3 4))])
     (check-equal? (fringe x) '(1 2 3 4))
     (check-equal? (fringe (list x x)) '(1 2 3 4 1 2 3 4)))))

(run-tests fringe-tests)