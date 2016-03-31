#lang racket
(define (reverse elements)
  (if (null? elements)
      null
      (append (reverse (cdr elements)) (list (car elements)))))

(define (deep-reverse elements)
  (if (null? elements)
      null
      (if (pair? (car elements))
          (append (deep-reverse (cdr elements)) (list (deep-reverse (car elements))))
          (append (deep-reverse (cdr elements)) (list (car elements))))))

(define x (list (list 1 2) (list 3 4)))

(provide reverse
         deep-reverse)