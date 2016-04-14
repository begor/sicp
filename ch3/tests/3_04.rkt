#lang racket
(require rackunit
         rackunit/text-ui
         "../3_04.rkt")

(define protected-account-test
  (test-suite
   "Tests for exercise 3_4"
   (let ([acc (make-account 100 'qwerty)])
     (check-equal? ((acc 'qwerty 'withdraw) 50) 50)
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? ((acc 'qwerty 'withdraw) 50) 0)
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Wrong password!")
     (check-equal? (acc 'notqwerty 'withdral) "Cops were called!"))))

(run-tests protected-account-test)