;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct student (name quiz project))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(define aki (make-student "aki" 80 90))
(define mina (make-student "mina" 95 91))
(define sora (make-student "sora" 60 60))
(define ren (make-student "ren" 45 55))

;; 1
(define (better-student a b)
  (if (>= (final-score a) (final-score b)) a  
      b))                                           ;; (> -> >=)
(check-expect (better-student sora (make-student "Tie" 60 60)) sora)

;; 2
(define (points-to-pass s)
 (max 0 (- 60 (final-score s))))   ; max0 bichhiihee martsan 
(check-expect (points-to-pass aki) 0)

;; 3
(define (rename s new-name)
  (make-student new-name (student-quiz s) (student-project s)))  ;; quiz, project hoyriin bair soligdson
(check-expect (rename aki "Akira") (make-student "Akira" 80 90))

;; 4
(require 2htdp/image)
(define (score-label s)
  (text (number->string (final-score s)) 24 "black"))   ;;numberiig string bolgohiin tuld numer -> string
(check-expect (score-label sora) (text "60" 24 "black"))

;; 5
(define (perfect-project? s)
  (= (student-project s) 100))   ;; string bish uchi " " baihgui
(check-expect (perfect-project? aki) #false)
