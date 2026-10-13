;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ex
;; List яг хоёр элементтэй эсэх
;; exactly-two? : List-of-numbers -> Boolean
;; List яг хоёр элементтэй бол #true буцаана.
;; Tip: cons ашиглах
;; Гурван нөхцөлийг шалгана.
;; 1. List хоосон биш.
;; 2. Эхний элементийн дараа бас нэг элемент байна.
;; 3. Хоёр дахь элементийн дараа list хоосон байна.

(define (exactly-two? numbers)
  (and
   (cons? numbers)
   (cons? (rest numbers))
   (empty? (rest (rest numbers)))))

(check-expect (exactly-two? empty) #false)

(check-expect
  (exactly-two? (cons 5 empty))
  #false)

(check-expect
  (exactly-two? (cons 5 (cons 10 empty)))
  #true)

(check-expect
  (exactly-two? (cons 5 (cons 10 (cons 15 empty))))
  #false)

;; Ex05
;; first-three-total : List-of-numbers -> Number
;; List-ийн эхний гурван элементийн нийлбэрийг буцаана.
;; List дор хаяж гурван элементтэй байна.
(define (first-three-total prices)
  (+ (first prices)
     (first (rest prices))
     (first (rest (rest prices)))))
(define prices
  (cons 2500
    (cons 4000
      (cons 1500 empty))))

(check-expect (first-three-total prices) 8000)

(check-expect
  (first-three-total (cons 100 (cons 200 (cons 300 empty))))
  600)


;; 100 elements prices?
;; recursive function 

;; fun-for-lon : List-of-numbers -> ???
(define (fun-for-lon l)
  (cond
    [(empty? l) ...]
    [else (... (first l)
               ... (fun-for-lon (rest l)) ...)]))


;; sum : List-of-numbers -> Number
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum (rest l)))]))
;; бүх тооны нийлбэр
(check-expect (sum empty) 0)
(check-expect (sum (cons 1 (cons 2 (cons 3 empty)))) 6)

;;multiply: List-of-numbers ->Number
(define (multiply l)
    (cond
    [(empty? l) 1]
    [else (* (first l)
             (multiply (rest l)))]))

(check-expect (multiply empty) 1)
(check-expect (multiply (cons 1 (cons 2 (cons 3 empty)))) 6)
(check-expect (multiply (cons 1 (cons 2 (cons 3 (cons 4 empty))))) 24)

;;EX01
;;count-words : List-of-strings -> Number
(define (count-words words)
    (cond
    [(empty? words) 0]
    [else (+ 1
               (count-words (rest words)))]))

(check-expect (count-words empty) 0)
(check-expect (count-words (cons "hello" empty)) 1)
(check-expect (count-words (cons "hello" (cons "world" empty))) 2)
(check-expect (count-words (cons "I" (cons "love" (cons "Racket" empty)))) 3)

;;EX02
;; contains-word? : String List-of-strings -> Boolean
;; haij baigaa ug jagsaaltad baigaa eseh
(define (contains-word? word words)
    (cond
    [(empty? words) #f]
    [(string=? word (first words)) #t]
    [else (contains-word? word (rest words))]))    

(check-expect (contains-word? "cat" empty) #false)
(check-expect (contains-word? "cat" (cons "cat" empty)) #true)
(check-expect (contains-word? "dog" (cons "cat" (cons "dog" empty))) #true)
(check-expect (contains-word? "bird" (cons "cat" (cons "dog" empty))) #false)

;;EX03
(define (count-long-words words)
    (cond
    [(empty? words) 0]
    [ (>= (string-length (first words)) 5)
            (+ 1 (count-long-words (rest words)))]
         [else (count-long-words (rest words))])) 


;; 5 buyu tuunees olon temdegtei ugsiin too?
(check-expect (count-long-words empty) 0)
(check-expect (count-long-words (cons "cat" empty)) 0)
(check-expect (count-long-words (cons "apple" empty)) 1)
(check-expect (count-long-words (cons "apple" (cons "hi" (cons "banana" empty)))) 2)
(check-expect (count-long-words (cons "hello" (cons "world" (cons "Racket" empty)))) 3)

;;EX04
(define (count-completed booleans)
  (cond
    [(empty? booleans) 0]
    [(first booleans) ;; ehniih n true baih ym bol 
         (+ 1 (count-completed (rest booleans)))] ;;busad booleans deeree negiig nemeed yvna
    [else (count-completed (rest booleans))]))
  

(check-expect (count-completed empty) 0)
(check-expect (count-completed (cons #true empty)) 1)
(check-expect (count-completed (cons #false empty)) 0)
(check-expect (count-completed (cons #true (cons #false empty))) 1)
(check-expect (count-completed (cons #true (cons #true (cons #false (cons #true empty))))) 3)
(check-expect (count-completed (cons #false (cons #false (cons #false empty)))) 0)

;;EX04A
;; count-items : List-of-numbers -> Number
(define (count-items numbers)
  (cond
    [(empty? numbers) 0]
    [else (+ 1 
             (count-items (rest numbers)))]))
;; элементийн тоо
(check-expect (count-items empty) 0)
(check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)


;; product : List-of-numbers -> Number
(define (product p)
  (cond
    [(empty? p) 1]
    [else (* (first p)
              (product (rest p)))]))
;; бүх тооны үржвэр. Хоосон list-ийн үржвэр 1 (0 биш!) — яагаад?
(check-expect (product empty) 1)
(check-expect (product (cons 2 (cons 3 (cons 4 empty)))) 24)

;; contains-zero? : List-of-numbers -> Boolean
(define (contains-zero? number)
  (cond
    [(empty? number) #f]
    [else
     (or (= (first number) 0)
        (contains-zero? (rest number)))]))
;; list дотор 0 байвал #t. or ашигла.
(check-expect (contains-zero? empty) #f)
(check-expect (contains-zero? (cons 1 (cons 0 empty))) #t)
(check-expect (contains-zero? (cons 1 (cons 2 empty))) #f)

;;EX05
;;join words buh ugiig zaigaar tusgaarlan holbono

(define (join-words words)
  (cond
    [(empty? words) ""]
    [(empty? (rest words))  ;;Эхлээд шалгана: (rest words) → empty Тэгэхээр: (empty? (rest words)) → #true
     (first words)] 
    [else (string-append (first words)" "(join-words (rest words)))]))


(check-expect (join-words empty) "")
(check-expect (join-words (cons "Hello" empty)) "Hello")
(check-expect (join-words (cons "Hello" (cons "world" empty))) "Hello world")
(check-expect (join-words (cons "I" (cons "love" (cons "Racket" empty)))) "I love Racket")

;;EX05
;; count-even : List-of-numbers -> Number
(define (count-even numbers)
  (cond
    [(empty? numbers) 0]
    [else (if (even? (first numbers))
          (+ 1 (count-even (rest numbers)))
          (count-even (rest numbers)))]))
;; тэгш тоонуудын тоо
(check-expect (count-even empty) 0)
(check-expect (count-even (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 3)
(check-expect (count-even (cons 1 (cons 3 empty))) 0)

;; count-negative : List-of-numbers -> Number
(define (count-negative numbers)
  (cond
    [(empty? numbers) 0]
    [else (if (negative? (first numbers))
          (+ 1 (count-negative (rest numbers)))
          (count-negative (rest numbers)))]))

;; сөрөг тоонуудын тоо (0 сөрөг биш)
(check-expect (count-negative (cons -1 (cons 0 (cons -3 empty)))) 2)

;;EX06
(require 2htdp/image)
(define (draw-all image)
  (cond
    [(empty? image) empty-image]
    [else (beside (first image)(draw-all (rest image)))]))
  
;; draw-all : List-of-images -> Image
;; бүх зургийг зүүнээс баруун тийш тавина
(check-expect (draw-all empty) empty-image)
(check-expect (draw-all (cons (circle 20 "solid" "red")
                              (cons (rectangle 40 40 "solid" "blue") empty)))
              (beside (circle 20 "solid" "red") (rectangle 40 40 "solid" "blue")))

;;EX07
;; 1. Base case байхгүй
(define (sum-1 l)
  (cond
  [(empty? l) 0]
  [else (+ (first l)
           (sum-1 (rest l)))]))

(check-expect (sum-1 (cons 1 (cons 2 empty))) 3)

;; 2. Base case-ийн утга буруу
(define (sum-2 l)
  (cond [(empty? l) 0]
        [else (+ (first l) (sum-2 (rest l)))]))

(check-expect (sum-2 (cons 1 (cons 2 empty))) 3)

;; 3. count-items 1-ийн оронд first-ийг нэмж байна
(define (count-items-3 l)
  (cond [(empty? l) 0]
        [else (+ 1 (count-items-3 (rest l)))]))
(check-expect (count-items-3 (cons 7 (cons 8 empty))) 2)

;; 4. Recursive call жижиг бодлого дээр очихгүй байна (Stop товч!)
(define (count-positive-4 l)
  (cond [(empty? l) 0]
        [(positive? (first l)) (+ 1 (count-positive-4 (rest l)))]
        [else (count-positive-4 (rest l))]))
(check-expect (count-positive-4 (cons 5 (cons -1 empty))) 1)