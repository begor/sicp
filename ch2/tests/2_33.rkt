#lang racket
(require rackunit
         rackunit/text-ui
         "../2_33.rkt")

(define soperations-accumulate-tests
  (test-suite
   "Tests for exercise 2.33"
   (let ([x (list 1 2 3)]
         [y (list 4 5 6)]
         [z (list 4 5 6 22 112 2133 12 2)])
     (check-equal? (map (lambda (x) (* x 4)) x) '(4 8 12))
     (check-equal? (append x y) '(1 2 3 4 5 6))
     (check-equal? (length z) 8))))

(run-tests soperations-accumulate-tests)