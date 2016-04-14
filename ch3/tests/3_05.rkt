#lang racket
(require rackunit
         rackunit/text-ui
         "../3_05.rkt")

(define estimate-integral-test
  (test-suite
   "Tests for exercise 3_5"
   (check-= (estimate-integral in-unit-disk? -2.0 -2.0 2.0 2.0 10) pi 0.1)
   (check-= (estimate-integral in-unit-disk? -4.0 -4.0 4.0 4.0 100) pi 0.1)))

(run-tests estimate-integral-test)