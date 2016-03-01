#lang racket
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cddr frame))

(define a (make-frame 0 1 2))

(provide make-frame
         origin-frame
         edge1-frame
         edge2-frame)