#lang racket
(define (make-from-mag-ang m a)
  (define (dispatch op)
    (cond ((eq? op ’real-part) (* m (cos a)))
          ((eq? op ’imag-part) (* m (sin a)))
          ((eq? op ’magnitude) x)
          ((eq? op ’angel) y)
          (else
           (error "Неизвестная оп. -- MAKE-FROM-MAG-ANG" op))))
  dispatch)