#lang racket
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; after apllying substitution model we can describe one and two in terms of lambda-functions
(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (print n)
  ((n (lambda (x) (+ x 1))) 0))

(define (plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(provide add-1
         zero
         one
         two
         plus
         print)