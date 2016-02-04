#lang racket
(define tolerance 0.001)

(define (average x y)
  (/ (+ x y)
     2))

(define (iterative-improve good? improve)
  (lambda (x)
    (define (iter guess)
      (if (good? guess)
          guess
          (iter (improve guess))))
    (iter x)))


;;rewritten sqrt procedure
(define (sqrt x)
  (define (good? guess)
    (< (abs (- (* guess guess) x)) tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good? improve) 1.0))

;;rewritten fixed-point procedure
(define (fixed-point func first-guess)
  (define (good? guess)
    (< (abs (- guess (func guess))) tolerance))
  (define (improve guess)
    (func guess))
  ((iterative-improve good? improve) first-guess))