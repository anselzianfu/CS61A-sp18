(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (if (null? rests) nil (cons (cons first (car rests)) (cons-all first (cdr rests))))
  )

(define (zip pairs)
  ;'replace-this-line
(if (null? pairs) (list nil nil) (if(null? (car pairs)) nil (cons (map car pairs) (zip (map cdr pairs)))))
  )

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define (enum s idx) (if (null? s) nil (cons (cons idx (cons (car s) nil)) (enum (cdr s) (+ idx 1)) )))
  (enum s 0)
  )
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  
  
  (cond 
        ((null? denoms) nil)
        ((> total (car denoms)) (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms)) (list-change total (cdr denoms))) ) 
        ((= total (car denoms)) (cons (cons (car denoms) nil) (list-change total (cdr denoms) ) ) )
        (else (list-change total (cdr denoms)))
    )
  
    
       
)
  
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         ;'replace-this-line
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         ;'replace-this-line
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           ;'replace-this-line
           (if (null? (cdr body))
            (cons form (cons params (cons (car body) nil)))
            (cons form (cons params (cons (car body) (cons (let-to-lambda (cadr body)) nil))))
            )
            
            
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           ;'replace-this-line
           (cons (cons 'lambda (list (car (zip values))  (let-to-lambda (car body)) )) (map let-to-lambda (cadr (zip values))))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
         ;'replace-this-line
         (list (car expr) (let-to-lambda (cadr expr)) (let-to-lambda (car (cddr expr))))
         ; END PROBLEM 19
         )))
