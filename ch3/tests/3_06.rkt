#lang racket
(require rackunit
         rackunit/text-ui
         "../3_06.rkt")

(define rand-test
  (test-suite
   "Tests for exercise 3_6"
   (check-not-equal? (rand 'generate) (rand 'generate))
   (check-equal? ((rand 'reset) 8) 8)
   (check-not-equal? (rand 'generate) (rand 'generate))))

(run-tests rand-test)