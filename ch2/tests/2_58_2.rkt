#lang racket
(require rackunit
         rackunit/text-ui
         "../2_58_2.rkt")

(define deriv-tests
  (test-suite
   "Tests for exercise 2_58_2"
   (check-equal? (deriv '(x + 3) 'x) 1)
   (check-equal? (deriv '(x ** 3) 'x) '(3 * (x ** 2)))
   (check-equal? (deriv '(x * 3 + 4) 'x) 3)
   (check-equal? (deriv '(x * 3 + 5 * (x + y + 2)) 'x) 8)
   (check-equal? (deriv '(x ** 3 + x ** 2) 'x) '((3 * (x ** 2)) + (2 * x)))))

(run-tests deriv-tests)