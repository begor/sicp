#lang racket
(define (sqrt x)
  (define (good? guess old)
    (< (abs (- guess old)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average a b)
    (/ (+ a b) 2))
  (define (sqrt-iter guess old)
    (if (good? guess old)
        guess
        (sqrt-iter (improve guess) guess)))
  (sqrt-iter 1.0 0))