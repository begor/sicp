#lang racket
(require "2_61.rkt"
         "2_63.rkt"
         "2_64.rkt")

(define (union-set s1 s2)
  (define (union-list set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          ((= (car set1) (car set2))
           (cons (car set1) (union-list (cdr set1) (cdr set2))))
          ((< (car set1) (car set2))
           (cons (car set1) (union-list (cdr set1) set2)))
          (else (cons (car set2) (union-list set1 (cdr set2))))))
  (let ([s1-list (tree->list-1 s1)]
        [s2-list (tree->list-1 s2)])
    (let ([union (union-list s1-list s2-list)])
      (list->tree union))))

(define (intersection-set s1 s2)
  (define (intersection-list set1 set2)
    (if (or (null? set1) (null? set2))
        '()    
        (let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2) (cons x1 (intersection-list (cdr set1) (cdr set2))))
                ((< x1 x2) (intersection-list (cdr set1) set2))
                ((< x2 x1) (intersection-list set1 (cdr set2)))))))
  (let ([s1-list (tree->list-1 s1)]
        [s2-list (tree->list-1 s2)])
    (let ([intersection (intersection-list s1-list s2-list)])
      (list->tree intersection))))

(provide union-set
         list->tree
         intersection-set)
        