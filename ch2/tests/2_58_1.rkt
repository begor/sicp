#lang racket
(require rackunit
         rackunit/text-ui
         "../2_58_1.rkt")

(define deriv-tests
  (test-suite
   "Tests for exercise 2_58_1"
   (check-equal? (deriv '(x + 3) 'x) 1)
   (check-equal? (deriv '(x ** 3) 'x) '(3 * (x ** 2)))
   (check-equal? (deriv '(x * 3) 'x) 3)
   (check-equal? (deriv '((x ** 3) + (x ** 2)) 'x) '((3 * (x ** 2)) + (2 * x)))))

(run-tests deriv-tests)