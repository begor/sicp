#lang racket
;;;Product procedure (recursive)
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;;;Product procedure (iterative)
(define (product-iter term a next b)
  (define (iter a res)
    (if (> a b)
      res
      (iter (next a) (* res a))))
  (iter a 1))

;;;Factorial
(define (factorial a)
  (define (identity x) x)
  (define (inc n) (+ n 1))
  (if (= a 0)
      1
      (product-iter identity 1 inc a)))
