#lang racket
(require "2_68.rkt"
         "2_69.rkt")

(define tree (generate-huffman-tree '((A 2) (BOOM 1) (GET 2) (JOB 2) 
                           (NA 16) (SHA 3) (YIP 9) (WAH 1))))

(define encoded (encode '(GET A JOB 
                              SHA NA NA NA NA NA NA NA NA 
                              GET A JOB 
                              SHA NA NA NA NA NA NA NA NA 
                              WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP 
                              SHA BOOM) 
                        tree))