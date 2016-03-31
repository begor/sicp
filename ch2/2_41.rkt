#lang racket
(require "2_40.rkt")

(define (threes n)
  (flatmap (lambda (i) 
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (sum-three-equal three s)
  (= (accumulate + 0 three) s))

(define (threes-sum-equal-s n s)
  (filter (lambda (three) (sum-three-equal three s)) (threes n)))

(provide threes-sum-equal-s)