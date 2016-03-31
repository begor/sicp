#lang racket
(define (square x) 
  (* x x))

; directly defined square-tree procedure
(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                      (square-tree (cdr tree))))))

; square-tree defined with map and lambda function
(define (square-tree-m tree)
  (map (lambda (items)
         (if (pair? items) 
             (square-tree items)
             (square items)))
       tree))

; square-tree defind with tree-map
(define (square-tree-map tree)
  (tree-map tree square))

(define (tree-map tree proc)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map (car tree) proc)
                      (tree-map (cdr tree) proc)))))
      
(provide square-tree
         square-tree-m
         square-tree-map)