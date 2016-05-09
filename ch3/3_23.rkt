#lang r5rs
;; We can define deque as a double-linked list
;; so every node in deque will be a list in following format
;; (element (previous-element next-element))
(define (make-deque)
  (cons '() '()))


(define (print-deque dq)
  (define (collect-nodes dq)
    (if (null? dq)
        '()
        (cons (car dq)
              (collect-nodes (cadr dq)))))
  (if (empty-deque? dq)
      (display '())
      (display (collect-nodes (front-deque dq)))))


(define (empty-deque? dq)
  (and (null? (front-deque dq))
       (null? (rear-deque dq))))


(define (front-deque dq)
  (car dq))


(define (set-front! dq el)
  (set-car! dq el))

(define (rear-deque dq)
  (cdr dq))


(define (set-rear! dq el)
  (set-cdr! dq el))


(define (front-insert! dq el)
  (let ((new-element (cons el (cons '() '()))))
    (cond ((empty-deque? dq)
           (set-front! dq new-element)
           (set-rear! dq new-element)
           dq)
          (else
           (let ((last (front-deque dq)))
             (set-cdr! (cdr last) new-element)
             (set-car! (cdr new-element) last)
             (set-front! dq new-element))
           dq))))

(define (front-delete! dq)
  (let ((last (front-deque dq)))
    (let ((previous (cadr last)))
      (set-front! dq previous)
      (set-cdr! (cdr previous) '())
      dq)))


(define (rear-insert! dq el)
  (let ((new-element (cons el (cons '() '()))))
    (cond ((empty-deque? dq)
           (set-front! dq new-element)
           (set-rear! dq new-element)
           dq)
          (else
           (let ((last (rear-deque dq)))
             (set-cdr! (cdr last) new-element)
             (set-car! (cdr new-element) last)
             (set-rear! dq new-element))
           dq))))

;;
(define d (make-deque))