;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;REVIEW
;; count-zeros : List-of-numbers -> Number
(define (count-zeros number)
      (cond
        [(empty? number) 0]
        [else
         (if (= (first number) 0)
         (+ 1 (count-zeros (rest number))) 
             (count-zeros (rest number)))])) 
;; 0-ийн тоо
(check-expect (count-zeros empty) 0)
(check-expect (count-zeros (cons 0 (cons 5 (cons 0 empty)))) 2)



;; all-positive? : List-of-numbers -> Boolean
(define (all-positive? number)
  (cond
    [(empty? number) #t]
    [else (and (positive? (first number))
              (all-positive? (rest number)))])) 
;; бүх тоо эерэг бол #t. Хоосон list-д эерэг биш тоо байхгүй тул #t.
(check-expect (all-positive? empty) #t)
(check-expect (all-positive? (cons 1 (cons 2 empty))) #t)
(check-expect (all-positive? (cons 1 (cons 0 empty))) #f)


(require 2htdp/image)
;; stack-all : List-of-images -> Image
(define (stack-all image)
  (cond
    [(empty? image) empty-image]
    [else
     (above (first image)(stack-all (rest image)))]))
     
;; бүх зургийг дээрээс доош тавина
(check-expect (stack-all empty) empty-image)
(check-expect (stack-all (cons (circle 10 "solid" "red") (cons (circle 10 "solid" "blue") empty)))
              (above (circle 10 "solid" "red") (circle 10 "solid" "blue")))

;; NEList-of-numbers is one of:
;; – (cons Number empty)
;; – (cons Number NEList-of-numbers)
;;Хамгийн их оноо, дундаж зэрэг нь хоосон list-д утгагүй. 0 гэж хариулбал "хүн бүр 0 авсан" гэж андуурагдана.
;;Тиймээс эдгээр function зөвхөн хоосон биш list авна гэж data definition-оор хэлнэ

;; Base case нь хоосон list биш, нэг элементтэй list. Template ч үүнийг дагана:
(define (fun-for-nelon l)
  (cond
    [(empty? (rest l)) (... (first l) ...)]
    [else (... (first l) ... (fun-for-nelon (rest l)) ...)]))

;; last-item : NEList-of-numbers -> Number
(check-expect (last-item (cons 7 empty)) 7)
(check-expect (last-item (cons 1 (cons 2 (cons 3 empty)))) 3)

;; Jishee 
(define (last-item l)
  (cond
    [(empty? (rest l)) (first l)]   ;; (empty? (rest l)) нь #t bol tuunii omnoh toog butsaana
    [else (last-item (rest l))]))  ;; Хэрэв одоогийн элемент сүүлийнх биш бол эхний элементийг алгасаад,
;; үлдсэн list дээр last-item функцийг дахин ажиллуул.


;;EX3A
;; sum : List-of-numbers -> Number
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



;; contains? : Number List-of-numbers -> Boolean
(define (contains? target number)
  (cond
    [(empty? number) #f]
    [else
     (or (= (first number) target)
          (contains? target (rest number)))]))
;; target list дотор байвал #t
(check-expect (contains? 5 empty) #f)
(check-expect (contains? 5 (cons 3 (cons 5 (cons 7 empty)))) #t)
(check-expect (contains? 4 (cons 3 (cons 5 empty))) #f)


;; count-greater-than : List-of-numbers Number -> Number
(define (count-greater-than number limit)
  (cond
    [(empty? number) 0]
    [else
     (if (> (first number) limit)
          (+ 1 (count-greater-than (rest number) limit)) ;;1 → эхний тоо limit-ээс их учраас нэгээр тоолж байна.
          (count-greater-than (rest number) limit))]))  ;; (count-greater-than (rest numbers) limit)
;; → үлдсэн list дотор limit-ээс их хэдэн тоо байгааг олно.

;; limit-ээс ИХ (тэнцүү биш) тоонуудын тоо
(check-expect (count-greater-than empty 5) 0)
(check-expect (count-greater-than (cons 2 (cons 8 (cons 10 empty))) 5) 2)
(check-expect (count-greater-than (cons 5 (cons 6 empty)) 5) 1)   ; 5 тоологдохгүй




;; find-max : NEList-of-numbers -> Number
(define (find-max l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (max (first l)
               (find-max (rest l)))]))

;; хамгийн их утга. max ашиглаж болно: (max 3 8) → 8
(check-expect (find-max (cons 70 empty)) 70)
(check-expect (find-max (cons 70 (cons 95 (cons 63 empty)))) 95)
(check-expect (find-max (cons -5 (cons -2 empty))) -2)



;; average : NEList-of-numbers -> Number
(define (average l)
     (/ (sum l)
               (count-items l)))
;; дундаж = sum / count-items. Хоосон биш тул 0-д хуваахгүй.
(check-expect (average (cons 80 empty)) 80)
(check-expect (average (cons 70 (cons 82 (cons 95 (cons 63 (cons 88 empty)))))) 79.6)

