#lang r5rs
(define finite-list?
  (let ((seen '()))
    (lambda (l)
      (cond ((null? l) #t)
            ((memq l seen) #f)
            (else (set! seen (cons l seen))
                  (finite-list? (cdr l)))))))

(define finite (list 'a 'b 'c))

(define inf (list 'a 'b 'c))
(set-cdr! (cdr inf) inf)

;;tests
(define test (and (finite-list? finite)
                  (not (finite-list? inf))))
