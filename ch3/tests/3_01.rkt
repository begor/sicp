#lang racket
(require rackunit
         rackunit/text-ui
         "../3_01.rkt")

(define accumulator-tests
  (test-suite
   "Tests for exercise 3_1"
   (let ([a (make-accumulator 5)])
     (check-equal? (a 10) 15)
     (check-equal? (a 10) 25)
     (check-equal? (a 0) 25))))
     
(run-tests accumulator-tests)