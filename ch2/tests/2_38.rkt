#lang racket
(require rackunit
         rackunit/text-ui
         "../2_38.rkt")

(define folds-tests
  (test-suite
   "Tests for exercise 2.38"
   (let ([a (list 1 2 3)])
     (check-equal? (fold-left / 1 (list 1 2 3)) 1/6)
     (check-equal? (fold-right / 1 (list 1 2 3)) 3/2)
     (check-equal? (fold-left list null (list 1 2 3)) (list (list (list null 1) 2) 3))
     (check-equal? (fold-right list null (list 1 2 3)) (list 1 (list 2 (list 3 null)))))))

(run-tests folds-tests)