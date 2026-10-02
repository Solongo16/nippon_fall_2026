;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 ; Функцийн нэр: average3
 ; Оролт: A B C
 ; Гаралт: average
 ; Томьёо: (A + B + C)/3
(define (average3 A B C)
  (/ (+ A B C) 3))

(average3 66 77 88)  ; Хүлээсэн үр дүн: 77

 ; Функцийн нэр: homework-total
 ; Оролт: HW01 HW02
 ; Гаралт: total
 ; Томьёо: (HW01 + HW02)
(define (homework-total HW01 HW02)
   (+ HW01 HW02))

(homework-total 35 40)  ; Хүлээсэн үр дүн:75


 ; Функцийн нэр: exam-total
 ; Оролт: ES01 ES02 ES03
 ; Гаралт: total
 ; Томьёо: (ES01 + ES02 + ES03)/3
(define (exam-total ES01 ES02 ES03)
   (/ (+ ES01 ES02 ES03) 3))

(exam-total 75 85 95)  ; Хүлээсэн үр дүн: 85


 ; Функцийн нэр: overall-score
 ; Оролт: S01 S02 S03
 ; Гаралт: overall score
 ; Томьёо: (S01 + S02 + S03)/3
(define (overall-score S01 S02 S03)
   (/ (+ S01 S02 S03) 3))

(overall-score 66 77 99)  ; Хүлээсэн үр дүн: 80.6

 ; Функцийн нэр: points-percentage
 ; Оролт: P01 P02 P03
 ; Гаралт: points percentage
 ; Томьёо: (P01 + P02 + P03)/total point *100
(define (points-percentage P01 P02 P03)
  (* (/ (+ P01 P02 P03) 60) 100))

(points-percentage 15 19 12)  ; Хүлээсэн үр дүн: 76.6


 ; Функцийн нэр: average5
 ; Оролт: A01 A02 A03 A04 A05
 ; Гаралт: points percentage
 ; Томьёо: (A01 + A02 + A03 + A04 + A05)/5
(define (average5 A01 A02 A03 A04 A05)
  (/ (+ A01 A02 A03 A04 A05) 5))

(average5 35 5 6 18 9)  ; Хүлээсэн үр дүн: 14.6

  