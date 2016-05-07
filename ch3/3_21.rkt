#lang r5rs
(define (front-ptr queue) (car queue))
(define (empty-queue? q)
  (null? (front-ptr q)))

(define (print-queue q)
  (if (empty-queue? q)
      "empty"
      (display (front-ptr q))))