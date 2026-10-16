NElist n suuliin too n empty baih buyu, gantshan too listend baih uyd (first l)-iig duuddag uchir highest, average deer olon ashiglagdana. 2. ooroo bichsen function :  ;; Score-analyzer ooriin 2 list code:
;; count-passing : List-of-numbers -> Number
(define (count-passing s)
  (cond
    [(empty? s) 0]
    [else
     (if (>= (first s) 60)
     (+ 1 (count-passing (rest s)))
     (count-passing (rest s)))]))
          
;; 60 ба түүнээс дээш онооны тоо
(check-expect (count-passing (list 66 75 98 100 75)) 5)
(check-expect (count-passing (list 60 59)) 1)    
