#lang racket
(require "2_63.rkt"
         "2_64.rkt")

(define (key record) (car record))
(define (value record) (cdr record))
(define (make-record key value) (cons key value))

(define (lookup database given-key)
  (cond ((null? database) #f)
        ((= given-key (key (entry database)))
         (value (entry database)))
        ((< given-key (key (entry database)))
         (lookup (left-branch database) given-key))
        (else
         (lookup (right-branch database) given-key))))

(provide make-record
         lookup)
