#lang racket

(define (make-segment x y)
  (cons x y))


(define (start-segment l)
  (car l))


(define (end-segment l)
  (cdr l))


(define (make-point x y)
  (cons x y))


(define (x-point p)
  (car p))


(define (y-point p)
  (cdr p))


; finds midpoint for given segment
(define (midpoint-segment l)
  (let ([start-x (x-point (start-segment l))]
        [end-x (x-point (end-segment l))]
        [start-y (y-point (start-segment l))]
        [end-y (y-point (end-segment l))])
    (make-point (/ (+ start-x end-x) 2) (/ (+ start-y end-y) 2))))


(provide make-segment
         make-point
         x-point
         y-point
         midpoint-segment)