;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Tuesday) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;EX02

(define-struct pet (name kind age))

(define bobo (make-pet "Бобо" "нохой" 3))
(define mimi (make-pet "Мими" "муур" 1))
(define tom  (make-pet "Том"  "муур" 12))

;;EX2B
(pet-name mimi)
(pet-kind tom)

(define (cat? pet)
  (string=? (pet-kind pet) "муур")) ;; string shalgaj baigaa uyd (string=?) ashiglana

(check-expect (cat? mimi) #true)
(check-expect (cat? mimi) #true)
(check-expect (cat? mimi) #true)

;;EX2C
;;Senior? Pet -> Boolean
;; tom: 12 >= 10
(define (senior? pet)
  (>= (pet-age pet) 10))
  
(check-expect (senior? tom) #true)
(check-expect (senior? bobo) #false)
(check-expect (senior? (make-pet "Хар" "нохой" 10)) #true)
(check-expect (senior? (make-pet "Цагаан" "муур" 9)) #false)


;; 2026-10-20
;;Ex2D
;; Pet-intro : Pet -> String
(define (pet-intro pet)
  (string-append
   (pet-name pet)
   " бол "
   (number->string (pet-age pet))
   " настай "
   (pet-kind pet)))
(check-expect (pet-intro bobo) "Бобо бол 3 настай нохой")
(check-expect (pet-intro mimi) "Мими бол 1 настай муур")
(check-expect (pet-intro tom) "Том бол 12 настай муур")        

;; EX03
(define-struct product (name price qty))
  
;; price negjiin une
;; qty : aguulahad baigaa too
         
(define pen      (make-product "Үзэг"   500   40))
(define notebook (make-product "Дэвтэр" 1500  0))
(define bag      (make-product "Цүнх"   45000 3))

;;Stock-value: une* too
(define (stock-value p)
  (* (product-price p) (product-qty p)))
     
(check-expect (stock-value pen) 20000)
(check-expect (stock-value bag) 135000)
(check-expect (stock-value notebook) 0)

;;in-stock quantity > 0 bol #true
(define (in-stock? p)
  (> (product-qty p) 0))

(check-expect (in-stock? pen) #true)
(check-expect (in-stock? bag) #true)
(check-expect (in-stock? notebook) #false)

;; price-with-tax = quantity * 1.1
(define (price-with-tax p)
  (* (product-price p) 1.1))
(check-expect (price-with-tax pen) 550)
(check-expect (price-with-tax notebook) 1650)
(check-expect (price-with-tax bag) 49500)

;;Exercise 04
;; ball zurag
(require 2htdp/image)

(define-struct ball (radius color))

(define (draw-ball b)
  (circle (ball-radius b)
          "solid"
          (ball-color b)))

(define red-ball (make-ball 20 "red"))
(define big-blue (make-ball 50 "blue"))
(define tiny (make-ball 5 "green"))

;;Bombogiig duuren duguigaar zur
(check-expect (draw-ball red-ball) (circle 20 "solid" "red"))
(check-expect (draw-ball big-blue) (circle 50 "solid" "blue"))

;;bigger?
(define (bigger? b1 b2)
  (> (ball-radius b1) (ball-radius b2)))

(check-expect (bigger? big-blue red-ball) #true)
(check-expect (bigger? red-ball tiny) #true)
(check-expect (bigger? tiny red-ball) #false)
(check-expect (bigger? red-ball red-ball) #false)

;;Jishee 50 ba 20 -> (> 50 20) true(check-expect (ball-in-box red-ball)
              (overlay (circle 20 "solid" "red") (square 50 "outline" "black"))


;;ball-in-box
(define (ball-in-box ball)
  (overlay (draw-ball ball) (square (+ (* (ball-radius ball) 2) 10) "outline" "black")))
(check-expect (ball-in-box red-ball)
              (overlay (circle 20 "solid" "red") (square 50 "outline" "black")))
(check-expect (ball-in-box tiny)
              (overlay (circle 5 "solid" "green") (square 20 "outline" "black")))
(check-expect (ball-in-box big-blue)
              (overlay (circle 50 "solid" "blue") (square 110 "outline" "black")))

;;Jishee: red-ball : 2* 20 + 10 = 50

;;EX05
;;home -> ezen bag ner , home-away -> orsoldogch bag, home-goals -> ezen bag goal, away-goals -> orsoldogch goal
(define-struct game (home away home-goals away-goals))
(define g1 (make-game "Монгол" "Япон" 2 1))
(define g2 (make-game "Монгол" "Солонгос" 1 3))
(define g3 (make-game "Монгол" "Солонгос" 2 2))

(check-expect (game? g1) #true)
(check-expect (game-home g1) "Монгол")
(check-expect (game-away g1) "Япон")
(check-expect (game-away-goals g2) 3)


;;Total goals
(define (total-goals game)
  (+ (game-home-goals game) (game-away-goals game)))

(check-expect (total-goals g1) 3)
(check-expect (total-goals (make-game "A" "B" 0 0)) 0)

;; 5A
(define (winner g)
  (cond
    [(> (game-home-goals g) (game-away-goals g))
     (game-home g)]
    [(< (game-home-goals g) (game-away-goals g))
     (game-away g)]
    [else "Тэнцээ"])) 

(check-expect (winner g1) "Монгол")
(check-expect (winner g2) "Солонгос")
(check-expect (winner g3) "Тэнцээ")
(check-expect (total-goals (make-game "A" "B" 0 0)) 0)

;; Exercise06(define-struct student (quiz project))
;; passing? : Student -> Boolean
(define-struct student (name quiz project))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(define sora (make-student "sora" 60 60))
(define ren (make-student "ren" 45 55))
(define aki (make-student "aki" 80 90))
(define mina (make-student "mina" 95 91))

(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score (make-student "hundred" 100 0)) 40)
(check-expect (final-score (make-student "hundred" 0 100)) 60)

;;
(define (passing? student)
  (>= (final-score student) 60))

;; passing? : Student -> Boolean
;; эцсийн оноо 60 ба түүнээс дээш бол #true
(check-expect (passing? sora) #true)                          ; яг 60
(check-expect (passing? ren) #false)
(check-expect (passing? (make-student "Edge" 59 61)) #true)   ; 60.2
(check-expect (passing? (make-student "Low" 61 59)) #false)   ; 59.8



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


;; add-bonus : Student Number -> Student
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

