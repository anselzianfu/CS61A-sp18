(define (find s predicate)
  ;'YOUR-CODE-HERE
  (if (null? s) #f 
      (if (predicate (car s)) 
           (car s)
           (find (cdr-stream s) predicate)
      	   )
  	)
)

(define (scale-stream s k)
  ;'YOUR-CODE-HERE
  (cons-stream (* k (car s)) (scale-stream (cdr-stream s) k))
  	
)

(define (has-cycle s)
  ;'YOUR-CODE-HERE
  (define (check original cur)
  	(if (null? cur) #f 
        (if (eq? original (cdr-stream cur))
             #t
             (check cur (cdr-stream cur))
        	)
  		)
  	)
  (check s s)
)
(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)

(define (travers_and_compare lst target)
  (if (eq? (car lst) target) #t
       (if (null? lst) #f
      (travers_and_compare (cdr lst) target))))