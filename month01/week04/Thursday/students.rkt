;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname students) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;3A
(define-struct student (name quiz project))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(define sora (make-student "Sora" 60 60))
(define ren (make-student "Ren" 45 55))
(define aki (make-student "Aki" 80 90))
(define mina (make-student "Mina" 95 91))


;; A List-of-students is one of:
;; - empty
;; - (cons Student List-of-students)

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
(check-expect (total-final students) 289.6)

;;D
(define (count-students s)
  (cond
    [(empty? s) 0]
    [else
      (+ 1 (count-students (rest s)))]))
;; count-students : List-of-students -> Number
(check-expect (count-students empty) 0)
(check-expect (count-students students) 4)

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

;;C
;; grades : List-of-students -> List-of-strings
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))

(define (student-grade student)
  (letter-grade (final-score student)))

(define (grades s)
  (cond
    [(empty? s) empty]
    [else
    (cons
   (student-grade (first s)) (grades (rest s)))]))
;; сурагч бүрийн үсгэн үнэлгээ
(check-expect (grades students) (list "B" "D" "A" "F"))

;; D
;; bonus-all : List-of-students Number -> List-of-students
(define (add-bonus student bonus)
  (make-student
  (student-name student)
  (student-quiz student)
  (min 100 (+ (student-project student) bonus))))

(define (bonus-all s b)
    (cond
    [(empty? s) empty]
    [else
     (cons
      (add-bonus (first s) b) (bonus-all (rest s) b))]))
;; сурагч бүрийн project-д bonus нэмнэ (add-bonus)
(check-expect (bonus-all empty 10) empty)
(check-expect (bonus-all (list aki ren) 10)
              (list (make-student "Aki" 80 100) (make-student "Ren" 45 65)))


;; EX05
;;A

(define (better-student s1 s2)
  (if
  (>= (final-score s1) (final-score s2))
  s1
  s2))
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
(check-expect (average-final students) 72.4)

;; C
(define (top-name s)
  (student-name (best-student s)))
;; top-name : NEList-of-students -> String
(check-expect (top-name students) "Mina")




