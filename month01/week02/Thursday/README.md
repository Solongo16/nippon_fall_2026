1. (eligible? 100 90 85 90 9 10)
; (passing-average? 80 90 70)    → average3 = 93 → #t
; (good-attendance? 90)          → #t
; (assignments-complete? 9 10)   → assignment-percent = 90 → #t
; (and #t #t #t)
; → #t 2. 
(eligible? 65 70 60 60 5 10)
; (passing-average? 80 90 70)    → average3 = 65 → #f
; (good-attendance? 60)          → #f
; (assignments-complete? 5 10)   → assignment-percent = 50 → #f
; (and #f #f #f)
; → #f
