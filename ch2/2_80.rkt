#lang racket
(define (=zero? x) (apply-generic '=zero? x))

(define (install-scheme-number-package)
  ;; Other operations...
  
  (put '=zero? ’(scheme-number) (lambda (x) (= x 0))))

(define (install-rational-package)
  ;; Other operations...
  
  (put '=zero? ’(rational) (lambda (x) (= (numer x) 0))))


(define (install-complex-package)
  ;; Other operations...
  
  (put 'equ? ’(complex) (lambda (x) (and (= (real-part x) 0)
                                         (= (imag-part x) 0)))))
