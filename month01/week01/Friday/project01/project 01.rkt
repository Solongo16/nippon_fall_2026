;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Функцийн нэр: rectangle-area
 ; Оролт: width, height
 ; Гаралт: area
 ; Томьёо: width × height
(define (rectangle-area width height)
  (* width height))

(rectangle-area 9 5)  ; Хүлээсэн үр дүн: 45

; Функцийн нэр: rectangle-perimeter
 ; Оролт: a, b
 ; Гаралт: preimeter
 ; Томьёо: 2 * (a + b)

(define (rectangle-perimeter a b)
  (* 2(+ a b)))

(rectangle-perimeter 9 5)  ; Хүлээсэн үр дүн: 28

; Функцийн нэр: square-area
 ; Оролт: c
 ; Гаралт: square-area
 ; Томьёо: c * c

(define (square-area c)
  (* c c))

(square-area 6)  ; Хүлээсэн үр дүн: 36

; Функцийн нэр: minutes-to-seconds
 ; Оролт: minutes
 ; Гаралт: seconds
 ; Томьёо: minutes * 60

(define (minutes-to-seconds minutes)
  (* 60 minutes))

(minutes-to-seconds 60)  ; Хүлээсэн үр дүн: 3600


; Функцийн нэр: min-to-seconds
 ; Оролт: min
 ; Гаралт: seconds
 ; Томьёо: minutes * 60

(define (min-to-seconds min)
  (* 60 min))

(min-to-seconds 60)  ; Хүлээсэн үр дүн: 3600

; Функцийн нэр: hours-to-minutes
 ; Оролт: hours
 ; Гаралт: minutes
 ; Томьёо: hours * 60

(define (hours-to-minutes hours)
  (* 60 hours))

(hours-to-minutes 8)  ; Хүлээсэн үр дүн: 480

; Функцийн нэр: celsius-to-fahrenheit
 ; Оролт: celcuis
 ; Гаралт: fahrenheit
 ; Томьёо: (C * 9/5) +32

(define (celsius-to-fahrenheit C)
  (+ 32(/ (* 9 C) 5)))

(celsius-to-fahrenheit 2)  ; Хүлээсэн үр дүн: 35.6

; Функцийн нэр: kilometers-to-meters
 ; Оролт: kilometers
 ; Гаралт: meters
 ; Томьёо: meters * 1000

(define (kilometers-to-meters meters)
  (* 1000 meters))

(kilometers-to-meters 8)  ; Хүлээсэн үр дүн: 8000


