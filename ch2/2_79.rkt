#lang racket
(define (equ? x y) (apply-generic 'equ? x y))

(define (install-scheme-number-package)
  ;; Other operations...
  
  (put 'equ? ’(scheme-number scheme-number) =))

(define (install-rational-package)
  ;; Other operations...
  
  (put 'equ? ’(rational rational)
       (lambda (x y) (= (* (numer x) (denom y))
                        (* (denom x) (numer y))))))


(define (install-complex-package)
  ;; Other operations...
  
  (put 'equ? ’(rational rational)
       (lambda (x y) (and (= (real-part x) (real-part y)
                             (imag-part x) (imag-part y))))))
