#lang racket
(require "2_7.rkt")

; interval substractions: [a,b] − [c,d] = [a − d, b − c]
(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
                 (- (upper-bound a) (lower-bound b))))

(provide sub-interval)
