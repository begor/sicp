#lang racket
(require rackunit
         rackunit/text-ui
         "../2_46.rkt"
         "../2_47_1.rkt")

(define frame-tests
  (test-suite
   "Tests for exercise 2.47"
   (let ([e1 (make-vect 1 1)]
         [e2 (make-vect 3 5)]
         [o (make-vect 2 1)])
     (let ([frame (make-frame o e1 e2)])
       (check-equal? frame (list o e1 e2))
       (check-equal? (edge1-frame frame) e1)
       (check-equal? (edge2-frame frame) e2)
       (check-equal? (origin-frame frame) o)))))

(run-tests frame-tests)