#lang racket
(require "2_31.rkt")

; subsets procedure
; generates subsets of a given set s
; first, it generates subsets for (cdr s) set
; then, it appends result of a previous step with the same result, that 'consed' with (car s) via map
(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))


(provide subsets)