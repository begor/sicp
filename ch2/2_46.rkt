#lang racket
(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (let ([x (+ (xcor-vect v1)
              (xcor-vect v2))]
        [y (+ (ycor-vect v1)
              (ycor-vect v2))])
    (make-vect x y)))

(define (sub-vect v1 v2)
  (let ([x (- (xcor-vect v1)
              (xcor-vect v2))]
        [y (- (ycor-vect v1)
              (ycor-vect v2))])
    (make-vect x y)))

(define (scale-vect s v1)
  (let ([x (* (xcor-vect v1) s)]
        [y (* (ycor-vect v1) s)])
    (make-vect x y)))

(provide make-vect
         xcor-vect
         ycor-vect
         add-vect
         sub-vect
         scale-vect)