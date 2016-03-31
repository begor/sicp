#lang racket
; Procedure that gets record data for a given employee in a given department
; Every department must have own get-record procedure in its package.
(define (get-record employee department)
  ((get 'get-record department) employee))

; Gets salary for a given employee in a given department
; First, we get record for a given employee via polymorphic get-record procedure
; and then aplly get-salary procedure from department's package to founded record of employee.
(define (get-salary employee department)
  ((get 'get-salary department) (get-record employee department)))

; Finds employee's record in departments list
; If there is no such employeein given departments - return false
(define (find-employee-record employee departments)
  (cond ((null? departments) #f)
        ((not (false? (get-record employee (car departments))
                      (get-record employee (car departments)))))
        (else (find-employee-record employee (cdr departments)))))