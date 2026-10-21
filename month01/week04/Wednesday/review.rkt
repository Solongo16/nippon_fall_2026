;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; plain-average : Student -> Number
(define-struct student (name quiz project))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(define sora (make-student "sora" 60 60))
(define ren (make-student "ren" 45 55))
(define aki (make-student "aki" 80 90))
(define mina (make-student "mina" 95 91))

(define (plain-average s)
   (/ (+ (student-quiz s) (student-project s)) 2))
;; quiz ба project-ийн энгийн дундаж (жингүй)
(check-expect (plain-average aki) 85)
(check-expect (plain-average sora) 60)
(check-expect (plain-average (make-student "Zero" 0 0)) 0)


;;EX02
;; perfect-project? : Student -> Boolean
(define (perfect-project? s)
  (= (student-project s) 100))
;; project яг 100 бол #true
(check-expect (perfect-project? (make-student "Pat" 50 100)) #true)
(check-expect (perfect-project? aki) #false)
(check-expect (perfect-project? (make-student "Nan" 100 99)) #false)


;;EX03
;; grade-dot : Student -> Image
(define (passing? student)
  (>= (final-score student) 60))

(define (card-color student)
  (if (>= (final-score student) 60) "green"
      "red"))

(require 2htdp/image)
(define (grade-dot student)
  (circle 15 "solid" (card-color student)))
  
;; тэнцсэн бол ногоон, үгүй бол улаан тойрог (радиус 15). Мягмарын passing?-ийг дууд.
(check-expect (grade-dot aki) (circle 15 "solid" "green"))
(check-expect (grade-dot sora) (circle 15 "solid" "green"))
(check-expect (grade-dot ren) (circle 15 "solid" "red"))


