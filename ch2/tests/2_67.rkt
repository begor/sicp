#lang racket
(require rackunit
         rackunit/text-ui
         "../2_67.rkt")

(define haffman-tests
  (test-suite
   "Tests for exercise 2_67"
   (let ([sample-tree
          (make-code-tree (make-leaf 'A 4)
                          (make-code-tree
                           (make-leaf 'B 2)
                           (make-code-tree (make-leaf 'D 1)
                                           (make-leaf 'C 1))))]
         [sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0)])
     (check-equal? (decode sample-message sample-tree) '(A D A B B C A)))))
     
         

(run-tests haffman-tests)