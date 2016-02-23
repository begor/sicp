#lang racket
(require rackunit
         rackunit/text-ui
         "../2_35.rkt")

(define count-leaves-tests
  (test-suite
   "Tests for exercise 2.35"
   (let ([a (list 1 3 0 5 0 1)]
         [b (list 1 (list 2 3 (list 4 5 6 (list 7 (list 8 (list (list 9 10) 11))))))])
     (check-equal? (count-leaves a) 6)
     (check-equal? (count-leaves a) (count-leaves-accumulate a))
     (check-equal? (count-leaves b) 11)
     (check-equal? (count-leaves b) (count-leaves-accumulate b)))))

(run-tests count-leaves-tests)