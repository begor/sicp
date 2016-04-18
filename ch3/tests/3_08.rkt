#lang racket
(require rackunit
         rackunit/text-ui
         "../3_08.rkt")

(define f-test
  (test-suite
   "Tests for exercise 3_8"
   (check-equal? (+ (f 1) (f 0)) 1)
   (check-equal? (+ (f 0) (f 1)) 0)))
     
(run-tests f-test)