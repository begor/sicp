#lang racket
(require rackunit
         rackunit/text-ui
         "../2_7.rkt"
         "../2_8.rkt")

(define interval-tests
  (test-suite
   "Tests for exercise 2.8"
   (let ([a (make-interval 2 5)]
         [b (make-interval 50 100)]
         [c (make-interval 10 60)])
     (check-equal? (sub-interval b a) '(45 . 98))
     (check-equal? (sub-interval c a) '(5 . 58))
     (check-equal? (sub-interval c b) '(-90 . 10)))))


(run-tests interval-tests)