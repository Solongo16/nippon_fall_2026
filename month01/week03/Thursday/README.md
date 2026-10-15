(passing-scores (list 10 20)) =(+ 0 (passing scores (list 20))) -> = (+ 0 (passing-scores (empty)) ; 20<60 baga tul toologdohgui -> = (0 + 0) -> = empty (define (passing-scores p)
(cond
[(empty? p) empty]
[else
(if (>= (first p) 60)
(cons
(first p) (passing-scores (rest p)))
(passing-scores (rest p)))]))
(check-expect (passing-scores (list 10 20)) empty)
zassan neg aldaa :
;; 2.
(define (add-ten-all-2 l)
  (cond [(empty? l) empty]
        [else
         (cons (+ 10 (first l)) (add-ten-all-2 (rest l)))])) ;; (+ (+ 10 -> (cons (+ 10
(check-expect (add-ten-all-2 (list 1 2)) (list 11 12)) 
iluu temdegt (+10 -iig (cons -oor solison