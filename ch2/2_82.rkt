#lang racket
(define (apply-generic op . args)
  (let* ([type-tags (map type-tag args)]
         [proc (get op type-tags)])
      (if proc
          (apply proc (map contents args))
          (apply-coercion op args type-tags))))

;; Try to coerce arguments to one of the types
;; starting by first one and proceed until it can coerce, or there are no more types.
(define (apply-coercion op args types)
  (if (null? types)
      (error "No more types to coerce")
      (let* ([current-type (car types)]
             [coerced-args (coerce-map args type)])
          (if coerced-args
              (apply-generic (cons op coerced-args))
              (apply-coercion op args (cdr types))))))

;;Coerce argument list to given type
;;If it is not possible, returns false
(define (coerce-map args type)
  (if (null? args)
      '()
      (let ([first (coerce-one (car args) type)]
            [rest (coerce-map (cdr args) type)])
        (if (and first rest)
            (cons first rest)
            #f))))

;;Coerce one argument to given type
;;If it is not possible, returns false
(define (coerce-one arg type)
  (if (eq? (type-tag arg) type)
      arg
      (if (get-coercion (type-tag arg) type)
          (get-coercion (type-tag arg) type)
          false)))