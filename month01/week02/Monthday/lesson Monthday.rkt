;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |lesson Monthday|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (square x)
  (* x x))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(sum-of-squares 3 4)

(check-expect (square 5) 25)


;; bytes-to-bits : Number -> Number
(define (bytes-to-bits byte)
  (* 8 byte))

;; byte-ийн тоог bit болгоно (1 byte = 8 bit)
(check-expect (bytes-to-bits 1) 8)
(check-expect (bytes-to-bits 3) 24)



;; kib-to-bytes : Number -> Number
(define (kib-to-bytes kib)
  (* kib 1024))
;; KiB-ийн тоог byte болгоно (1 KiB = 1024 byte)
(check-expect (kib-to-bytes 1) 1024)
(check-expect (kib-to-bytes 2) 2048)



;; kib-to-bits : Number -> Number
(define (kib-to-bits kib)
  (bytes-to-bits (kib-to-bytes kib)))

;; KiB-г bit болгоно. kib-to-bytes, bytes-to-bits-г дуудна.
(check-expect (kib-to-bits 1) 8192)
(check-expect (kib-to-bits 2) 16384)






;; Exercise2

;; item-total : Number Number -> Number
(define (item-total price count)
  (* price count))
;; нэгж үнэ ба тоо ширхэгээс нийт үнэ
(check-expect (item-total 5000 3) 15000)
(check-expect (item-total 1200 0) 0)

;; discount-amount : Number Number -> Number
(define (discount-amount total discount)
  (* total (/ discount 100)))
;; нийт үнэ ба хувиас хөнгөлөлтийн хэмжээ.
;; Хувийг бүхэл тоогоор өгнө: 10 гэвэл 10% (0.1 биш).
(check-expect (discount-amount 15000 10) 1500)
(check-expect (discount-amount 15000 0) 0)

;; final-price : Number Number Number -> Number
(define (final-price price count discount)
  (- (item-total price count)
     (discount-amount (item-total price count) discount)))
;; нэгж үнэ, тоо ширхэг, хувь → хөнгөлөлт хассан үнэ.
;; item-total, discount-amount-г дуудна.
(check-expect (final-price 5000 3 10) 13500)
(check-expect (final-price 5000 3 0) 15000)



; Exercise03
;; sum3 : Number Number Number -> Number
(define (sum3 a b c )
   (+ a b c))
;; гурван тооны нийлбэр
(check-expect (sum3 10 20 30) 60)

;; average3 : Number Number Number -> Number
(define (average3 a b c )
   (/ (sum3 a b c) 3))
;; гурван тооны дундаж. sum3-г дуудна.
(check-expect (average3 60 80 100) 80)
(check-expect (average3 0 0 90) 30)




;;BOOLEAN

(check-expect (> 10 5) #t)        ; #t
(check-expect (= (+ 2 3) 5) #t) ; #t
(check-expect (>= 18 20) #f)    ; #f   ;;>= <=
(check-expect (even? 14) #t)    ; #t
(check-expect (positive? -3) #f) ; #f
;;predicate function (asuuj baigaa function)
(check-expect (zero? 0) #t)
;;predicate exampkes
(define (adult? age)
  (>= age 18))

(check-expect (adult? 19) #t)
(check-expect (adult? 15) #f)

(define (passing-average? a b c)
  (>= (average3 a b c) 60))
(check-expect (passing-average? 40 50 50) #f)
(check-expect (passing-average? 70 100 80) #t)



;;Exercise04

;; passing-score? : Number -> Boolean
(define (passing-score? score)
  (>= score 60))
;; score 60 ба түүнээс дээш бол #t
(check-expect (passing-score? 60) #t)
(check-expect (passing-score? 59) #f)

;; fits-in-byte? : Number -> Boolean
(define (fits-in-byte? byte)
  (<= byte 255))
;; сөрөг биш бүхэл n нэг byte (8 bit, 0–255)-д багтах уу
(check-expect (fits-in-byte? 255) #t)
(check-expect (fits-in-byte? 256) #f)

;; large-file-mib? : Number -> Boolean
(define (large-file-mib? Mib)
  (>= Mib 100))
;; файлын хэмжээ (MiB) 100 ба түүнээс их бол #t
(check-expect (large-file-mib? 100) #t)
(check-expect (large-file-mib? 99) #f)

;; same-total? : Number Number Number Number -> Boolean
(define (items-total price quantity)
  (* price quantity))
(define (same-total? price1 quantity1 price2 quantity2)
  (= (items-total price1 quantity1)
     (items-total price2 quantity2)))
;; хоёр барааны item-total тэнцүү эсэх (үнэ1 тоо1 үнэ2 тоо2)
(check-expect (same-total? 5000 3 3000 5) #t)
(check-expect (same-total? 5000 3 5000 2) #f)

;; passing-average? : Number Number Number -> BooleOn branch main
(define (average03 a b c)
  (/ (+ a b c) 3))
(define (passing-averages? a b c)
  (>= (a b c) 60))
  (>= (average03 a b c) 60))
;; average3 60 ба түүнээс дээш бол #t
(check-expect (passing-averages? 60 60 60) #t)
(check-expect (passing-averages? 59 60 60) #f)

;; discount-eligible? : Number Number Number -> Boolean
(define (discount-eligible price count discount)
  (- (item-total price count)
     (discount-amount (item-total price count) discount)))
(define (discount-eligible? price count discount)
  (>= (discount-eligible price count discount) 50000))
;; final-price 50000 ба түүнээс их бол #t (нэгж үнэ, тоо, хувь)
(check-expect (discount-eligible? 5000 10 0) #t)    ; 50000
(check-expect (discount-eligible? 5000 10 10) #f)   ; 45000
