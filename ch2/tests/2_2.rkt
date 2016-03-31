#lang racket

(require rackunit
         rackunit/text-ui
         "../2_2.rkt")


(define make-tests
  (test-suite
   "Tests for exercise 2.2"
   (let ([x (make-point 1 2)]
         [y (make-point 0 0)]
         [z (make-point -2 3)]
         [w (make-point -2 -8)])
     (check-equal? (midpoint-segment (make-segment x x)) x)
     (check-equal? (midpoint-segment (make-segment x y)) (make-point 1/2 1))
     (check-equal? (midpoint-segment (make-segment x z)) (make-point -1/2 5/2))
     (check-equal? (midpoint-segment (make-segment z w)) (make-point -2 -5/2)))))

 

(run-tests make-tests)