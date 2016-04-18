#lang racket
(require rackunit
         rackunit/text-ui
         "../3_07.rkt")

(define joint-test
  (test-suite
   "Tests for exercise 3_7"
   (let* ([paul (make-account 100 'qwe)]
          [john (make-joint paul 'qwe 'qweqwe)])
     (check-equal? (john 'qwe 'deposit) "Wrong password")
     (check-equal? (paul 'qweqwe 'deposit) "Wrong password")
     (check-equal? ((paul 'qwe 'deposit) 100) 200)
     (check-equal? ((john 'qweqwe 'withdraw) 100) 100)
     (check-equal? ((john 'qweqwe 'deposit) 100) ((paul 'qwe 'deposit) 0)))))


(run-tests joint-test)