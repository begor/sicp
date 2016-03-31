#lang racket
(require rackunit
         rackunit/text-ui
         "../2_67.rkt"
         "../2_69.rkt")

(define generate-tests
  (test-suite
   "Tests for exercise 2_69"
   (let ([a '((A 4) (B 2) (C 1) (D 1))])
     (check-equal? (generate-huffman-tree a)
                   '(((leaf A 4) ((leaf B 2) ((leaf D 1) (leaf C 1) (D C) 2) (B D C) 4) (A B D C) 8))))))
     

(run-tests generate-tests)