#lang racket
(require rackunit
         rackunit/text-ui
         "../2_41.rkt")

(define threes-test
  (test-suite
   "Tests for exercise 2.40"
   (check-equal? (threes-sum-equal-s 1 9) '())
   (check-equal? (threes-sum-equal-s 5 5) '())
   (check-equal? (threes-sum-equal-s 10 9) '((4 3 2) (5 3 1) (6 2 1)))
   (check-equal? (threes-sum-equal-s 9 9) '((4 3 2) (5 3 1) (6 2 1)))))

(run-tests threes-test)