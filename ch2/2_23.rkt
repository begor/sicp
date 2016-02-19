#lang racket
(define (for-each items procedure)
  (cond ((not (null? items))
         (procedure (car items)) (for-each (cdr items) procedure))))

(for-each (list 57 321 88)
          (lambda (x) (newline) (display x)))