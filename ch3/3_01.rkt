#lang racket
(define (make-accumulator init)
  (let ([acc init])
    (lambda (x)
      (set! init (+ init x))
      init)))

(provide make-accumulator)