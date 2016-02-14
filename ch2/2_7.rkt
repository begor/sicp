#lang racket
(define (make-interval a b)
  (cons a b))

; define selectors through min and max for safety
(define (lower-bound int)
  (min (car int) (cdr int)))

(define (upper-bound int)
  (max (car int) (cdr int)))

(provide make-interval
         lower-bound
         upper-bound)