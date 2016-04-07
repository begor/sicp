#lang racket
;;Is objects equal?
(define (equ? x y)
  (apply-generic 'equ? x y))

;;Downs object 
(define (project obj)
  (apply-generic 'project obj))

;;Raises object
(define (raise obj)
  (apply-generic 'raise obj))

;;...in complex package
(define (complex->real x)
  (make-real (real x)))
(put 'project '(complex) complex->real)

;;...in real package
(define (real->rat x) 
  (make-rat (numer x) (denom x))) 
(put 'project '(real) real->rat)

;;...in real package
(define (rat->int obj)
  (round obj))
(put 'project '(real) real->int)


;;Drops object in tower as low as it possible
(define (drop object)
  (let ([project (project object)])
    (if (eq? (raise project) object)
        (drop project)
        object)))

;;Make apply-generic simplify its results
;;by wrapping it's applying with drop
(drop (apply proc (map contents args)))