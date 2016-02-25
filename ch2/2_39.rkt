#lang racket
(require "2_38.rkt")
(define (reverse sequence)
  (if (null? sequence)
      sequence
      (append (reverse (cdr sequence))
            (list (car sequence)))))

(define (reverse-fr sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(define (reverse-fl sequence)
  (fold-left (lambda (x y) (append (list y) x)) null sequence))

(define x (list 1 2 3 4 5))

(provide reverse
         reverse-fr
         reverse-fl)

