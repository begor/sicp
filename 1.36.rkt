#lang racket
;; x**x == 1000 => fixed-point: x-> log(1000)/log(x)
;; without damping
(define (exp-x x)
  (/ (log 1000) (log x)))

;;with damping it takes > 0.5 * steps, takes without damping
(define (exp-x-d x)
  (* 0.5 (+ x (/ (log 1000) (log x)))))

(define tolerance 0.0001)

(define (fixed-point func first-guess)
  (define (good? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try-guess guess)
    (display guess)
    (newline)
    (let ((next (func guess)))
      (if (good? guess next)
          guess
          (try-guess next))))
  (try-guess first-guess))