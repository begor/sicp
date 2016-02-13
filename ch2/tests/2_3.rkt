#lang racket
(require rackunit
         rackunit/text-ui
         "../2_2.rkt"
         "../2_3.rkt")

(define make-tests
  (test-suite
   "Tests for exercise 2.3"
   (let ([r (make-rectangle (make-point 0 4) (make-point 10 -3))]
         [r-alt (make-rectangle-alt (make-point 0 4) 7 10)])
     (check-equal? (rectangle-perimeter r) 34)
     (check-equal? (rectangle-perimeter r-alt) 34)
     (check-equal? (rectangle-square r) 70)
     (check-equal? (rectangle-square r-alt) 70))))

(run-tests make-tests)