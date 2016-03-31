#lang racket
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated  f n)
  (define (iter func-rep i)
    (if (= i n)
        func-rep
        (iter (compose f func-rep) (+ i 1))))
  (iter f 1))