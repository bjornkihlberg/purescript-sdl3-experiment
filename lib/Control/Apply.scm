#!chezscheme

(import (chezscheme)
        (utilities))

(define arrayApply
  (fn (fs xs)
    (let ([result (make-vector (* (vector-length fs) (vector-length xs)) #f)])
      (let outer-loop ([n 0] [f-i 0])
        (if (< f-i (vector-length fs))
            (let ([f (vector-ref fs f-i)])
              (do ([n n (add1 n)] [x-i 0 (add1 x-i)])
                  ((>= x-i (vector-length xs)) (outer-loop n (add1 f-i)))
                (vector-set! result n (f (vector-ref xs x-i)))))
            result)))))
