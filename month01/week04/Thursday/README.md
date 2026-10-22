(define (failing-students s)
(cond
[(empty? s) empty]
[else
(if (passing? (first s))
(failing-students (rest s))
(cons (first s)
(failing-students (rest s))))]))
->
[(empty? s) empty] jagsaalt hooson eseh shalgana
(passing? (first s)) ehnii oyutan tentsen eseh
(if (passing? (first s))
(failing-students (rest s))
...) tentsen bol algasna
(cons (first s)
(failing-students (rest s))) tentseegui bol jagsaaltand nemne

(define (count-failing l)
(- (count-students l) (count-passing l)))
-> buh suragchdiin toonoos tentsen suragchdiin toog hasna