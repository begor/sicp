#lang racket
(require rackunit
         rackunit/text-ui
         "../3_02.rkt")

(define counted-tests
  (test-suite
   "Tests for exercise 3_2"
   (let ([sqr-monitored (make-monitored (lambda (x) (* x x)))])
     (check-equal? (sqr-monitored 'how-many-calls?) 0)
     (check-equal? (sqr-monitored 10) 100)
     (check-equal? (sqr-monitored 'how-many-calls?) 1)
     (check-equal? (sqr-monitored 2) 4)
     (check-equal? (sqr-monitored 'how-many-calls?) 2)
     (check-equal? (begin (sqr-monitored 'reset-count)
                          (sqr-monitored 'how-many-calls?)) 0))))
     
(run-tests counted-tests)