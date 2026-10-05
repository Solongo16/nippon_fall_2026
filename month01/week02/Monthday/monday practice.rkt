;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |monday practice|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(+ 3(* 4 5))
(/ (+ 8 4) 3)
(define (rectangle-area width height)
  (* width height))
(rectangle-area 4 5)

(define (rectangle-cost width height unit-cost)
  (* (rectangle-area width height) unit-cost))
(rectangle-cost 4 5 300)