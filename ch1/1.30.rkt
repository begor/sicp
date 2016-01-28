#lang racket
;;;Linear-recursion
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;;;Linear iteration
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
    result
    (iter (next a)  (+ result a))))
  (iter a 0))