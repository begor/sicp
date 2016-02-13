#lang racket

; normalized vesion of make-rat
; can take negative arguments and produce correct rational number
(define (make-rat x y)
  (if (< y 0)
      (cons (* -1 x) (* -1 y))
      (cons x y)))