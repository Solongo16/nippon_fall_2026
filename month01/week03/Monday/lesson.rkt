;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; List

;; хоосон list
(define no-scores empty)

no-scores
;; 1 элементтэй list: 70, дараа нь хоосон
(define one-score (cons 70 empty))
one-score

;; 3 элементтэй list: 70, 82, 95 //cons n 2 argument avch baigaa
(define scores (cons 70 (cons 82 (cons 95 empty))))
scores

;; Hamgiin ehnii element oloh
(first scores)
(rest scores)
;; 2dahi hevleh
(first (rest scores))
(empty? scores) ;; empty uyd true
(cons? scores) ;; ogogdol baigaa uyd true

;;Exercies
(define temperatures (cons 18 (cons 25 (cons 70 (cons 15 empty)))))
(check-expect (first temperatures) 18)
(check-expect (first (rest (rest temperatures))) 70)

;;Exercises2
(define numbers (cons 12
                      (cons 24
                            (cons 36
                                  (cons 48 empty)))))

(check-expect(first numbers) 12)
(check-expect (first (rest numbers)) 24)
(check-expect (first (rest (rest numbers))) 36)
(check-expect (rest numbers) 
                      (cons 24
                            (cons 36
                                  (cons 48 empty))))
(check-expect (empty? numbers) #f)
(check-expect (cons? numbers) #t)


(define subjects (cons "Math"
                       (cons "Physics"
                             (cons "Programming"
                                   (cons "English" empty)))))

(define (second-subject list)
  (first (rest list)))


(check-expect (second-subject (cons "Math" (cons "Physics" empty)))
"Physics")

(check-expect (second-subject (cons "A" (cons "B" (cons "C" empty))))
"B")

;;Exercise 4A
(define temps (cons -5 (cons 0 (cons 12 empty))))
(check-expect (first temps) -5)
(check-expect (first (rest (rest temps))) 12)

