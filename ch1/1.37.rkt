#lang racket
;;a) recursive solution
(define (cont-fract-recursive n d k)
  (if (= k 0)
      (/ (n k) (d k))
      (/ (n k) (+ (d k) (cont-fract-recursive n d (- k 1))))))

;;b) iterative solution
(define (cont-fract-iterative n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k 0))

;;golden-ratio counter
;;k must be at least 10 in order to approximate 1/ϕ to 4 decimal places.
(define (golden-ratio k)
  (cont-fract-recursive (lambda (i) 1.0)
                       (lambda (i) 1.0)
                       k))