#lang racket
(define (map items procedure)
  (if (null? items)
      null
      (cons (procedure (car items)) (map (cdr items) procedure))))

(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map items (lambda (x) (* x x))))

(provide square-list
         square-list-map)