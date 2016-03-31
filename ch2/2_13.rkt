#lang racket
(require "2_7.rkt"
         "2_12.rkt")

(define (percent-mul a b)
  (+ (percent a)
     (percent b)))

(provide percent-mul)