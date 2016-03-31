#lang racket
(require "2_7.rkt")

(define (div-interval x y)
  (let ([y-lower (lower-bound y)]
        [y-upper (upper-bound y)])
    (if (> (* y-lower y-upper) 0)
        (mul-interval x
                      (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y))))
        (error "interval y crosses zero"))))

(provide div-interval)