#lang racket
(require rackunit
         rackunit/text-ui
         "../2_39.rkt")

(define reverse-tests
  (test-suite
   "Tests for exercise 2.39"
   (let ([a (list 1 2 3 4 5)])
     (check-equal? (reverse a) '(5 4 3 2 1))
     (check-equal? (reverse a) (reverse-fl a))
     (check-equal? (reverse a) (reverse-fr a)))))

(run-tests reverse-tests)