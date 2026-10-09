(define (sum3 a b c) (+ a b c))
(define (average3 a b c) (/ (sum3 a b c) 3))
(define (assignment-percent completed total)
  (* (/ completed total) 100))
pureviin code-oos ylgaatai: (define (ineligibility-reason s1 s2 s3 attendance completed total)
  (cond
    [(not (passing-average? s1 s2 s3)) "Low score"]
    [(not (good-attendance? attendance)) "Low attendance"]
    [(not (assignments-complete? completed total)) "Missing assignments"]
    [else "Eligible"]))
zassan aldaa: huvi urvuu, dundaj shalgaagui, neg shalguur baihgui, bair n soligdson, oroltiin too buruu, daraalal buruu
amaar tailbarlasan: function n oroltiig huleen ach todorhoilson todorhoiloltiin daguu zov hariug gargadag
signature n functionii orolt bolon garaltiin torol
(define (average3 a b c)
  (/ (+ a b c) 3))
  (average3 80 90 70)
↓
(/ (+ 80 90 70) 3)
↓
(/ 240 3)
↓
80
test: (check-expect (average 60 60 60) 60)