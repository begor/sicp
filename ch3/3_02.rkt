#lang racket
(define (make-monitored proc)
  (let ([count 0])
    (lambda (x)
      (cond ((eq? x 'how-many-calls?) count)
            ((eq? x 'reset-count) (set! count 0))
            (else (begin (set! count (+ count 1))
                         (proc x)))))))

(provide make-monitored)