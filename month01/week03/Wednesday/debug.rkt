;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;EX5A

;; Мягмарын sum, count-items-ийг энэ файлд бас хуул.

;; 1. Base case-ийн утга буруу
(define (contains-1? target l)
  (cond [(empty? l) #f]
        [else (or (= (first l) target) (contains-1? target (rest l)))]))
(check-expect (contains-1? 4 (cons 3 empty)) #f)

;; 2. Хил буруу: тэнцүүг тоолж байна
(define (count-greater-than-2 l limit)
  (cond [(empty? l) 0]
        [(> (first l) limit) (+ 1 (count-greater-than-2 (rest l) limit))]
        [else (count-greater-than-2 (rest l) limit)]))
(check-expect (count-greater-than-2 (cons 5 empty) 5) 0)

;; 3. NEList-ийг хоосон list шиг бичсэн
(define (find-max-3 l)
  (cond [(empty? (rest l)) (first l)]
        [else (max (first l) (find-max-3 (rest l)))]))
(check-expect (find-max-3 (cons -5 (cons -2 empty))) -2)

;;Sum
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum (rest l)))]))
;; бүх тооны нийлбэр
(check-expect (sum empty) 0)
(check-expect (sum (cons 1 (cons 2 (cons 3 empty)))) 6)

;; count-items : List-of-numbers -> Number
(define (count-items numbers)
  (cond
    [(empty? numbers) 0]
    [else (+ 1 
             (count-items (rest numbers)))]))
;; элементийн тоо
(check-expect (count-items empty) 0)
(check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)


;; 4. Эхний элементийг алгассан
(define (average-4 l)
  (/ (sum l) (count-items l)))
(check-expect (average-4 (cons 60 (cons 80 empty))) 70)

(require 2htdp/image)
;; 5. Буруу зургийн function
(define (stack-all-5 imgs)
  (cond
    [(empty? imgs) empty-image]
        [else (above (first imgs) (stack-all-5 (rest imgs)))]))

(check-expect (stack-all-5 (cons (circle 10 "solid" "red") (cons (circle 10 "solid" "blue") empty)))
              (above (circle 10 "solid" "red") (circle 10 "solid" "blue")))
