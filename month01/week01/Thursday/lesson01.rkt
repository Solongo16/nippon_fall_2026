;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Thursday (2026-10-01) -- comment ( setgegdel)
; values -- utga
5
-6
1.6
"Hello World"
true

; arithmetic operation

(+ 3 4)
(- 10 6)
(* 5 8)
(/ 20 4)
(- 1 2 3)

; nested expression
(+ (* 2 3) 4)

; (* 2 3 -> syntax error

; (*4) -> sign operator operand

; (+2 "3") -> too + useg bolohgui

; define todorhoiloh - keyword buyu tulhuur ug

(define age 19)
age ; variable (utganii ner)

(define name "Solongo")
(define job "Economist")
name ; call (usage)
job

(define width 4)
(define height 5)
(+ height width)
(* height width)

(define price 100)
(define quantity 3)
(* price quantity)

  (define salary 1500)
  (define bonus 300)
  (+ 1500 300)

;; Functions
;; square gedeg funkts todorhoiloh
;; x - iig funktsiin parameter -> Input
;; FUNCTION PROCESS -> (* x x)
(define (square x) 
  (* x x))
;output
(square 9)

;; double gedeg nertei neg parameter avaad tuunii utgiig double-dag funkts bichne uu

(define (double x)
  (* 2 x))
  (double 4)  ; 4-> argument
  (double 8)
  (double -35)

(define (triple x)
  (* 3 x))
  (triple 25)
  (triple 3)

(define (add-ten x)
  (+ 10 x))
  (add-ten 125)
  (add-ten 1550)

;; Multiple parameters
;; two parametered function

(define (calculate-area-rectangle width height)
   (* width height))
(calculate-area-rectangle 5 10)

;; perimeter
(define (calculate-area-perimeter a b)
   (* 2 (+ a b)))
  
(calculate-area-perimeter 3 10)

; calculate-circle-area gedeg funkts
; A = 3.14 * radius * radius
(define (calculate-circle-area radius)
   (* 3.14 radius radius))
  
(calculate-circle-area 11)


  


  
  



