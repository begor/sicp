#lang r5rs
;; We can define deque as a double-linked list
;; so every node in deque will be a list in following format
;; (element (previous-element next-element))
(define (make-element el)
  (cons el (cons '() '())))

(define (prev-element el)
  (cadr el))

(define (set-prev! el prev)
  (set-car! (cdr el) prev))

(define (next-element el)
  (cddr el))

(define (set-next! el next)
  (set-cdr! (cdr el) next))


;; Deque implementations
(define (make-deque)
  (cons '() '()))

(define (print-deque dq)
  (define (collect-nodes dq)
    (if (null? dq)
        '()
        (cons (car dq)
              (collect-nodes (cadr dq)))))
  (display (collect-nodes (front-deque dq))))

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
  (let ((new-element (make-element el)))
    (cond ((empty-deque? dq)
           (set-front! dq new-element)
           (set-rear! dq new-element)
           dq)
          (else
           (let ((last (front-deque dq)))
             (set-next! last new-element)
             (set-prev! new-element last)
             (set-front! dq new-element))
           dq))))

(define (front-delete! dq)
  (if (empty-deque? dq)
      (display "error delete from empty deque"))
  (let ((last (front-deque dq)))
    (let ((new (prev-element last)))
      (set-front! dq new)
      (cond ((null? new) (set-rear! dq new))
            (else (set-next! new '())
                  dq)))))


(define (rear-insert! dq el)
  (let ((new-element (make-element el)))
    (cond ((empty-deque? dq)
           (set-front! dq new-element)
           (set-rear! dq new-element)
           dq)
          (else
           (let ((last (rear-deque dq)))
             (set-prev! last new-element)
             (set-next! new-element last)
             (set-rear! dq new-element))
           dq))))

(define (rear-delete! dq)
  (if (empty-deque? dq)
      (display "error delete from empty deque"))
  (let ((last (rear-deque dq)))
    (let ((new (next-element last)))
      (set-rear! dq new)
      (cond ((null? new) (set-front! dq new))
            (else (set-prev! new '())
                  dq)))))

(define d (make-deque))
(front-insert! d 'a) (front-insert! d 'b) (front-insert! d 'c)
(rear-insert! d 'x) (rear-insert! d 'y) (rear-insert! d 'z)