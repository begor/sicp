#lang racket
(require math/number-theory)

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; generates a list consisting pairs of numbers 1 ≤ j < i ≤ n
(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

; using unique-pairs
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))


(provide prime-sum-pairs)