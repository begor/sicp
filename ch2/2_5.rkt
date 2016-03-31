#lang racket
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car a)
  (num-divs a 2))

(define (cdr b)
  (num-divs b 3))

;returns number of times n is equally diveded by d
(define (num-divs n d)
  (define (iter x result)
    (if (= 0 (remainder x d))
        (iter (/ x d) (+ 1 result))
        result))
  (iter n 0))