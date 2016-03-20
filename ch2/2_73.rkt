#lang racket
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get ’deriv (operator exp)) (operands exp)
                                           var))))

;; Package consists of deriv operations for +, * and ** expressions.
(define (install-sum-product-epx-package)
  (define (=number? exp num)
    (and (number? exp) (= exp num)))
  
  (define (first s) (cadr s))
  
  (define (second s) (caddr s))

  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  
  (define (deriv-sum exp var)
    (make-sum (deriv (first exp) var)
              (deriv (second exp) var)))

  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))

  (define (deriv-product exp var)
    (make-sum
     (make-product (first exp)
                   (deriv (second exp) var))
     (make-product (deriv (first exp) var)
                   (second exp))))

  (define (make-exponentiation b e)
  (cond ((=number? b 1) 1)
        ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list '** b e))))

  (define (deriv-exp exp var)
    (make-product (make-product (second exp)
                                (make-exponentiation (first exp)
                                                     (- (second exp) 1)))
                  (deriv (first exp) var)))

  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  (put 'deriv '** deriv-exp)
  'done)

    