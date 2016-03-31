#lang racket
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (weight-branch branch)
  (let ([struct (branch-structure branch)])
    (if (not (pair? struct))
        struct
        (total-weight struct))))

(define (total-weight mobile)
  (+ (weight-branch (left-branch mobile))
     (weight-branch (right-branch mobile))))

(define (balanced? mobile)
  (define (branch-balanced? branch)
    (if (pair? (branch-structure branch))
             (balanced? (branch-structure branch))
             #t))
  (define (torque branch)
    (* (weight-branch branch)
       (branch-length branch)))
  (let ([left (left-branch mobile)]
        [right (right-branch mobile)])
    (and (= (torque left) (torque right))
         (branch-balanced? left)
         (branch-balanced? right))))

(provide make-branch
         make-mobile
         total-weight
         balanced?)

