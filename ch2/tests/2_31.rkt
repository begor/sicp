#lang racket
(require rackunit
         rackunit/text-ui
         "../2_31.rkt")

(define square-tree-tests
  (test-suite
   "Tests for exercise 2.31"
   (let ([a  (list 1 (list 2 (list 3 4) 5) (list 6 7))]
         [id (lambda (x) x)]
         [plus-two (lambda (x) (+ x 2))]
         [square (lambda (x) (* x x))])
     (check-equal? (tree-map a id) '(1 (2 (3 4) 5) (6 7)))
     (check-equal? (tree-map a plus-two) '(3 (4 (5 6) 7) (8 9)))
     (check-equal? (tree-map a square) '(1 (4 (9 16) 25) (36 49))))))

(run-tests square-tree-tests)