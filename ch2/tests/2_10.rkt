#lang racket
(require rackunit
         rackunit/text-ui
         "../2_7.rkt"
         "../2_10.rkt")

(define interval-tests
  (test-suite
   "Tests for exercise 2.10"
   (let ([a (make-interval -2.0 2.0)]
         [b (make-interval 20.0 100.0)])
     (check-exn exn:fail? 
                (lambda () (div-interval b a))))))


(run-tests interval-tests)