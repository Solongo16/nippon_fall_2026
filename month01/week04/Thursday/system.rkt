;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

;;final-score?
(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score (make-student "Hundred" 100 0)) 40)
(check-expect (final-score Zen) 60)
(check-expect (final-score Ben) 70)

;;Dasgal ajil
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
;; эцсийн онооны үсгэн үнэлгээ
(check-expect (student-grade aki) "B")
(check-expect (student-grade sora) "D")
(check-expect (student-grade mina) "A")
(check-expect (student-grade ren) "F")
(check-expect (student-grade (make-student "Nine" 90 90)) "A")


;; add-bonus
(define (add-bonus student bonus)
  (make-student
  (student-name student)
  (student-quiz student)
  (min 100 (+ (student-project student) bonus))))
;; project оноонд bonus нэмнэ, гэхдээ 100-аас хэтрэхгүй (min ашигла)
(check-expect (add-bonus aki 5) (make-student "aki" 80 95))
(check-expect (add-bonus mina 20) (make-student "mina" 95 100))
(check-expect (add-bonus ren 0) ren)


;; retake-quiz : Student Number -> Student
(define (retake-quiz s new)
  (make-student (student-name s) (max new (student-quiz s))
                (student-project s)))
;; quiz-ийг дахин өгсөн: шинэ оноо их бол түүнийг, үгүй бол хуучныг үлдээнэ (max)
(check-expect (retake-quiz ren 70) (make-student "ren" 70 55))
(check-expect (retake-quiz aki 50) aki)

;;EX06A
;; card-color : Student -> String
(define (card-color student)
  (if (>= (final-score student) 60) "green"
      "red"))
      
;; тэнцсэн бол "green", үгүй бол "red"
(check-expect (card-color aki) "green")
(check-expect (card-color ren) "red")

;; student-card : Student -> Image
(require 2htdp/image)
(define (student-card s)
  (overlay (above
            (text (student-name s) 18 "black")
            (text (student-grade s) 24 (card-color s)))
                  (rectangle 120 70 "outline" (card-color s))))

;; нэр (18, хар), доор нь үсгэн үнэлгээ (24, card-color), card-color хүрээ (120 × 70)
(check-expect (student-card aki) 
              (overlay (above (text "aki" 18 "black") (text "B" 24 "green"))
                       (rectangle 120 70 "outline" "green")))
(check-expect (student-card ren)
              (overlay (above (text "ren" 18 "black") (text "F" 24 "red"))
                       (rectangle 120 70 "outline" "red")))

;;Wednesday
;;EX01
;; better-student : Student Student -> Student
(define (better-student s1 s2)
  (if
  (>= (final-score s1) (final-score s2))
  s1
  s2))
;; эцсийн оноо нь их сурагч; тэнцүү бол эхнийх
(check-expect (better-student aki mina) mina)
(check-expect (better-student mina aki) mina)
(check-expect (better-student sora (make-student "Tie" 60 60)) sora)

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

;;Thursday

  (define students (list aki sora mina ren))

;; count-passing : List-of-students -> Number
(define (count-passing student)
  (cond
    [(empty? student) 0]
    [else
     (if
      (>= (final-score (first student)) 60)
      (+ 1 (count-passing (rest student)))   
     (count-passing (rest student)))])) 
;; тэнцсэн сурагчийн тоо
(check-expect (count-passing empty) 0)
(check-expect (count-passing students) 3)
(check-expect (count-passing (list ren)) 0)
(check-expect (count-passing my-class) 5) 


;; C
(define (total-final t)
  (cond
      [(empty? t) 0]
      [else
        (+ (final-score (first t))
           (total-final (rest t)))]))
       
;; total-final : List-of-students -> Number
;; бүх сурагчийн эцсийн онооны нийлбэр
(check-expect (total-final empty) 0) 
(check-expect (total-final my-class) 416.6)

;;D
(define (count-students s)
  (cond
    [(empty? s) 0]
    [else
      (+ 1 (count-students (rest s)))]))
;; count-students : List-of-students -> Number
(check-expect (count-students empty) 0)
(check-expect (count-students students) 4)
(check-expect (count-students my-class) 6) 

;; EX4A
;; A
;; passing-students : List-of-students -> List-of-students
(define (passing-students s)
  (cond
    [(empty? s) empty]
    [else
     (if (>= (final-score (first s)) 60) 
          (cons
           (first s) (passing-students (rest s)))
          (passing-students (rest s)))]))   
;; зөвхөн тэнцсэн сурагчид
(check-expect (passing-students empty) empty)
(check-expect (passing-students students) (list aki sora mina))
(check-expect (passing-students (list ren aki)) (list aki))

;; B
;; names : List-of-students -> List-of-strings
(define (names n)
  (cond
  [(empty? n) empty]
    [else
     (cons
      (student-name (first n)) 
      (names (rest n)))]))
(check-expect (names empty) empty)
(check-expect (names students) (list "Aki" "Sora" "Mina" "Ren"))

;; grades of student
  (define (grades s)
  (cond
    [(empty? s) empty]
    [else
    (cons
   (student-grade (first s)) (grades (rest s)))]))
;; сурагч бүрийн үсгэн үнэлгээ
(check-expect (grades students) (list "B" "D" "A" "F"))


  ;; best-student : NEList-of-students -> Student
(define (best-student s)
  (cond
    [(empty? (rest s)) (first s)]
     [else
       (better-student (first s)
       (best-student (rest s)))]))
;; эцсийн оноо хамгийн их сурагч (тэнцүү бол түрүүлж байгаа нь)
(check-expect (best-student (list sora)) sora)
(check-expect (best-student students) mina)


;; B
;; average-final : NEList-of-students -> Number
(define (average-final a)
     (/ (total-final a) (count-students a)))
;; эцсийн онооны дундаж: total-final ба count-students-ийг дууд
(check-expect (average-final (list aki)) 86)
(check-expect (average-final my-class) 69.4)

;; C
(define (top-name s)
  (student-name (best-student s)))
;; top-name : NEList-of-students -> String
(check-expect (top-name students) "Mina")


;;failing-students
(define (failing-students s)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
           (failing-students (rest l)) (cons (first l) (failing-students (rest l))))]))
;; failing-students : List-of-students -> List-of-students
(check-expect (failing-students empty) empty)
(check-expect (failing-students students) (list ren))

;; count-failing : List-of-students -> Number

(define (count-failing l)
  (- (count-students l) (count-passing l)))
(check-expect (count-failing students) 1)