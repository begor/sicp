#lang racket
(require rackunit
         rackunit/text-ui
         "../2_22.rkt")

(define square-list-iter-tests
  (test-suite
   "Tests for exercise 2.22"
   (let ([a (list 1 2 3 4)]
         [b (list 5)])
     (check-equal? (square-list-iter a) '(1 4 9 16))
     (check-equal? (square-list-iter b) '(25)))))

(run-tests square-list-iter-tests)