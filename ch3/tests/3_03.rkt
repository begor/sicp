#lang racket
(require rackunit
         rackunit/text-ui
         "../3_03.rkt")

(define protected-account-test
  (test-suite
   "Tests for exercise 3_3"
   (let ([acc (make-account 100 'qwerty)])
     (check-equal? ((acc 'qwerty 'withdraw) 50) 50)
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password")
     (check-equal? ((acc 'qwerty 'deposit) 100) 150))))
     
(run-tests protected-account-test)