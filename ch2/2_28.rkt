#lang racket
(define (fringe elements)
  (if (null? elements)
      elements
      (if (pair? (car elements))
          (append (fringe (car elements)) (fringe (cdr elements)))
          (append (list (car elements)) (fringe (cdr elements))))))

(provide fringe)