#lang racket
(define tolerance 0.001)

(define (fixed-point func first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (func guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))