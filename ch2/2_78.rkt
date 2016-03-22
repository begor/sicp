#lang racket
(define (attach-tag type-tag contents)
  (if (number? contents) 
      contents 
      (cons type-tag contents))) 

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) 'scheme-number)
        (else (error "Invalid data -- TYPE-TAG" datum))))


(define (contents datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) datum)
        (else (error "Invalid data -- CONTENTS" datum))))
