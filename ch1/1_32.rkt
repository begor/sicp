#lang racket
;;Accumulate procedure (recursive)
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

;;Accumulate procedure (iterative)
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a res)
    (if (> a b)
      res
      (iter (next a)
            (combiner (term a) res))))
  (iter a null-value))



;;Helpers
(define (identity x) x)
(define (inc x) (+ x 1))


;;Sum
(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

;;Product
(define (product term a next b)
  (accumulate-iter * 1 term a next b))