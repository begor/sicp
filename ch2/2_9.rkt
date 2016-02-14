#lang racket
(require "2_7.rkt"
         "2_8.rkt")

; radius of interval
(define (rad-interval a)
  (/ (- (upper-bound a) 
        (lower-bound a)) 
     2))

(provide rad-interval)