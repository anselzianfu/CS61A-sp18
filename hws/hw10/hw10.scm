(define (accumulate combiner start n term)
  (if (= n 0)
      start
      ;'YOUR-CODE-HERE
      (accumulate combiner (combiner (term n) start) (- n 1) term)
  )
)

(define (accumulate-tail combiner start n term)
  (if (= n 0)
      start
      ;'YOUR-CODE-HERE
      (accumulate-tail combiner (combiner (term n) start) (- n 1) term)
  )
)

(define-macro (list-of expr for var in seq if filter-fn)
  ;'YOUR-CODE-HERE
  (list  'map (list 'lambda (list var) expr)  (list 'filter (list 'lambda (list var) filter-fn) seq))
)