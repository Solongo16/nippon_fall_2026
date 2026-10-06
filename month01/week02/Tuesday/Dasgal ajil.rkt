;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Dasgal ajil|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (kb-to-bytes a)
  (* a 1000))
;; kb-to-bytes : Number -> Number
(check-expect (kb-to-bytes 2) 2000)

;; kb-to-bits : Number -> Number;; bytes-to-bits : Number -> Number
(define (bytes-to-bits byte)
  (* 8 byte))
(define (kb-to-bits kb)
  (bytes-to-bits(* kb 1000)))
;; kb-to-bytes, Даваагийн bytes-to-bits-г дуудна
(check-expect (kb-to-bits 2) 16000)   ; (kib-to-bits 2) бол 16384


;; can-store? : Number Number -> Boolean
(define (can-store a b)
  (+ a b))
(define (can-store? a b)
  (<= (can-store a b) 1024))
;; файлын хэмжээ, дискний сул зай (KiB) → багтвал #t
(check-expect (can-store? 500 512) #t)
(check-expect (can-store? 512 512) #t)   ; хил
(check-expect (can-store? 513 512) #f)

;; cheap-order? : Number Number -> Boolean
(define (cheap-order price quantity)
  (* price quantity))
(define (cheap-order? price quantity)
  (< (cheap-order price quantity) 10000))
;; нэгж үнэ, тоо ширхэг → item-total 10000-аас бага бол #t
(check-expect (cheap-order? 2000 4) #t)   ; 8000
(check-expect (cheap-order? 2000 5) #f)   ; 10000, хил

;;Boolean operation

;;and or not
(and (> 10 5) (< 3 1)) ;; false
(or (= 4 4) (> 2 9)) ;; true
(not (even? 7)) ;true

;;Exercise
(check-expect (and #t #t) #t)
(check-expect (and #t #f) #f)
(check-expect (or #f #f) #f)
(check-expect (or #f #t) #t)
(check-expect (not #t) #f)
(check-expect (not #f) #t)

(define (in-range? a)
  (and (>= a 1) (<= a 10)))
(check-expect (in-range? 5) #t)


(define (teen? t)
  (and (>= t 13) (<= t 19)))
(check-expect (teen? 13) #t)
(check-expect (teen? 19) #t)
(check-expect (teen? 12) #f)
(check-expect (teen? 20) #f)

;;Ex04
(define (weekend? day)
  (or (= day 6) (= day 7)))
(check-expect (weekend? 6) #t)
(check-expect (weekend? 7) #t)
(check-expect (weekend? 5) #f)

;;Ex05
(define (scholarship? score attendance)
  (and (>= score 90) (>= attendance 80)))
(check-expect (scholarship? 90 80) #t)
(check-expect (scholarship? 89 100) #f)
(check-expect (scholarship? 100 79) #f)



(define (not-passing? s)
  (not (>= s 60))) ;; (s) 60-aas ih buyu tentsuu bish uyd true gesen ug. 60-aas  
(check-expect (not-passing? 59) #t)
(check-expect (not-passing? 60) #f)

;;IF
(define (adult-or-minor age)
  (if (>= age 18)   ;;hervee 18s ih buyu tentsuu uyd "adult", ugui bol "minor"
      "adult"
      "minor"))
(check-expect (adult-or-minor 30) "adult")



(define (even-or-odd number)
  (if (even? number)    ;; hervee even mon bol "even" bish bol "odd"
      "even"
      "odd"))
(check-expect (even-or-odd 3) "odd")
(check-expect (even-or-odd 8) "even")


;; pass-or-fail : Number -> String
(define (pass-or-fail score)
  (if (>= score 60)
      "pass"
      "fail"))
;; score 60 ба түүнээс дээш бол "pass", үгүй бол "fail"
(check-expect (pass-or-fail 60) "pass")
(check-expect (pass-or-fail 59) "fail")

;; shipping-fee : Number -> Number
(define (shipping-fee fee)
  (if (>= fee 50000)
      0
      3000))

;; захиалгын дүн 50000 ба түүнээс их бол хүргэлт 0, үгүй бол 3000
(check-expect (shipping-fee 50000) 0)
(check-expect (shipping-fee 49999) 3000)


;; free-shipping? : Number -> Boolean
(define (free-shipping? fee)
  (>= fee 50000))
;; дүн 50000 ба түүнээс их бол #t. if ашиглахгүйгээр бич.
(check-expect (free-shipping? 50000) #t)
(check-expect (free-shipping? 49999) #f)



;; larger : Number Number -> Number
(define (larger a b)
  (if (>= a b)
      a
      b))
;; хоёр тооны их нь
(check-expect (larger 3 8) 8)
(check-expect (larger 8 3) 8)
(check-expect (larger 5 5) 5)

;; absolute-value : Number -> Number
(define (absolute-value value)
  (if (>= value 0)
       value
      (* value -1)))
;; сөрөг бол эсрэг тэмдэгтэй болгоно, үгүй бол хэвээр
(check-expect (absolute-value -4) 4)
(check-expect (absolute-value 4) 4)
(check-expect (absolute-value 0) 0)


;; scholarship-label : Number Number -> String
(define (scholarship-label score attendance)
  (if (scholarship? score attendance)
      "scholarship"
      "regular"))
;; score, attendance → тэтгэлэгт тэнцвэл "scholarship", үгүй бол "regular"
(check-expect (scholarship-label 95 85) "scholarship")
(check-expect (scholarship-label 90 80) "scholarship")
(check-expect (scholarship-label 89 80) "regular")
(check-expect (scholarship-label 90 79) "regular")


;;COND  ELSE

;; grade : Number -> String
;; 0–100 оноог үсгэн дүн болгоно
(define (grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

(check-expect (grade 90) "A")   ; хил
(check-expect (grade 89) "B")   ; хилийн доор



;;Ex01
;; temperature-label : Number -> String
(define (temperature-label temp)
  (cond
    [(>= temp 25) "hot"]
    [(>= temp 15) "warm"]
    [(>= temp 0)  "cold"]
    [else "freezing"]))
;; 0-ээс бага "freezing", 0–14 "cold", 15–24 "warm", 25 ба түүнээс дээш "hot"
(check-expect (temperature-label -1) "freezing")
(check-expect (temperature-label 0) "cold")
(check-expect (temperature-label 14) "cold")
(check-expect (temperature-label 15) "warm")
(check-expect (temperature-label 24) "warm")
(check-expect (temperature-label 25) "hot")


(define (ticket-price price)
  (cond
    [(>= price 60) 6000]
    [(>= price 13) 10000]
    [(>= price 1)  5000]
))

;; ticket-price : Number -> Number
;; age 13-аас бага 5000, 13–59 10000, 60 ба түүнээс дээш 6000
(check-expect (ticket-price 12) 5000)
(check-expect (ticket-price 13) 10000)
(check-expect (ticket-price 59) 10000)
(check-expect (ticket-price 60) 6000)


;; number-sign : Number -> String
(define (number-sign number)
  (cond
    [(>= number 1) "positive"]
    [(=  number 0 ) "zero"]
    [(< number 0)  "negative"]
    [else "freezing"]))
;; "positive", "zero", "negative"
(check-expect (number-sign 5) "positive")
(check-expect (number-sign 0) "zero")
(check-expect (number-sign -5) "negative")



;; file-size-label : Number -> String
(define (file-size-label size)
  (cond
    [(>= size 100) "large"]
    [(>= size 10 ) "medium"]
    [else "small"]))
;; MiB хэмжээ: 10-аас бага "small", 10–99 "medium", 100 ба түүнээс их "large"
(check-expect (file-size-label 9) "small")
(check-expect (file-size-label 10) "medium")
(check-expect (file-size-label 99) "medium")
(check-expect (file-size-label 100) "large")
