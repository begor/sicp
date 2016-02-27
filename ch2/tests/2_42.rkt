#lang racket
(require rackunit
         rackunit/text-ui
         "../2_42.rkt")

(define queens-test
  (test-suite
   "Tests for exercise 2.42"
   (check-equal? (queens 4) '(((3 . 4) (1 . 3) (4 . 2) (2 . 1)) ((2 . 4) (4 . 3) (1 . 2) (3 . 1))))))

(run-tests queens-test)