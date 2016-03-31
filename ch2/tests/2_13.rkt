#lang racket
(require rackunit
         rackunit/text-ui
         "../2_7.rkt"
         "../2_12.rkt"
         "../2_13.rkt")

(define percent-mul-tests
  (test-suite
   "Tests for exercise 2.13"
   (let ([a (make-center-percent 10 3)]
         [b (make-center-percent 50 10)]
         [c (make-center-percent 100 50)])
     (check-= (percent-mul a b) (percent (mul-interval a b)) 1)
     (check-= (percent-mul c a) (percent (mul-interval c a)) 1))))

(run-tests percent-mul-tests)