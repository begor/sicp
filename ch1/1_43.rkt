#lang racket
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated  f n)
  (define (iter func-rep i)
    (if (= i 1)
        func-rep
        (iter (compose func-rep func-rep) (- i 1))))
  (iter f n))
