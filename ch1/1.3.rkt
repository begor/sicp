#lang racket
(define (sqr-two-big a b c)
  (+ (square (max a b))
     (square (max b c))))

(define (square x)
  (* x x))

(define (max a b)
  (if (> a b)
      a
      b))