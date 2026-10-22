;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;A
;; honor? : Student -> Boolean
;; Tuesday lesson
(define-struct student (name quiz project))

(define sora (make-student "sora" 60 60))
(define ren (make-student "ren" 45 55))
(define aki (make-student "aki" 80 90))
(define mina (make-student "mina" 95 91))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(define (honor? a)
  (>= (final-score a) 90))

;; эцсийн оноо 90 ба түүнээс дээш бол #true
(check-expect (honor? mina) #true)
(check-expect (honor? aki) #false)
(check-expect (honor? (make-student "Nine" 90 90)) #true)

;;B
(define (swap-scores s)
  (make-student
   (student-name s)
   (student-project s) (student-quiz s)))
  
;; swap-scores : Student -> Student
;; quiz ба project оноог сольсон шинэ сурагч
(check-expect (swap-scores aki) (make-student "aki" 90 80))
(check-expect (swap-scores sora) sora)

;;C
(require 2htdp/image)
(define (card-color student)
  (if (>= (final-score student) 60) "green"
      "red"))
(define (pass-label p)
  (text
   (if (>= (final-score p) 60) "PASS"
       "FAIL") 16
     (card-color p)))
;; pass-label : Student -> Image
;; тэнцсэн бол ногоон "PASS", үгүй бол улаан "FAIL" (16)
(check-expect (pass-label aki) (text "PASS" 16 "green"))
(check-expect (pass-label ren) (text "FAIL" 16 "red"))

