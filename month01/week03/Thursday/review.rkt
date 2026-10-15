;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; count-at-least : List-of-numbers Number -> Number
(define (count-at-least l limit)
  (cond
    [(empty? l) 0]
    [else
      (if (>= (first l) limit)
        (+ 1 (count-at-least (rest l) limit))
          (count-at-least (rest l) limit))])) 
;; limit-ээс их буюу ТЭНЦҮҮ тоонуудын тоо
(check-expect (count-at-least empty 60) 0)
(check-expect (count-at-least (cons 60 (cons 59 empty)) 60) 1)


;; smallest : NEList-of-numbers -> Number
(define (smallest n)
  (cond
    [(empty? (rest n)) (first n)]
    [else
     (min (first n)
          (smallest (rest n)))]))
     
;; хамгийн бага утга. min ашиглаж болно.
(check-expect (smallest (cons 3 empty)) 3)
(check-expect (smallest (cons 5 (cons -1 (cons 4 empty)))) -1)

(require 2htdp/image)
;; draw-sizes : List-of-numbers -> Image
(define (draw-sizes l)
  (cond
    [(empty? l) empty-image]
    [else
     (beside
      (circle (first l) "outline" "black")
                     (draw-sizes (rest l)))]))
;; тоо бүрийг радиус болгосон хар хүрээтэй тойргуудыг зүүнээс баруун тийш тавина
(check-expect (draw-sizes empty) empty-image)
(check-expect (draw-sizes (cons 10 (cons 20 empty)))
              (beside (circle 10 "outline" "black") (circle 20 "outline" "black")))

