#lang racket
(require rackunit
         rackunit/text-ui
         "../2_4.rkt")

(define cons-tests
  (test-suite
   "Tests for exercise 2.4"
   (check-equal? (car (cons 1 2)) 1)
   (check-equal? (cdr (cons 1 2)) 2)
   (check-equal? (car (car (cons (cons 1 3) 2))) 1)
   (check-equal? (car (cdr (cdr (cons 1 (cons 2 (cons 3 (cons 4 5))))))) 3)))

(run-tests cons-tests)