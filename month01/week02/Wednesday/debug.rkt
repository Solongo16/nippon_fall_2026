;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 1. Хаалт дутуу
(define (shipping-fee-1 amount)
  (if (>= amount 50000) 0 3000))
(check-expect (shipping-fee-1 100) 3000)

;; 2. cond-ийн дараалал буруу
(define (speed-label-2 speed)
  (cond
    [(>= speed 60) "fast"]
    [(>= speed 30) "normal"]
    [else "slow"]))
(check-expect (speed-label-2 70) "fast")

;; 3. else байхгүй, нэг тохиолдол дутуу
(define (battery-label-3 percent)
  (cond
    [(=  percent 100) "full"]
    [(<= percent 50) "ok"]
    [(<= percent 10) "low"]
    [else "empty"]))
(check-expect (battery-label-3 100) "full")

;; 4. Хил 80 буруу branch-д орсон
(define (good-attendance-4? attendance)
  (>= attendance 80))
(check-expect (good-attendance-4? 80) #t)

;; 5. and, or сольсон
(define (eligible-basic-5? score attendance)
  (and (>= score 60) (>= attendance 80)))
(check-expect (eligible-basic-5? 40 90) #f)