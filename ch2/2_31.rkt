#lang racket
(define (tree-map tree proc)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map (car tree) proc)
                    (tree-map (cdr tree) proc)))))


(provide tree-map)