;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sum-passing : List-of-numbers -> Number
(define (sum-passing l)
  (cond
    [(empty? l) 0]
    [else
     (if (>= (first l) 60)
         (+ (first l) (sum-passing (rest l)))
         (sum-passing (rest l)))]))
;; 60 ба түүнээс дээш оноонуудын нийлбэр
(check-expect (sum-passing empty) 0)
(check-expect (sum-passing (list 59 60 100)) 160)
(check-expect (sum-passing (list 10 20)) 0)


;; all-passing? : List-of-numbers -> Boolean
(define (all-passing? l)
  (cond
    [(empty? l) #t]
    [else
      (and (>= (first l) 60)
           (all-passing? (rest l)))]))
;; бүх оноо 60 ба түүнээс дээш бол #true. Хоосон list-д #true.
(check-expect (all-passing? empty) #true)
(check-expect (all-passing? (list 60 75)) #true)
(check-expect (all-passing? (list 60 59)) #false)


;; score-dots : List-of-numbers -> Image
(require 2htdp/image)

(define (score-dots img)
 (cond
  [(empty? img) empty-image]
  [else
   (beside 
    (if (>= (first img) 60)
         (circle 10 "solid" "green")
                 (circle 10 "solid" "red"))
          (score-dots (rest img)))]))
    
;; оноо бүрийг радиус 10 тойрог болгож зэрэгцүүлнэ: 60+ ногоон, бусад улаан
(check-expect (score-dots empty) empty-image)
(check-expect (score-dots (list 70 40))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))
(check-expect (score-dots (list 60)) (circle 10 "solid" "green"))



