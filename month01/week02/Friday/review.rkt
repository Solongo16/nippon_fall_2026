;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; attendance-percent : Number Number -> Number
(define (attendance-percent done total)
  (* (/ done total) 100))
;; ирсэн өдөр, нийт өдөр (0-ээс их) → ирцийн хувь
(check-expect (attendance-percent 18 20) 90)
(check-expect (attendance-percent 0 20) 0)

;; can-retake? : Number Number -> Boolean
(define (can-retake? score attendance)
  (and (< score 60) (>= attendance 80)))
;; оноо 60-аас бага, ирц 80 ба түүнээс дээш бол #t
(check-expect (can-retake? 59 80) #t)
(check-expect (can-retake? 60 80) #f)
(check-expect (can-retake? 59 79) #f)

;; final-label : Number Number -> String

(define (final-label s1 s2)
  (cond
    [(and (>= s1 60) (>= s2 80)) "pass"]
    [(can-retake? s1 s2) "retake"]
    [else "fail"]))
    
;;   оноо >= 60 ба ирц >= 80   "pass"
;;   can-retake? үнэн бол         "retake"
;;   бусад                        "fail"
(check-expect (final-label 70 90) "pass")
(check-expect (final-label 50 85) "retake")
(check-expect (final-label 50 50) "fail")
(check-expect (final-label 70 50) "fail")

