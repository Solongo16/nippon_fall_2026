;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; grade-color : Number -> String
(define (grade-color grade)
  (cond
    [(>= grade 90) "green"]
    [(>= grade 80) "blue"]
    [(>= grade 70) "gold"]
    [(>= grade 60) "orange"]
    [else "red"]))
;; grade-bar : Number -> Image
(define (grade-bar grade)
 (rectangle grade 20 "solid" (grade-color grade)))

;; өргөн нь оноо, өндөр 20, өнгө нь grade-color
(check-expect (grade-bar 95) (rectangle 95 20 "solid" "green"))
(check-expect (grade-bar 59) (rectangle 59 20 "solid" "red"))

;; grade-bars : List-of-numbers -> Image
(define (grade-bars g)
 (cond 
  [(empty? g) empty-image]
  [else
   (above (grade-bar (first g))
                     (grade-bars (rest g)))]))

;; оноо бүрийн grade-bar-ыг дээрээс доош
(check-expect (grade-bars empty) empty-image)
(check-expect (grade-bars (list 95 59)) (above (grade-bar 95) (grade-bar 59)))

;; Score-analyzer ooriin 2 list code:
;; count-passing : List-of-numbers -> Number
(define (count-passing s)
  (cond
    [(empty? s) 0]
    [else
     (if (>= (first s) 60)
     (+ 1 (count-passing (rest s)))
     (count-passing (rest s)))]))
          
;; 60 ба түүнээс дээш онооны тоо
(check-expect (count-passing (list 66 75 98 100 75)) 5)
(check-expect (count-passing (list 60 59)) 1)    ; хил
