#lang racket
(require "2_67.rkt")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (in-branch? symbol branch)
    (not (false? (memq symbol (symbols branch)))))
  (define (encode acc tree)
    (if (leaf? tree)
        acc
        (let ([left (left-branch tree)]
              [right (right-branch tree)])
          (cond ((in-branch? symbol left)
                 (encode (append acc '(0)) left))
                ((in-branch? symbol right)
                 (encode (append acc '(1)) right))
                (else (error "Символа нет в дереве!" symbol))))))
  (encode '() tree))

(provide encode)
                       
        