#lang racket
(require "3_03.rkt")

(define (make-joint account acc-password new-password)
  (define (joint-account password message)
    (if (not (eq? password new-password))
        "Wrong password"
        (account acc-password message)))
  joint-account)

(provide make-account
         make-joint)