;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;EX01
;; better-student : Student Student -> Student
(define-struct student (name quiz project))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(define aki (make-student "aki" 80 90))
(define mina (make-student "mina" 95 91))
(define sora (make-student "sora" 60 60))
(define ren (make-student "ren" 45 55))

(define (better-student s1 s2)
  (if
  (>= (final-score s1) (final-score s2))
  s1
  s2))

;; эцсийн оноо нь их сурагч; тэнцүү бол эхнийх
(check-expect (better-student aki mina) mina)
(check-expect (better-student mina aki) mina)
(check-expect (better-student sora (make-student "Tie" 60 60)) sora)

;;EX02
;; letter-grade : Number -> String
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))

;; student-grade : Student -> String
(define (student-grade student)
  (letter-grade (final-score student)))

;; same-grade? : Student Student -> Boolean
(define (same-grade? s1 s2)
   (string=? (student-grade s1) (student-grade s2)))
;; хоёулаа ижил үсгэн үнэлгээтэй бол #true. string=? ашигла.
(check-expect (same-grade? aki (make-student "Ben" 85 85)) #true)
(check-expect (same-grade? aki mina) #false)

;;EX03
;; points-to-pass : Student -> Number
(define (points-to-pass s)
  (max 0 (- 60 (final-score s))))
;; 60 хүрэхэд хэдэн оноо дутуу вэ; тэнцсэн бол 0
(check-expect (points-to-pass ren) 9)
(check-expect (points-to-pass sora) 0)
(check-expect (points-to-pass aki) 0)

