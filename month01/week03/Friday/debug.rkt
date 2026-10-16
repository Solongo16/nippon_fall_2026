;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 1.
(define (count-failing-1 l)
  (cond
    [(empty? l) 0]
        [else (if (<= (first l) 60)
                  (+ 1 (count-failing-1 (rest l)))
                  (count-failing-1 (rest l)))]))
(check-expect (count-failing-1 (list 60)) 1)  ;; ur dun: 0 -> 1


;; 2.
(define (total l)
  (cond
    [(empty? l) 0]
    [else
      (+ (first l) (total (rest l)))]))

(define (count-scores s)
  (cond
    [(empty? s) 0]
    [else
     (+ 1 (count-scores (rest s)))])) 
 
(define (average-2 l)
  (/ (total l) (count-scores l)))   ;; (rest l) -> count-scores l)
(check-expect (average-2 (list 60 80)) 70)

;; 3.
(define (passing-scores-3 l)
  (cond [(empty? l) empty]
        [else 
         (if (>= (first l) 60)
             (cons 
                 (first l) (passing-scores-3 (rest l)))
                  (passing-scores-3 (rest l)))]))   ;; (first l) (passing-scores-3 (rest l)))  ehennd bichigdene

(check-expect (passing-scores-3 (list 40 60)) (list 60))


;; 4.
(require 2htdp/image)
(define (score-bar score)
  (rectangle score 20 "solid" "green"))

(define (score-bars-4 l)
  (cond [(empty? l) empty-image]  ;;empty -> empty-image
        [else (above (score-bar (first l)) (score-bars-4 (rest l)))]))
(check-expect (score-bars-4 (list 80)) (score-bar 80)) 

