#lang racket
(require "2_56.rkt")

(define (atom-term? a)
  (null? (cdddr a)))

(define (atom-second-term a)
  (caddr a))

(define (get-second-term a op)
  (if (atom-term? a)
      (atom-second-term a)
      (cons op (cddr a))))
  
(define (augend a)
  (get-second-term a '+))

(define (multiplicand a)
  (get-second-term a '*))

(provide deriv
         augend
         multiplicand)