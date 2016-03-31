#lang racket
(require rackunit
         rackunit/text-ui
         "../2_46.rkt")

(define vect-tests
  (test-suite
   "Tests for exercise 2.42"
   (let ([v1 (make-vect 1 1)]
         [v2 (make-vect 3 5)]
         [v1+2 (make-vect 4 6)]
         [v2-1 (make-vect 2 4)]
         [v2*5 (make-vect 15 25)])
     (check-equal? (add-vect v1 v2) v1+2)
     (check-equal? (sub-vect v2 v1) v2-1)
     (check-equal? (scale-vect 5 v2) v2*5))))

(run-tests vect-tests)