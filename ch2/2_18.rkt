#lang racket
(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items)) 
            (list (car items)))))

(provide reverse)