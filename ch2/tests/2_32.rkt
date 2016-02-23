#lang racket
(require rackunit
         rackunit/text-ui
         "../2_32.rkt")

(define square-tree-tests
  (test-suite
   "Tests for exercise 2.32"
   (check-equal? (subsets (list 1 2 3)) '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)))))

(run-tests square-tree-tests)