;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define (grade-color grade)
  (cond
    [(>= grade 60) "green"]
    [else "red"]))

;; pass-fail-badge : Number -> Image
(define (pass-fail-badge score)
 (circle 20
          "solid"
          (if (>= score 60)
              "green"
              "red")))
;; оноо 60 ба түүнээс дээш бол ногоон тойрог, үгүй бол улаан (радиус 20)
(check-expect (pass-fail-badge 60) (circle 20 "solid" "green"))
(check-expect (pass-fail-badge 59) (circle 20 "solid" "red"))


;; score-bar : Number -> Image
(define (score-bar score)
  (rectangle score 20 "solid" "blue"))
  
;; оноо → өргөн нь оноотой тэнцүү, өндөр 20 цэнхэр тэгш өнцөгт
(check-expect (score-bar 80) (rectangle 80 20 "solid" "blue"))
(check-expect (score-bar 0) (rectangle 0 20 "solid" "blue"))

;; three-bars : Number Number Number -> Image
(define (three-bars a b c)
  (above (score-bar 80) (score-bar 60) (score-bar 90)))
;; гурван оноог дээрээс доош баганан диаграм болгоно. score-bar-г дуудна.
(check-expect (three-bars 80 60 90)
              (above (score-bar 80) (score-bar 60) (score-bar 90)))


