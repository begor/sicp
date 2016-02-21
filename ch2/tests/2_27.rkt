#lang racket
(require rackunit
         rackunit/text-ui
         "../2_27.rkt")

(define deep-reverse-tests
  (test-suite
   "Tests for exercise 2.28"
   (let ([x (list (list 1 2) (list 3 4))]
         [y (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))]
         [z (list 1 (list (list 2 3) (list 4 5) (list 6 (list 7 8))))])
     (check-equal? (reverse x) '((3 4) (1 2)))
     (check-equal? (reverse y) '((2 (3 (4 (5 (6 7))))) 1))
     (check-equal? (deep-reverse x) '((4 3) (2 1)))
     (check-equal? (deep-reverse y) '((((((7 6) 5) 4) 3) 2) 1))
     (check-equal? (deep-reverse z) '((((8 7) 6) (5 4) (3 2)) 1)))))

(run-tests deep-reverse-tests)