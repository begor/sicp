#lang r5rs
(define count-pairs
  (let ((seen '()))
    (lambda (x)
      (cond ((not (pair? x)) 0)
            ((memq x seen) 0)
            (else (set! seen (cons x seen))
                  (+ (count-pairs (car x))
                     (count-pairs (cdr x))
                     1))))))

(define three (list 'a 'b 'c))

(define a '(a))
(define four (list a a))

(define seven (list 'c))
(define b (list 'b))
(define c (list 'a))
(set-car! b c)
(set-cdr! b c)
(set-car! seven b)
(set-cdr! seven b)

(define inf '(a b c))
(set-cdr! (cddr inf) inf)

;;tests
(define test
  (and (= (count-pairs three) 3)
       (= (count-pairs four) 3)
       (= (count-pairs seven) 3)
       (= (count-pairs inf) 3)))