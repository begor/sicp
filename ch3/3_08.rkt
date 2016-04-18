#lang racket
(define counter 0)

(define (f x)
  (set! counter (+ counter 1))
  (if (even? counter)
      0
      x))

(provide counter
         f)
