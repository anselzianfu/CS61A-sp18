(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cdr (cdr s)))
)

(define (sign x)
  'YOUR-CODE-HERE
  (cond
    ((> x 0) 1)
    ((< x 0) -1)
    (else 0)
  )
)

(define (square x) (* x x))

(define (pow b n)
  'YOUR-CODE-HERE
  (if (= n 1)
    b
    (if (even? n)
      (square (pow b (quotient n 2)))
      (* b (square (pow b (quotient n 2))))
    )
  )
)


(define (ordered? s)
  'YOUR-CODE-HERE
  (if (null? (cdr s))
    #t
    (if (< (car s) (car (cdr s))) 
      (ordered? (cdr s))
      (if (= (car s) (car (cdr s))) 
        (ordered? (cdr s))
        #f
      )
    )
  )
)

(define (nodots s)
  'YOUR-CODE-HERE
  (cond
    ((pair? s)
            (cond
              ((null? (cdr s)) (cons (nodots (car s)) (nodots (cdr s))))
              ((pair? (cdr s)) (cons (nodots (car s)) (nodots (cdr s))))
              (else (list (nodots (car s)) (nodots (cdr s))))
              ))
    (else s)
    )
)

; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) #f)
          ((> (car s) v) #f)
          ((= (car s) v) #t)
          (else (contains? (cdr s) v)) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
      ((contains? s v) s)
      ((> (car s) v) (cons v s))
      (else (cons (car s) (add (cdr s) v)))
      )
  )

(define (intersect s t)
    (cond ((or (empty? s) (empty? t)) nil)
          'YOUR-CODE-HERE
          (else
            (cond 
              ((= (car s) (car t)) (cons s (intersect (cdr s) (cdr t))))
              ((< (car s) (car t)) (intersect (cdr s) t))
              ((> (car s) (car t)) (intersect s (cdr t)))
              )
          ) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

;def union(s, t):
;    """Return a set containing all elements either in s or t.
;
;    >>> s = Link(1, Link(2, Link(3))) 
;    >>> t = adjoin(s, 4)
;    >>> union(t, s)
;    Link(4, Link(1, Link(2, Link(3))))
;    """
;    if s is Link.empty:
;        return t
;    rest = union(s.rest, t)
;    if contains(t, s.first):
;        return rest
;    else:
;        return Link(s.first, rest)

(define (union s r)
  (cond ((empty? s) r)
        ((empty? r) s)
        (else
          (cond
            ((= (car s) (car r)) (cons (car s) (union (cdr s) (cdr r))))
            ((< (car s) (car r)) (cons (car s) (union (cdr s) r)))
            ((> (car s) (car r)) (cons (car r) (union s (cdr r))))
            )
          )
    )
  )