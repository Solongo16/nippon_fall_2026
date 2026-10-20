;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 2026-10-19
;; struct
;; Yaj bi daraah zuilsiig hadgalah ve

(define-struct book (title author pages))

;; A book is (make-book String String NUmber)
;; title 

(define b1 (make-book "Harry Potter" "Rowling" 320))
(define b2 (make-book "Бяцхан ханхүү" "Exupéry" 96))
(define b3 (make-book "Нууц товчоо" "Тодорхойгүй" 300))

;; Template
(book-title b2)
;; b3 heden huudastai 
(book-pages b3)
;; b1 author
(book-author b1)


;;long-book?
;;300s olon huudastai bol #t ugui bol #f
(define (long-book? book)
  (> (book-pages book) 300))

(check-expect (long-book? b1) #true)
(check-expect (long-book? b2) #false)
(check-expect (long-book? b3) #false)   ; яг 300
(check-expect (long-book? (make-book "A" "B" 301)) #true)

;; reading-days : Book -> number
;; Odrt 20 huudas unshval nom heden odort duusah ve?
(define (reading-days book)
  (/ (book-pages book) 20))

(check-expect (reading-days b1) 16)
(check-expect (reading-days b2) 4.8)
(check-expect (reading-days b3) 15)

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

