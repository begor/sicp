#lang racket
(require "2_1.rkt"
         "2_2.rkt")

;;constructors
; presentation of rectangle based on two oposite corners
(define (make-rectangle topleft bottomright)
  (cons topleft bottomright))

; alternative presentation of rectangle based on four corners
(define (make-rectangle-alt topleft height width)
  (let ([bottomright (make-point (+ (x-point topleft) width)
                                 (- (y-point topleft) height))])
    (cons topleft bottomright)))


;;selectors
; returns topleft corner of rectangle
(define (topleft rectangle)
  (car rectangle))

; returns topleft corner of rectangle
(define (bottomright rectangle)
  (cdr rectangle))


;;procedures
; returns height of rectangle
(define (height rectangle)     
  (- (y-point (topleft rectangle)) 
     (y-point (bottomright rectangle))))

; returns width of rectangle
(define (width rectangle)
  (- (x-point (bottomright rectangle)) 
     (x-point (topleft rectangle))))

; returns perimeter for a given rectangle
(define (rectangle-perimeter rectangle)
  (* 2 (+ (width rectangle) (height rectangle))))

; returns square for a given rectangle
(define (rectangle-square rectangle)
  (* (width rectangle) (height rectangle)))


(provide make-rectangle
         make-rectangle-alt
         rectangle-perimeter
         rectangle-square)

