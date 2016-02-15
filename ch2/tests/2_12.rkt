#lang racket
(require rackunit
         rackunit/text-ui
         "../2_7.rkt"
         "../2_12.rkt")

(define percent-tests
  (test-suite
   "Tests for exercise 2.12"
   (let ([a (make-center-percent 2 20)]
         [b (make-center-percent 25 100)]
         [c (make-center-percent -10 10)])
     (check-equal? (percent a) 20)
     (check-equal? (percent b) 100)
     (check-equal? (percent c) 10))))

(run-tests percent-tests)