;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Home practice|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; EX03
;; sum-positive : List-of-numbers -> Number
(define (sum a b)
  (+ a b))

(define (sum-positive l)
  (cond
    [(empty? l) 0]
    [else
       (if (positive? (first l))  ;;herev first l positive bol
           (sum (first l) (sum-positive (rest l)))  ;; first too positive bol (sum (first +  rest))
           (sum-positive (rest l)))])) ;; ugui bol (sum  (sum-positive (rest l)))

(check-expect (sum-positive empty) 0)
(check-expect (sum-positive (cons 3 (cons -2 (cons 5 empty)))) 8)


;;EX04

;; contains-zero? : List-of-numbers -> Boolean

(define (contains-zero? l)
  (cond
    [(empty? l) #f]
    [else  
       (or (= (first l) 0)
           (contains-zero? (rest l)))]))
(check-expect (contains-zero? empty) #false)
(check-expect (contains-zero? (cons 4 (cons 0 empty))) #true)
(check-expect (contains-zero? (cons 2 (cons 3 empty))) #false)


;; all-even? : List-of-numbers -> Boolean

(define (all-even? l)
   (cond
     [(empty? l) #t]
     [else
       (and (even? (first l))
            (all-even? (rest l)))]))

(check-expect (all-even? empty) #true)
(check-expect (all-even? (cons 2 (cons 4 empty))) #true)
(check-expect (all-even? (cons 2 (cons 3 empty))) #false)

;;EX06

;; any-negative? : List-of-numbers -> Boolean

(define (any-negative? l)
    (cond
      [(empty? l) #f]
      [else
        (or (negative? (first l))
            (any-negative? (rest l)))]))

(check-expect (any-negative? empty) #false)
(check-expect (any-negative? (cons 1 (cons -3 empty))) #true)

;;EX07

;; first-item : NEList-of-numbers -> Number

(define (first-item l)
   (cond
     [(empty? (rest l)) (first l)]
        [else
          (first l)]))
   
(check-expect (first-item (cons 7 empty)) 7)
(check-expect (first-item (cons 4 (cons 9 empty))) 4)

;;EX08
;; last-item : NEList-of-numbers -> Number

(define (last-item-2 l)
   (cond
     [(empty? (rest l)) (first l)]
        [else
         (last-item-2 (rest l))]))     

(check-expect (last-item-2 (cons 9 empty)) 9)
(check-expect (last-item-2 (cons 2 (cons 5 (cons 8 empty)))) 8)

;;EX09
;; sum-ne-list : NEList-of-numbers -> Number

(define (sum-ne-list l)
  (cond
    [(empty? (rest l)) (first l)]  ;; (rest l) uldsen toonuud n empty baival (first l)-iig gargana
    [else
       (sum (first l) (sum-ne-list (rest l)))]))  ;; esvel (first l) + (rest l)

(check-expect (sum-ne-list (cons 6 empty)) 6)
(check-expect (sum-ne-list (cons 2 (cons 3 (cons 4 empty)))) 9)


;;EX10

;; count-images : List-of-images -> Number
(require 2htdp/image)

(define (count-images l)
  (cond
    [(empty? l) 0]
    [else 
       (+ 1 (count-images (rest l)))]))

(check-expect (count-images empty) 0)
(check-expect (count-images
     (cons (circle 5 "solid" "red")
          (cons (circle 10 "solid" "blue") empty))) 2)

;;EX12
(define (count-positive-bug l)
  (cond
    [(empty? l) 0]
    [else
     (if (positive? (first l))
     (+ 1 (count-positive-bug (rest l)))
     (count-positive-bug (rest l)))]))

(check-expect (count-positive-bug (cons 5 (cons -1 empty))) 1)


;;EX1
;; lowest : NEList-of-numbers -> Number

(define (lowest l)
  (cond
    [(empty? (rest l))(first l)]
    [else
      (min (first l)
           (lowest (rest l)))]))

(check-expect (lowest (list 7)) 7)
(check-expect (lowest (list 8 3 9 2 5)) 2)

;; count-below : List-of-numbers Number -> Number

;;EX02
(define (count-below l limit)
  (cond
    [(empty? l) 0]
    [else
     (if (< (first l) limit)
         (+ 1 (count-below (rest l) limit))
         (count-below (rest l) limit))]))

(check-expect (count-below empty 50) 0)
(check-expect (count-below (list 10 50 70 40) 50) 2)
(check-expect (count-below (list 50 60) 50) 0)

;;EX03
;; sum-passing : List-of-numbers -> Number
(define (sum-passing l)
  (cond
    [(empty? l) 0]
    [else
      (if (>= (first l) 60)
          (sum (first l) (sum-passing (rest l)))
          (sum-passing (rest l)))]))

(check-expect (sum-passing empty) 0)
(check-expect (sum-passing (list 50 60 80 20)) 140)


;;EX04

;; count-equal : List-of-numbers Number -> Number

(define (count-equal l target)
  (cond
    [(empty? l) 0]
    [else
      (if (= (first l) target)
          (+ 1 (count-equal (rest l) target))
          (count-equal (rest l) target))]))

(check-expect (count-equal empty 5) 0)
(check-expect (count-equal (list 5 2 5 8 5) 5) 3)
(check-expect (count-equal (list 1 2 3) 9) 0)

;;EX05
;; failing-scores : List-of-numbers -> List-of-numbers

(define (failing-scores l)
    (cond
      [(empty? l) empty]
      [else
         (if (< (first l) 60)
             (cons
             (first l) (failing-scores (rest l)))
             (failing-scores (rest l)))]))
                         
(check-expect (failing-scores empty) empty)
(check-expect (failing-scores (list 40 60 20 90 59)) (list 40 20 59))

;;EX06
;; double-passing : List-of-numbers -> List-of-numbers

(define (double-passing l)
  (cond
     [(empty? l) empty]
     [else
       (if (>= (first l) 60)
           (cons (* 2 (first l))
             (double-passing (rest l)))
             (double-passing (rest l)))]))

(check-expect (double-passing (list 50 60 70 30 100)) (list 120 140 200))

;;EX07
;; remove-zeros : List-of-numbers -> List-of-numbers

(define (remove-zeros l)
   (cond
     [(empty? l) empty]
     [else
        (if (> (first l) 0)
            (cons (first l) (remove-zeros (rest l)))
            (remove-zeros (rest l)))]))            

(check-expect (remove-zeros (list 0 3 0 5 0))(list 3 5))
(check-expect (remove-zeros (list 0 0)) empty)


;;EX08
;; largest-after-first : NEList-of-numbers -> Number

(define (largest-after-first l)
   (cond
      [(empty? (rest l))(first l)]
      [else
        (max (first (rest l))
         (largest-after-first (rest l)))]))
      

(check-expect (largest-after-first (list 9 3)) 3)
(check-expect (largest-after-first (list 5 10 2 8)) 10)


;;EX09
;; all-at-least? : List-of-numbers Number -> Boolean

(define (all-at-least? l limit)
  (cond
    [(empty? l) #t]
    [else
      (and (>= (first l) limit)           ;; !!! (first l) n limitees ih baival true, daraa n uldsen toonuudiig yg ail shalga
           (all-at-least? (rest l) limit))]))

(check-expect (all-at-least? empty 60) #true)
(check-expect (all-at-least? (list 60 70 90) 60) #true)
(check-expect (all-at-least? (list 60 59 90) 60) #false)

;;EX10
;; any-perfect-score? : List-of-numbers -> Boolean

(define (any-perfect-score? l)
   (cond
     [(empty? l) #f]
     [else
       (or (= (first l) 100)
           (any-perfect-score? (rest l)))]))

(check-expect (any-perfect-score? empty) #false)
(check-expect (any-perfect-score? (list 70 100 80)) #true)
(check-expect (any-perfect-score? (list 70 99 80)) #false)

;;EX11
(require 2htdp/image)
;; score-bars-horizontal : List-of-numbers -> Image

(define (score-bars-horizontal l)
   (cond
     [(empty? l) empty-image]
     [else
      (beside
      (rectangle (first l) 15 "solid" "blue")
      (score-bars-horizontal (rest l)))]))

(check-expect (score-bars-horizontal empty) empty-image)
(check-expect (score-bars-horizontal (list 30 50))
  (beside
    (rectangle 30 15 "solid" "blue")
    (rectangle 50 15 "solid" "blue")))

;;EX12
;; passing-bars : List-of-numbers -> Image

(define (passing-bars l)
  (cond
    [(empty? l) empty-image]
    [else
      (if (>= (first l) 60)
          (above (rectangle (first l) 15 "solid" "blue")
                 (passing-bars (rest l)))
          (passing-bars (rest l)))]))

(check-expect (passing-bars empty) empty-image)
(check-expect
  (passing-bars (list 50 60 80))
  (above
    (rectangle 60 15 "solid" "blue")
    (rectangle 80 15 "solid" "blue")))
