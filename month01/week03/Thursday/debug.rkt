;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 1.
(define (double-all-1 l)
  (cond [(empty? l) empty] ;;0 -> empty
        [else (cons (* 2 (first l)) (double-all-1 (rest l)))]))
(check-expect (double-all-1 (list 1 2)) (list 2 4))

;; 2.
(define (add-ten-all-2 l)
  (cond [(empty? l) empty]
        [else
         (cons (+ 10 (first l)) (add-ten-all-2 (rest l)))])) ;; (+ (+ 10 -> (cons (+ 10
(check-expect (add-ten-all-2 (list 1 2)) (list 11 12))

;; 3.
(define (only-positive-3 l)
  (cond [(empty? l) empty]
        [else (if (positive? (first l))
                  (cons (first l) (only-positive-3 (rest l)))
                  (only-positive-3 (rest l)))])) ;; empty) -> (only-positive-3 (rest l)))
(check-expect (only-positive-3 (list -1 5)) (list 5))

;; 4.
(define (only-positive-4 l)
  (cond [(empty? l) empty]
        [else (if (positive? (first l))
                  (cons (first l) (only-positive-4 (rest l)))
                  (only-positive-4 (rest l)))]))  ;; (cons (first l)  baihgui
(check-expect (only-positive-4 (list -1 5)) (list 5))

;; 5.
(define (cap-at-100-5 l)
  (cond [(empty? l) empty]
        [else (cons
               (min (first l) 100) (cap-at-100-5 (rest l)))]))  ;; max -> min
(check-expect (cap-at-100-5 (list 50 150)) (list 50 100))