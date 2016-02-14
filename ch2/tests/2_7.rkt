#lang racket
(require rackunit
         rackunit/text-ui
         "../2_7.rkt")

(define interval-tests
  (test-suite
   "Tests for exercise 2.7"
   (check-equal? (make-interval 5 7) '(5 . 7))
   (check-equal? (lower-bound (make-interval 3 9)) 3)
   (check-equal? (upper-bound (make-interval 3 9)) 9)
   (check-equal? (upper-bound (make-interval 10 2)) 10)))

(run-tests interval-tests)
