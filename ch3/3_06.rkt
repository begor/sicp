#lang racket

;; wow such rand
(define rand-init 1)
(define (rand-update x) (+ x x))

(define rand
  (let ([x rand-init])
    (lambda (message)
      (cond ((eq? message 'generate)
             (set! x (rand-update x))
             x)
            ((eq? message 'reset)
             (lambda (new-value)
               (set! x new-value)
               x))
            (else "Error!")))))

(provide rand)