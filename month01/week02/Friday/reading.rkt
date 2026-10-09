;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname reading) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ---- Пүрэвийн төсөл: жишээ шийдэл ----

(define (sum3 a b c) (+ a b c))
(define (average3 a b c) (/ (sum3 a b c) 3))
(define (assignment-percent completed total)
  (* (/ completed total) 100))

(check-expect (assignment-percent 8 10) 80)
(check-expect (assignment-percent 6 10) 60)
(check-expect (assignment-percent 9 10) 90)

(define (passing-average? s1 s2 s3)
  (>= (average3 s1 s2 s3) 60))
(define (good-attendance? attendance)
  (>= attendance 80))
(define (assignments-complete? completed total)
  (>= (assignment-percent completed total) 70))

(check-expect (passing-average? 100 100 60) #t)

(define (eligible? s1 s2 s3 attendance completed total)
  (and (passing-average? s1 s2 s3)
       (good-attendance? attendance)
       (assignments-complete? completed total)))

(define (final-status s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))

(check-expect (final-status 100 100 90 80 7 10) "Eligible")


(define (letter-grade avg)
  (cond
    [(>= avg 90) "A"]
    [(>= avg 80) "B"]
    [(>= avg 70) "C"]
    [(>= avg 60) "D"]
    [else "F"]))

(define (student-grade s1 s2 s3)
  (letter-grade (average3 s1 s2 s3)))

(check-expect (student-grade 100 100 90) "A")
(check-expect (student-grade 80 88 85) "B")


(define (ineligibility-reason s1 s2 s3 attendance completed total)
  (cond
    [(not (passing-average? s1 s2 s3)) "Low score"]
    [(not (good-attendance? attendance)) "Low attendance"]
    [(not (assignments-complete? completed total)) "Missing assignments"]
    [else "Eligible"]))

(check-expect (ineligibility-reason 60 55 50 80 8 10) "Low score")
(check-expect (ineligibility-reason 90 95 100 60 8 10) "Low attendance")
(check-expect (ineligibility-reason 90 95 100 88 4 10) "Missing assignments")


;; debug.rkt-ийн эхэнд 2-р хэсгийн жишээ шийдлийг хуул.

;; debug.rkt-ийн эхэнд 2-р хэсгийн жишээ шийдлийг хуул.

;; 1. Хувь урвуу бодогдож байна
(define (assignment-percent-1 completed total)
  (* (/ completed total) 100))
(check-expect (assignment-percent-1 8 10) 80)

;; 2. Дундажийн оронд нийлбэр шалгаж байна
(define (passing-average-2? s1 s2 s3)
  (>= (average3 s1 s2 s3) 60))
(check-expect (passing-average-2? 20 20 20) #f)

;; 3. Нэг шалгуур мартагдсан
(define (eligible-3? s1 s2 s3 attendance completed total)
  (and (passing-average? s1 s2 s3)
       (good-attendance? attendance)
       (>= (assignment-percent-1 completed total) 70)))
(check-expect (eligible-3? 80 90 70 85 6 10) #f)

;; 4. Хоёр string-ийн байр солигдсон
(define (final-status-4 s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))
(check-expect (final-status-4 80 90 70 85 8 10) "Eligible")

;; 5. Оролтын тоо таарахгүй
(define (final-status-5 s1 s2 s3 attendance completed total)
  (if (eligible-3? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))
(check-expect (final-status-5 80 90 70 85 8 10) "Eligible")

;; 6. Шалтгааны дараалал буруу
(define (ineligibility-reason-6 s1 s2 s3 attendance completed total)
  (cond
    [(not (passing-average? s1 s2 s3)) "Low score"]
    [(not (good-attendance? attendance)) "Low attendance"]
    [(not (assignments-complete? completed total)) "Missing assignments"]
    [else "Eligible"]))
(check-expect (ineligibility-reason-6 59 59 59 50 0 10) "Low score")