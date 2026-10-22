;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct student (name quiz project))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(define sora (make-student "Sora" 60 60))
(define ren (make-student "Ren" 45 55))
(define aki (make-student "Aki" 80 90))
(define mina (make-student "Mina" 95 91))

(define (passing? student)
  (>= (final-score student) 60))

(define students (list aki sora mina ren))

(define (better-student s1 s2)
  (if
  (>= (final-score s1) (final-score s2))
  s1
  s2))

(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))

(define (student-grade student)
  (letter-grade (final-score student)))

;; 1
(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (passing? (first l))
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))
(check-expect (count-passing students) 3)   ;; (passing?) -> (passing? (first l)  

;; 2
(define (names l)
  (cond [(empty? l) empty]
        [else (cons
               (student-name (first l)) (names (rest l)))]))
(check-expect (names (list aki)) (list "Aki")) ;; [(empty? l) 0] -> [(empty? l) empty]

;; 3
(define (passing-students l)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
                  (cons
                   (first l) (passing-students (rest l)))
                    (passing-students (rest l)))]))
(check-expect (passing-students (list ren aki)) (list aki))  ;;l) ->  (passing-students (rest l))

;; 4
(define (best-student l)
  (cond [(empty? (rest l)) (first l)]
        [else (better-student (first l) (best-student (rest l)))]))
(check-expect (best-student students) mina)  ;;[(empty? l) (first l)] -> [(empty? (rest l)) (first l)]


;; 5
(define (grades l)
  (cond [(empty? l) empty]
        [else (cons (student-grade (first l))
                    (grades (rest l)))]))
(check-expect (grades (list aki sora)) (list "B" "D"))
;; [else (cons (student-grade (first l)) (rest l))])) ->
;; -> [else (cons (student-grade (first l)) (grades (rest l)))]))

 
                    

