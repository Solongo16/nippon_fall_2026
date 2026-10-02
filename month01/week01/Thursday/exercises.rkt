;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercises) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Exercise1  
;(+ 7 5)
;(- 14 6)
;(* 4 6)
;(/ 20 5)
;(+ 9 6)
;(* 8 3)
;(* 4 (+ 5 3))
;(+ 3 (- 12 4))
;(+ 2 (/ 18 3))
;(* 2 (+ 7 5))
;(+ 7 (* 3 4))
;(* (+ 4 5) 3)
;(- 20 (* 2 6))
;(+ (* 2 5) (- 12 4))
(+ 6 (* 3 (- 10 4)))

;(define price 5000)
;(* price 2)

(define quantity 4)
(define price 3000)
(* price quantity)

(define salary 2000000)
(define bonus 500000)
(+ salary bonus)

(define width 8)
(define height 5)
(* width height)

(define (double x)
  (* 2 x))
(double 7)

(define (triple x)
  (* 3 x))
(triple 6)

(define (add-five x)
  (+ 5 x))
(add five 8)

(define (minutes-to-seconds minutes)
  (* 60 minutes))
(minutes-to-seconds 5)

(define (rectangle-area width height)
  (* width height))
(rectangle-area 6 4)

(define (rectangle-perimeter width height)
  (* 2 (+ width height)))
(rectangle-width 5 3)

 (define (total-price price quantity)
  (* price quantity))
 (total-price 2500 4)

(define (average-two a b)
  (/ (+ a b) 2))
  (average-two 10 20)

  (define (difference a b)
    (- a b))
  (difference 15 6)

  (define (rectangle-area width height)
  (* width height))
  (rectangle-area 7 4)

(define (total-cost price quantity discount)
  (- (* price quantity) discount))
 (total-cost 3000 4 2000)