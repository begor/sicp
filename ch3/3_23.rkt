#lang r5rs

(define (make-deque)
  (cons '() '()))


(define (print-deque dq)
  (display (front-deque dq)))


(define (empty-deque? dq)
  (null? (front-deque dq)))


(define (front-deque dq)
  (car dq))


(define (rear-deque dq)
  (cdr dq))


(define (front-insert! dq el)
  (let ((new-element (cons el '())))
    (cond ((empty-deque? dq)
           (set-car! dq new-element)
           (set-cdr! dq new-element)
           dq)
          (else
           (set-car! dq (cons el (front-deque dq)))
           dq))))

;;
(define d (make-deque))