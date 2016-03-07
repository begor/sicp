#lang racket
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (atom? x)
  (or (not (pair? x))
      (null? (cdr x))))

(define (type? x op)
  (and (pair? x) (eq? (type x) op)))

(define (type x)
  (define (type-high type)
    (cond ((eq? type '+) 3)
          ((eq? type '*) 2)
          ((eq? type '**) 1)
          (else 0)))
  (define (iter-type-guess x highest-op)
    (if (or (atom? x)
            (null? (cdr x)))
        highest-op
        (if (> (type-high (cadr x)) (type-high highest-op))
            (iter-type-guess (cddr x) (cadr x))
            (iter-type-guess (cddr x) highest-op))))
  (iter-type-guess x 0))

(define (sum? x)
  (type? x '+))

(define (product? x)
  (type? x '*))

(define (exponentiation? x)
  (type? x '**))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (make-exponentiation b e)
  (cond ((=number? b 1) 1)
        ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list b '** e))))

(define (get-first s op)
  (let ([first ((lambda (s) (if (eq? (cadr s) op)
                                (list (car s))
                                (append (list (car s)) (get-first (cdr s) op)))) s)])
    (if (null? (cdr first))
        (car first)
        first)))

(define (get-second exp op)
  (let ([second ((lambda (exp) (if (eq? (cadr exp) op)
                                   (cddr exp)
                                   (get-second (cdr exp) op))) exp)])
    (if (and (atom? second) (not (number? second)))
        (car second)
        second)))

(define (addend s) (get-first s '+))
 
(define (augend s) (get-second s '+))

(define (multiplier p) (get-first p '*))

(define (multiplicand p) (get-second p '*))

(define (base exp) (get-first exp '**))

(define (exponent exp) (get-second exp '**))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-product (exponent exp)
                                     (make-exponentiation (base exp)
                                                          (- (exponent exp) 1)))
                       (deriv (base exp) var)))
        (else
         (error "неизвестный тип выражения" exp))))

(define a '(x ** 3 + x ** 2))

(provide deriv)