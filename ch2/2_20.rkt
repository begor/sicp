#lang racket
(define (same-parity first . others)
  (define (same-parity? x y)
    (equal? (even? x) (even? y)))
  (define (iter-result result others)
    (if (null? others)
        (cons first result)
        (let ([car (car others)]
              [cdr (cdr others)])
          (if (same-parity? car first)
              (iter-result (append result (list car)) cdr)
              (iter-result result cdr)))))
  (iter-result null others))

(provide same-parity)