#lang racket
(require "2_33.rkt")

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (count-leaves-accumulate t)
  (accumulate +
              0 
              (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))

(provide count-leaves
         count-leaves-accumulate)