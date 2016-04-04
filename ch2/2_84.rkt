#lang racket
(define (raise element)
  (apply-generic 'raise element))

(define (higher? a1 a2) 
  (let ([raise2 (raise a2)])
    (and raise2
         (or (eq? (type-tag a1) (type-tag a2))
             (higher? a1 raise2)))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let* ([type1 (car type-tags)]
                     [type2 (cadr type-tags)]
                     [a1 (car args)]
                     [a2 (cadr args)]
                     [raise1 (raise a1)]
                     [raise2 (raise a2)])
                (cond ((eq? type1 type2)
                       (if (and raise1 raise2)
                           (apply-generic op raise1 raise2)
                           (error "Нет метода для этих типов")))
                      ((higher? type1 type2) (apply-generic op a1 raise2))
                      ((higher? type2 type1) (apply-generic op raise1 a2))
                      (else "Нет метода для этих типов"))))))))