;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; 1
(define-struct student (name quiz project))

(define sora (make-student "sora" 60 60))
(define ren (make-student "ren" 45 55))
(define aki (make-student "aki" 80 90))
(define mina (make-student "mina" 95 91))

(define (final-score s)
  (+ (* (student-quiz s) 0.4)
     (* (student-project s) 0.6)))
(check-expect (final-score aki) 86)

;; 2
(define (passing? s)
  (>= (final-score s) 60))
(check-expect (passing? sora) #true)

;; 3
(define (add-bonus student b)
  (make-student (student-name student)
                (student-quiz student)
                (min 100 (+ (student-project student) b))))
                
(check-expect (add-bonus aki 5) (make-student "aki" 80 95))


;; 4
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))
(define (student-grade s)
  (letter-grade (final-score s)))
(check-expect (student-grade aki) "B")
