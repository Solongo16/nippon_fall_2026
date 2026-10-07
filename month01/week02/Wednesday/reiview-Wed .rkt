;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |reiview-Wed |) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; REVIEW 
;; exam-time? : Number -> Boolean
(define (exam-time? t)
  (and (>= t 9) (<= t 12)))
  
(check-expect (exam-time? 9) #t)
(check-expect (exam-time? 12) #t)
(check-expect (exam-time? 8) #f)
(check-expect (exam-time? 13) #f)

;; bonus-points : Number -> Number
(define (bonus-points point)
  (if (>= point 90)
      5
      0))
;; оноо 90 ба түүнээс дээш бол 5 нэмэлт оноо, үгүй бол 0
(check-expect (bonus-points 90) 5)
(check-expect (bonus-points 89) 0)

;; water-state : Number -> String
(define (water-state n)
  (cond
  [(>= n 100) "steam"]
  [(>= n 0) "water"]
  [else "ice"]))
          
;; 0-ээс бага "ice", 0–99 "water", 100 ба түүнээс дээш "steam"
(check-expect (water-state -1) "ice")
(check-expect (water-state 0) "water")
(check-expect (water-state 99) "water")
(check-expect (water-state 100) "steam")

