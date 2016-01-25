#lang racket
;;; (= (* f f) (+ f 1)) => fixed-point x = 1 + 1/x
(define (golden-ratio x)
  (+ 1 (/ 1 x)))

(define tolerance 0.0001)

(define (fixed-point func first-guess)
  (define (good? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try-guess guess)
    (let ((next (func guess)))
      (if (good? guess next)
          guess
          (try-guess next))))
  (try-guess first-guess))

