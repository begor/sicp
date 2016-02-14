#lang racket
(require rackunit
         rackunit/text-ui
         "../2_7.rkt"
         "../2_11.rkt")

(define interval-tests
  (test-suite
   "Tests for exercise 2.11"
   (let ([a (make-interval 2.0 5.0)]
         [b (make-interval -20.0 100.0)]
         [c (make-interval -10.0 -20.0)])
     (check-equal? (mul-interval-opt a b) (mul-interval a b))
     (check-equal? (mul-interval-opt a c) (mul-interval a c))
     (check-equal? (mul-interval-opt c b) (mul-interval c b)))))


(run-tests interval-tests)