#lang racket
(require "2_40.rkt")

(define (queens board)
  (define (add-queen last-col)
    (filter
         (lambda (positions) (safe? last-col positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-queen-row)
                   (add-position new-queen-row last-col rest-of-queens))
                 (enumerate-interval 1 board)))
          (locate-queens-positions (- last-col 1)))))
  (define (locate-queens-positions last-col)
    (if (= last-col 0)
        (list '())
        (add-queen last-col)))

  (locate-queens-positions board))


(define (add-position row col rest)
  (cons (cons row col) rest))

(define (safe? last positions)
  (null? (danger-positions last positions)))

(define (danger-positions last positions)
  (filter (lambda (pos)
            (or (= (car pos) (caar positions))
                (= (cdr pos) last)
                (= (abs (- (car pos) (caar positions)))
                   (abs (- (cdr pos) last)))))
          (cdr positions)))
            
(queens 4)

  