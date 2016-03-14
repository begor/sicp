#lang racket
(require rackunit
         rackunit/text-ui
         "../2_67.rkt"
         "../2_68.rkt")

(define encode-tests
  (test-suite
   "Tests for exercise 2_68"
   (let ([sample-tree
          (make-code-tree (make-leaf 'A 4)
                          (make-code-tree
                           (make-leaf 'B 2)
                           (make-code-tree (make-leaf 'D 1)
                                           (make-leaf 'C 1))))]
         [sample-message '(A D A B B C A)])
     (check-equal? (encode sample-message sample-tree) '(0 1 1 0 0 1 0 1 0 1 1 1 0)))))
     
         

(run-tests encode-tests)