#lang racket
;; Type checks
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

; If expression if the same operation as op?
(define (operation? exp op)
  (and (pair? exp)
       (eq? (operation exp) op)))

(define (sum? x)
  (operation? x '+))

(define (product? x)
  (operation? x '*))

(define (exponentiation? x)
  (operation? x '**))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

;;;;;;;;;;;;;;;;;;;;

;; Helper procedures

; Evaluates type of a given expression
; An operation with lowest priority in the expression is the 'type' of expression.
(define (operation expr)
  (cond ((memq '+ expr) '+)
        ((memq '* expr) '*)
        ((memq '** expr) '**)))

; Returns simple atom (car x) if (cdr x) is null
(define (return-atom-or-list x)
  (if (null? (cdr x))
      (car x)
      x))

;;;;;;;;;;;;;;;;;;;;

;; Constructors
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

;;;;;;;;;;;;;;;;;;;;

;; Selectors
; Gets the first term of expression with a given operation
(define (get-first-term expression operation)
  (define (find-first expression)
    (if (eq? (cadr expression) operation)
        (list (car expression))
        (append (list (car expression))
                (find-first (cdr expression)))))
  (let ([first (find-first expression)])
    (return-atom-or-list first)))

; Gets the second term of expression with a given operation
(define (get-second-term expression operation)
  (define (find-second expression)
    (if (eq? (cadr expression) operation)
        (cddr expression)
        (find-second (cdr expression))))
  (let ([second (find-second expression)])
    (return-atom-or-list second)))

(define (addend s) (get-first-term s '+))
 
(define (augend s) (get-second-term s '+))

(define (multiplier p) (get-first-term p '*))

(define (multiplicand p) (get-second-term p '*))

(define (base exp) (get-first-term exp '**))

(define (exponent exp) (get-second-term exp '**))

;;;;;;;;;;;;;;;;;;;;


; Main deriv procedure. Computes derivative of a given expression on a given variable.
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

(provide deriv)