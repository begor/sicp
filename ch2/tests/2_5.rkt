#lang racket
(require rackunit
         rackunit/text-ui
         "../2_5.rkt")

(define cons-tests
  (test-suite
   "Tests for exercise 2.4"
   (check-equal? (car (cons 1 2)) 1)
   (check-equal? (cdr (cons 1 2)) 2)
   (check-equal? (cdr (cons 21 4)) 4)
   (check-equal? (car (cons -132 12)) -132)))

(run-tests cons-tests)