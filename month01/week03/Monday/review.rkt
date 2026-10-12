;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (average3 a b c)
  (/ (+ a b c) 3))
;; curved-average : Number Number Number -> Number
(define (curved-average a b c)
  (+ (average3 a b c) 5))
;; гурван онооны дундаж дээр 5 оноо нэмнэ. Даваагийн average3-г дууд.
(check-expect (curved-average 60 70 80) 75)
(check-expect (curved-average 0 0 0) 5)

;; honor-student? : Number Number -> Boolean
(define (honor-student? average attendance)
  (and (>= average 90)
       (>= attendance 90)))
;; дундаж 90 ба түүнээс дээш, ирц 90 ба түүнээс дээш бол #t
(check-expect (honor-student? 90 90) #t)
(check-expect (honor-student? 89 100) #f)
(check-expect (honor-student? 100 89) #f)

;; status-light : Number -> Image
(require 2htdp/image)
(define (status-light a)
  (circle 15 "solid"
  (cond
    [(>= a 80) "green"]
    [(>= a 60) "yellow"]
    [else "red"])))
;; оноо 80+ ногоон, 60–79 шар, бусад улаан тойрог (радиус 15). (require 2htdp/image) мартаж болохгүй.
(check-expect (status-light 80) (circle 15 "solid" "green"))
(check-expect (status-light 79) (circle 15 "solid" "yellow"))
(check-expect (status-light 60) (circle 15 "solid" "yellow"))
(check-expect (status-light 59) (circle 15 "solid" "red"))