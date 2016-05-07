#lang r5rs
;; Implementing Tortoise and hare algorithm
;; https://en.wikipedia.org/wiki/Cycle_detection
(define (finite-list? l)
  (define (last-pair? x)
    (or (null? x) (null? (cdr x))))
  (define (find-loop x y)
    (cond ((or (null? x) (null? y)) #f)
          ((eq? (car x) (car y)) #t)
          ((last-pair? y) #f)
          (else (find-loop (cdr x) (cddr y)))))
  (if (last-pair? l)
      #f
      (not (find-loop l (cdr l)))))

(define finite (list 'a 'b 'c))

(define inf (list 'a 'b 'c))
(set-cdr! (cdr inf) inf)

;;tests
(define test (and (finite-list? finite)
                  (not (finite-list? inf))))