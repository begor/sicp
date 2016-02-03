#lang racket
(define (cont-frac n d k)
  (if (= k 0)
      (/ (n k) (d k))
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))