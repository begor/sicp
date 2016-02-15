#lang racket
(require "2_7.rkt")

(define (make-center-percent c p)
  (define (percent a b)
    (/ (* a b) 100))
  (let ([percent (percent c p)])
    (make-interval (- c percent) (+ c percent))))

(define (percent int)
  (abs (* (/ (- (upper-bound int) (lower-bound int))
             (+ (upper-bound int) (lower-bound int)))
          100)))

(provide make-center-percent
         percent)