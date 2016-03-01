#lang racket
(require rackunit
         rackunit/text-ui
         "../2_46.rkt"
         "../2_48.rkt")

(define segment-tests
  (test-suite
   "Tests for exercise 2.48"
   (let ([v1 (make-vect 1 1)]
         [v2 (make-vect 3 5)])
     (let ([segment (make-segment v1 v2)])
       (check-equal? (start-segment segment) v1)
       (check-equal? (end-segment segment) v2)))))

(run-tests segment-tests)