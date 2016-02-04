#lang racket
(define dx 0.0001)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated  f n)
  (define (iter func-rep i)
    (if (= i n)
        func-rep
        (iter (compose f func-rep) (+ i 1))))
  (iter f 1))

;;smooth procedure
;;returns the function whose value at x is the average of f(x), f(x + dx), f(x - dx)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) 
                    (f x) 
                    (f (+ x dx))) 
                 3)))

;;n-smooth procedure
;;'smooths' given function n times using repeated procedure
(define (n-smooth f n)
  ((repeated smooth n) f))