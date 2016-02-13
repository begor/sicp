#lang racket
(require rackunit
         rackunit/text-ui
         "../2_6.rkt")

(define church-tests
  (test-suite
   "Tests for exercise 2.6"
   (check-equal? (print zero) 0)
   (check-equal? (print one) 1)
   (check-equal? (print two) 2)
   (check-equal? (print (add-1 two)) 3)
   (check-equal? (print (plus one two)) 3)
   (check-equal? (print (plus zero (add-1 two))) 3)))

(run-tests church-tests)