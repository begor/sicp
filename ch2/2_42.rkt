#lang racket
(require "2_40.rkt")

(define (queens board)
  (define (add-queen column)
    (flatmap
     (lambda (rest-of-queens)
       (map (lambda (new-queen-row)
              (add-position new-queen-row column rest-of-queens))
            (enumerate-interval 1 board)))
     (locate-queens-positions (- column 1))))
  (define (filter-safe last-col positions)
    (filter
     (lambda (positions) (safe? last-col positions))
     positions))
  (define (locate-queens-positions last-col)
    (if (= last-col 0)
        (list '())
        (filter-safe last-col
                     (add-queen last-col))))
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
            
(provide queens)

  