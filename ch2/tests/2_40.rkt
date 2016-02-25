#lang racket
(require rackunit
         rackunit/text-ui
         "../2_40.rkt")

(define prime-sum-tests
  (test-suite
   "Tests for exercise 2.40"
   (check-equal? (prime-sum-pairs 10) '((2 1 3)
                                        (3 2 5)
                                        (4 1 5)
                                        (4 3 7)
                                        (5 2 7)
                                        (6 1 7)
                                        (6 5 11)
                                        (7 4 11)
                                        (7 6 13)
                                        (8 3 11)
                                        (8 5 13)
                                        (9 2 11)
                                        (9 4 13)
                                        (9 8 17)
                                        (10 1 11)
                                        (10 3 13)
                                        (10 7 17)
                                        (10 9 19)))))

(run-tests prime-sum-tests)
