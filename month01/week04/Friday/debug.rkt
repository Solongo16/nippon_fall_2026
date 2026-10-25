;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct student (name quiz project))

(define sora (make-student "Sora" 60 60))
(define ren (make-student "Ren" 45 55))
(define aki (make-student "Aki" 80 90))
(define mina (make-student "Mina" 95 91))
(define zen (make-student "Zen" 60 60))
(define ben (make-student "Ben" 70 70))

(define my-class (list aki sora mina ren
                      (make-student "Ben" 70 70)
                      (make-student "Zen" 60 60)))

(define students (list aki sora mina ren zen))

(define (card-color student)
  (if (>= (final-score student) 60) "green"
      "red"))

;;final-score?
(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score zen) 60)

(define (count-students l)
   (cond [(empty? l) 0] 
        [else (+ 1 (count-students (rest l)))]))
;;passing?
(define (passing? student)
  (>= (final-score student) 60))

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

;; 1
(define (total-final t)
  (cond
      [(empty? t) 0]
      [else
        (+ (final-score (first t))
           (total-final (rest t)))]))

(define (average-final l)
   (/ (total-final l) (count-students l))) 
(check-expect (average-final students) 69.92)  

;; 2
(define (failing-students l)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
                  (failing-students (rest l))
                  (cons (first l) (failing-students (rest l))))]))
                 
(check-expect (failing-students students) (list ren))

;; 3
(require 2htdp/image)
(define (report-row s)
  (cond
    [(empty? s) 0] 
    [else
  (beside (text (student-name s) 14 "black")
          (rectangle (* 2 (final-score s)) 16 "solid" (card-color s)))]))
(check-expect (report-row aki)
              (beside (text "Aki" 14 "black") (rectangle 172 16 "solid" "green")))


;; 4
(define (count-grade l g)
  (cond [(empty? l) 0]
        [else (if (string=? (student-grade (first l)) g)
                  (+ 1 (count-grade (rest l) g))
                  (count-grade (rest l) g))]))
(check-expect (count-grade students "A") 1)