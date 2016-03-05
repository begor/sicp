#lang racket
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
        ((exponential? exp)
         (make-product (exponent exp)
                       (make-product
                        (make-exponential (base exp) (- (exponent exp) 1))
                        (deriv (base exp) var))))
        (else
         (error "неизвестный тип выражения -- DERIV" exp))))

;; Type checking
(define (variable? x) (symbol? x))

(define (=number? a x)
  (and (number? a)
       (= a x)))

(define (same-variable? x y)
  (and (variable? x)
       (variable? y)
       (eq? x y)))

(define (sum? a)
  (and (pair? a)
       (eq? '+ (car a))))

(define (product? a)
  (and (pair? a)
       (eq? '* (car a))))

(define (exponential? a)
  (eq? '** (car a)))


;; Constructors
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product a1 a2)
  (cond ((or (=number? a1 0) (=number? a2 0)) 0)
        ((=number? a1 1) a2)
        ((=number? a2 1) a1)
        ((and (number? a1) (number? a2)) (* a1 a2))
        (else (list '* a1 a2))))

(define (make-exponential base exponent)
  (cond ((or (=number? exponent 0) (=number? base 1)) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))


;; Selectors
(define (addend a)
  (cadr a))

(define (augend a)
  (caddr a))

(define (multiplier a)
  (cadr a))

(define (multiplicand a)
  (caddr a))

(define (exponent a)
  (caddr a))

(define (base a)
  (cadr a))