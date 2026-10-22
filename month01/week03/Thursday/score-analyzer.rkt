;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname score-analyzer) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; total : List-of-numbers -> Number
;; 2 жишээ list. Эхнийх нь бүгд тэнцсэн, хоёр дахь нь тэнцээгүй оноотой.
(define scores (list 70 82 95 63 88))
(define mixed-scores (list 40 60 72 58 100))

(define (total l)
  (cond
    [(empty? l) 0]
    [else
      (+ (first l) (total (rest l)))]))
    
(check-expect (total empty) 0)
(check-expect (total scores) 398)


;; count-scores : List-of-numbers -> Number
(define (count-scores s)
  (cond
    [(empty? s) 0]
    [else
     (+ 1 (count-scores (rest s)))])) 
  
(check-expect (count-scores empty) 0)
(check-expect (count-scores scores) 5)

;; average : NEList-of-numbers -> Number
(define (average l)
  (/ (total l)
     (count-scores l)))
;; total, count-scores-г дуудна. Хоосон list дээр дуудахгүй (NEList).
(check-expect (average scores) 79.6)
(check-expect (average mixed-scores) 66)


;; highest : NEList-of-numbers -> Number
(define (highest h)
  (cond
    [(empty? (rest h)) (first h)]
    [else
     (max (first h) (highest (rest h)))]))

(check-expect (highest (list 63)) 63)
(check-expect (highest scores) 95)
(check-expect (highest mixed-scores) 100)

;; count-passing : List-of-numbers -> Number
(define (count-passing s)
  (cond
    [(empty? s) 0]
    [else
     (if (>= (first s) 60)
     (+ 1 (count-passing (rest s)))
     (count-passing (rest s)))]))
          
;; 60 ба түүнээс дээш онооны тоо
(check-expect (count-passing scores) 5)
(check-expect (count-passing mixed-scores) 3)
(check-expect (count-passing (list 60 59)) 1)    ; хил

;; count-failing : List-of-numbers -> Number
(define (count-failing f)
  (cond
    [(empty? f) 0]
    [else
     (if (< (first f) 60)
     (+ 1 (count-failing (rest f)))
     (count-failing (rest f)))]))
;; 60-аас бага онооны тоо
(check-expect (count-failing scores) 0)
(check-expect (count-failing mixed-scores) 2)


;; passing-scores : List-of-numbers -> List-of-numbers
(define (passing-scores p)
  (cond
    [(empty? p) empty]
    [else
     (if (>= (first p) 60)
      (cons
          (first p) (passing-scores (rest p))) 
          (passing-scores (rest p)))]))  
      
;; зөвхөн тэнцсэн оноонууд
(check-expect (passing-scores mixed-scores) (list 60 72 100)) ;;cons ashiglasnaar shne list uusj baina
(check-expect (passing-scores (list 10 20)) empty)

;; score-bars : List-of-numbers -> Image
(require 2htdp/image)

(define (score-bars image)
  (cond
    [(empty? image) empty-image]
    [else
     (above
          (rectangle (first image) 20 "solid" "blue")
          (score-bars (rest image)))]))  
;; оноо бүрийг 2-р долоо хоногийн score-bar-аар (rectangle оноо 20 "solid" "blue")
;; дээрээс доош тавина. Хоосон list → empty-image.
(check-expect (score-bars empty) empty-image)
(check-expect (score-bars (list 80 60))
              (above (rectangle 80 20 "solid" "blue") (rectangle 60 20 "solid" "blue")))

