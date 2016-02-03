#lang racket
;;sqrt procedure
;;computes sqrt for given argument via fixed-point algorithm and average damping
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 
               1.0))

;;tolerance for computing fixed points
(define tolerance 0.001)

;;simple average procedure
(define (average x y)
  (/ (+ x y) 2))

;;fixed-point procedure
;;finds fixed point for given function and initial guess
(define (fixed-point f guess)
  (if (< (abs (- (f guess) guess)) tolerance)
      guess
      (fixed-point f (f guess))))

;;average-damp procedure
;;returns lambda-function, which is average damp for given function
(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

