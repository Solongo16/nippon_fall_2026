;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname transform) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; double-all : List-of-numbers -> List-of-numbers
;; тоо бүрийг 2 дахин urjuuleed shine list uusgedeg function

(check-expect (double-all empty) empty)
(check-expect (double-all (list 1 2 3)) (list 2 4 6))

(define (double-all l)
  (cond
    [(empty? l) empty]                              ; хоосон list → хоосон list
    [else
     (cons    ;;shine ehnii toog uldsen ur dungiin urd zalgana
      (* 2 (first l)) (double-all (rest l)))]))

;;EX03A
(define (add-ten-all number)
  (cond
    [(empty? number) empty]
    [else
     (cons
      (+ 10 (first number)) (add-ten-all (rest number)))]))
;; add-ten-all : List-of-numbers -> List-of-numbers
(check-expect (add-ten-all empty) empty)
(check-expect (add-ten-all (list 1 2 3)) (list 11 12 13))


;; only-positive : List-of-numbers -> List-of-numbers
(define (only-positive n)
  (cond
    [(empty? n) empty]
    [else
      (if (positive? (first n))
          (cons
           (first n) (only-positive (rest n)))
          (only-positive (rest n)))]))
       
;; зөвхөн эерэг тоонуудыг үлдээнэ (0 эерэг биш)
(check-expect (only-positive empty) empty)
(check-expect (only-positive (list -2 0 5 9)) (list 5 9))

;; cap-at-100 : List-of-numbers -> List-of-numbers
(define (cap-at-100 number)
  (cond
    [(empty? number) empty]
    [else
     (cons
      (min (first number) 100) (cap-at-100 (rest number)))]))
;; 100-аас их оноог 100 болгоно. min ашиглаж болно.
(check-expect (cap-at-100 (list 50 100 150)) (list 50 100 100))


