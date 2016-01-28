#lang racket
;;Recursive function
(define (func-rec n)
  (if (< n 3)
      n
      (+ (func-rec (- n 1))
         (func-rec (- n 2))
         (func-rec (- n 3)))))
               
;;Iterative function
(define (func-iter n)
  (define (iter f1 f2 f3 count)
    (if (= count 0)
        f3
        (iter (+ f1 f2 f3) f1 f2 (- count 1))))
  (iter 2 1 0 n))
