;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; 2026.10.23 Friday review
(define-struct student (name quiz project))

(define sora (make-student "Sora" 60 60))
(define ren (make-student "Ren" 45 55))
(define aki (make-student "Aki" 80 90))
(define mina (make-student "Mina" 95 91))
(define Zen (make-student "Zen" 60 60))
(define Ben (make-student "Ben" 70 70))

(define my-class (list aki sora mina ren
                      (make-student "Ben" 70 70)
                      (make-student "Zen" 60 60)))

(define students (list aki sora mina ren))

;;final-score?
(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)

(define (passing? student)
  (>= (final-score student) 60))

;; count-honor : List-of-students -> Number
(define (count-honor student)
  (cond
    [(empty? student) 0]
    [else (if
      (>= (final-score (first student)) 90)
          (+ 1 (count-honor (rest student)))
          (count-honor (rest student)))]))
;; эцсийн оноо 90+ сурагчийн тоо (Пүрэвийн honor? ашигла)
(check-expect (count-honor empty) 0)
(check-expect (count-honor students) 1)
(check-expect (count-honor (list mina (make-student "Nine" 90 90))) 2)


;; failing-names : List-of-students -> List-of-strings
(define (failing-names student)
  (cond
    [(empty? student) empty]
    [else (if
         (passing? (first student))
         (failing-names (rest student))
         (cons (student-name (first student)) (failing-names (rest student))))]))

;; тэнцээгүй сурагчдын нэр
(check-expect (failing-names empty) empty)
(check-expect (failing-names students) (list "Ren"))


;; tags-row : List-of-students -> Image
(require 2htdp/image)
(define (name-tag student)
  (text (student-name student) 20 "black"))

(define (tags-row student)
  (cond
    [(empty? student) empty-image]
    [else
      (beside (name-tag (first student)) (tags-row (rest student)))]))
;; Даваагийн name-tag-уудыг зэрэгцүүлнэ
(check-expect (tags-row empty) empty-image)
(check-expect (tags-row (list aki sora))
              (beside (name-tag aki) (name-tag sora)))

;;2A


(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]  
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))

 (define (student-grade student)
  (letter-grade (final-score student)))

;; count-grade : List-of-students String -> Number
(define (count-grade s grade)
  (cond
    [(empty? s) 0]
    [else (if 
      (string=? (student-grade (first s)) grade)
      (+ 1 (count-grade (rest s) grade))
      (count-grade (rest s) grade))]))

;; өгөгдсөн үсгэн үнэлгээтэй сурагчийн тоо (string=?)
(check-expect (count-grade empty "A") 0)
(check-expect (count-grade students "A") 1)
(check-expect (count-grade students "F") 1)
(check-expect (count-grade students "C") 0)

;; report-row : Student -> Image
(define (report-row student)
  (beside (text "Aki" 14 "black") (rectangle (* 2 (final-score student)) 16 "solid" "green")))
;; нэр (14, хар), хажууд нь урт = 2 × эцсийн оноо, өндөр 16 багана (card-color)
(check-expect (report-row aki)
              (beside (text "Aki" 14 "black") (rectangle 172 16 "solid" "green")))

;; report-chart : List-of-students -> Image
(define (report-chart s)
  (cond
    [(empty? s) empty-image]
    [else
      (above/align "left" (report-row (first s)) (report-chart (rest s)))])) 
;; мөрүүдийг доош нь, зүүн тийш тэгшилж байрлуулна (above/align "left" ...)
(check-expect (report-chart empty) empty-image)
(check-expect (report-chart (list aki ren))
              (above/align "left" (report-row aki) (report-row ren)))