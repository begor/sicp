#lang racket
;;randomly small value for dx and tolerance
(define dx 0.001)
(define tolerance 0.001)

;;deriv procedure
;;returns lambda-function, which is derivative for a given function g
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

;;fixed-point procedure
;;finds fixed point for given function and initial guess
(define (fixed-point func first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (func guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;;newton-transform procedure
;;transforms given function g via newton's method
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

;;newtons-method procedure
;;finds such x, that g(x) = 0
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;;sqrt finder
(define (sqrt x)
  (let ((square (lambda (x) (* x x))))
  (newtons-method (lambda (y) (- (square y) x))
                  1.0)))