#lang racket
(require rackunit
         rackunit/text-ui
         "../2_54.rkt")

(define equal?-tests
  (test-suite
   "Tests for exercise 2.54"
   (check-true (equal? '(this is a list) '(this is a list)))
   (check-false (equal? '(this is a list) '(this (is a) list)))))

(run-tests equal?-tests)