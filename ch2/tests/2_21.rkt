#lang racket
(require rackunit
         rackunit/text-ui
         "../2_21.rkt")

(define square-list-tests
  (test-suite
   "Tests for exercise 2.21"
   (let ([a (list 1 2 3 4)]
         [b (list 5)])
     (check-equal? (square-list a) '(1 4 9 16))
     (check-equal? (square-list a) (square-list-map a))
     (check-equal? (square-list b) '(25))
     (check-equal? (square-list b) (square-list-map b)))))

(run-tests square-list-tests)