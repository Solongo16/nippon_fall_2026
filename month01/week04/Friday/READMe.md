(define-struct student (name quiz project))

(define sora (make-student "Sora" 60 60))
(define ren (make-student "Ren" 45 55))
(define aki (make-student "Aki" 80 90))
(define mina (make-student "Mina" 95 91))
(define Zen (make-student "Zen" 60 60))
(define Ben (make-student "Ben" 70 70))

(define my-class (list aki sora mina ren
                      (make-student "Ben" 70 70)
                      (make-student "Zen" 60 60)))

;;final-score?
(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))


(define students (list aki sora mina ren))

;;count-student
(define (count-students s)
  (cond
    [(empty? s) 0]
    [else
      (+ 1 (count-students (rest s)))]))

;; count-passing : List-of-students -> Number
(define (count-passing student)
  (cond
    [(empty? student) 0]
    [else
     (if
      (>= (final-score (first student)) 60)
      (+ 1 (count-passing (rest student)))   
     (count-passing (rest student)))]))

(check-expect (count-passing my-class) 5)

;; better-student : Student Student -> Student
(define (better-student s1 s2)
  (if
  (>= (final-score s1) (final-score s2))
  s1
  s2))
 ;; best-student : NEList-of-students -> Student
(define (best-student s)
  (cond
    [(empty? (rest s)) (first s)]
     [else
       (better-student (first s)
       (best-student (rest s)))]))
(check-expect (best-student my-class) mina)

;;average-final
(define (total-final t)
  (cond
      [(empty? t) 0]
      [else
        (+ (final-score (first t))
           (total-final (rest t)))]))
(define (average-final a)
     (/ (total-final a) (count-students a)))

(check-expect (average-final my-class) 69.93)

(define (failing-students s)
  (cond [(empty? s) empty]
        [else (if (passing? (first s))
           (failing-students (rest s))
           (cons (first s) (failing-students (rest s))))]))

(check-expect (failing-students my-class) (list ren))