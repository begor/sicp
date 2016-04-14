#lang racket
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))


(define (estimate-integral predicate x1 y1 x2 y2 attempts)
  (define (random-in-range low high) 
    (let ((range (- high low))) 
      (+ low (* (random) range))))
  (define (square x1 x2 y1 y2)
    (* (- x2 x1) (- y2 y1)))
  (* (square x1 x2 y1 y2)
     (monte-carlo attempts (lambda () (predicate (random-in-range x1 x2) (random-in-range y1 y2))))))

(define (in-unit-disk? x y)
  (< (+ (* x x) (* y y))
     1))


(provide estimate-integral
         in-unit-disk?)