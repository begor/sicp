#lang racket
;;We should replace every "simple" operation with generic one
;;and define some new operations (sine, cosine)
(define (install-complex-package)
  ;;Replacing simple operations (+, -, *, /)
  ;;with their generic realisations (add, sub, mul, div)
  (define (add-complex z1 z2)
    (make-from-real-imag (add (real-part z1) (real-part z2))
                         (add (imag-part z1) (imag-part z2))))
  (define (sub-complex z1 z2)
    (make-from-real-imag (sub (real-part z1) (real-part z2))
                         (sub (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2)
    (make-from-mag-ang (mul (magnitude z1) (magnitude z2))
                       (add (angle z1) (angle z2))))
  (define (div-complex z1 z2)
    (make-from-mag-ang (div (magnitude z1) (magnitude z2))
                       (sub (angle z1) (angle z2))))
  
  (define (tag z) (attach-tag ’complex z))
  (put ’add ’(complex complex)
       (lambda (z1 z2) (tag (add-complex z1 z2))))
  (put ’sub ’(complex complex)
       (lambda (z1 z2) (tag (sub-complex z1 z2))))
  (put ’mul ’(complex complex)
       (lambda (z1 z2) (tag (mul-complex z1 z2))))
  (put ’div ’(complex complex)
       (lambda (z1 z2) (tag (div-complex z1 z2))))
  (put ’make-from-real-imag ’complex
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put ’make-from-mag-ang ’complex
       (lambda (r a) (tag (make-from-mag-ang r a))))
  ’done)


;;...in rectangular-package 
(define (magnitude z) 
  (sqrt (add (square (real-part z)) 
             (square (imag-part z)))))
(define (make-from-mag-ang r a) 
  (cons (mul r (cosine a)) (mul r (sine a))))

;;...in polar package
(define (real-part z) 
  (mul (magnitude z) (cosine (angle z)))) 
(define (imag-part z) 
  (mul (magnitude z) (sine (angle z)))) 
(define (make-from-real-imag x y) 
  (cons (sqrt (add (square x) (square y))) 
        (arctan y x)))


;;New generic operations
(define (square x) 
  (mul x x)) 
(define (average x y) 
  (div (add x y) 2.0)) 
(define (sqrt x) 
  (fixed-point (average-damp (lambda (y) (div x y))) 
               1.0))
(define (sine x) (apply-generic 'sine x)) 
(define (cosine x) (apply-generic 'cosine x)) 
(define (arctan x) (apply-generic 'arctan x))