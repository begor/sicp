#lang racket
(require rackunit
         rackunit/text-ui
         "../2_30.rkt")

(define square-tree-tests
  (test-suite
   "Tests for exercise 2.30"
   (let ([a  (list 1 (list 2 (list 3 4) 5) (list 6 7))])
     (check-equal? (square-tree a) '(1 (4 (9 16) 25) (36 49)))
     (check-equal? (square-tree a) (square-tree-map a))
     (check-equal? (square-tree-m a) (square-tree-map a)))))

(run-tests square-tree-tests)