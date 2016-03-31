#lang racket
(require "2_7.rkt")

; There are three main cases:
; 1) all interval is less than 0
; 2) all interval is greated than 0
; 3) interval spans 0
; Each of these cases yields another three cases.
(define (mul-interval-opt x y) 
    (let ((low-x (lower-bound x)) 
          (up-x (upper-bound x)) 
          (low-y (lower-bound y)) 
          (up-y (upper-bound y))) 
      (cond ((>= low-x 0) 
             (cond ((>= low-y 0) 
                    (make-interval (* low-x low-y) (* up-x up-y))) 
                   ((<= up-y 0) 
                    (make-interval (* up-x low-y) (* low-x up-y))) 
                   (else 
                    (make-interval (* up-x low-y) (* up-x up-y))))) 
            ((<= up-x 0) 
             (cond ((>= low-y 0) 
                    (make-interval (* low-x up-y) (* up-x low-y))) 
                   ((<= up-y 0) 
                    (make-interval (* up-x up-y) (* low-x low-y))) 
                   (else 
                    (make-interval (* low-x up-y) (* low-x low-y))))) 
            (else 
             (cond ((>= low-y 0) 
                    (make-interval (* low-x up-y) (* up-x up-y))) 
                   ((<= up-y 0) 
                    (make-interval (* up-x low-y) (* low-x low-y))) 
                   (else 
                    (make-interval (min (* low-x up-y) (* up-x low-y)) 
                                   (max (* low-x low-y) (* up-x up-y)))))))))

(provide mul-interval-opt)