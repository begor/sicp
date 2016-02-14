#lang racket
(require rackunit
         rackunit/text-ui
         "../2_7.rkt"
         "../2_8.rkt"
         "../2_9.rkt")

(define interval-tests
  (test-suite
   "Tests for exercise 2.7"
   (let ([a (make-interval 2.0 5.0)]
         [b (make-interval 20.0 100.0)]
         [c (make-interval 10.0 20.0)])
     (check-equal? (rad-interval a) 1.5)
     (check-equal? (rad-interval (sub-interval b c)) 45.0)
     (check-equal? (rad-interval (sub-interval b c)) (+ (rad-interval b) (rad-interval c))))))


(run-tests interval-tests)