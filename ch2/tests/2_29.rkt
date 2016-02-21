#lang racket
(require rackunit
         rackunit/text-ui
         "../2_29.rkt")

(define mobile-weight-tests
  (test-suite
   "Tests for exercise 2.29 a), b)"
   (let ([a (make-branch 3 5)]
         [b (make-branch 4 8)]
         [c (make-branch 8 (make-mobile (make-branch 10 10) (make-branch 13 9)))])
     (check-equal? (total-weight (make-mobile a b)) 13)
     (check-equal? (total-weight (make-mobile c b)) 27))))

(define mobile-balanced-tests
  (test-suite
   "Tests for exercise 2.29 c)"
   (let ([a (make-mobile (make-branch 10 10) (make-branch 1 100))]
         [b (make-mobile (make-branch 10 10) (make-branch 20 38))]
         [c (make-mobile 
             (make-branch 10 (make-mobile (make-branch 10 10) (make-branch 10 10))) 
             (make-branch 20 10))])
     (check-true (balanced? a))
     (check-false (balanced? b))
     (check-true (balanced? c)))))

(run-tests mobile-weight-tests)
(run-tests mobile-balanced-tests)