#lang racket
(require rackunit
         rackunit/text-ui
         "../2_64.rkt"
         "../2_66.rkt")

(define lookup-tests
  (test-suite
   "Tests for exercise 2_66"
   (let ([db (list->tree (list (make-record 1 'Lisp)
                               (make-record 2 'Python)
                               (make-record 3 'Haskell)
                               (make-record 4 'Clojure)))])
     (check-equal? (lookup db 1) 'Lisp)
     (check-equal? (lookup db 3) 'Haskell)
     (check-equal? (lookup db 8) #f))))
     
         

(run-tests lookup-tests)