#lang racket
(define (raise element)
  (apply-generic 'raise element))

(define (integer->rational x)
  (make-rat x 1))
(put 'raise '(integer) integer->rational)

(define (rational->real x) 
  (make-real (/ (numer x) (denom x)))) 
(put 'raise '(rational) rational->real)

(define (real->complex x) 
  (make-complex-from-real-imag x 0)) 
(put 'raise '(real) real->complex)