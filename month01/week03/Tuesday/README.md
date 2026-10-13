Base case n undsen duudlaga. Recursive case n function ooriigoo dahin duudaj bodlogiig urgeljluuleh 2) (define (count-items numbers)
  (cond
    [(empty? numbers) 0]
    [else (+ 1 
             (count-items (rest numbers)))]))          (check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)
