#!chezscheme

(import (chezscheme)
        (utilities))

(define arrayBind
  (fn (xs kleisli)
    (let loop ([result-i 0] [xs-i 0] [acc '()])
      (if (< xs-i (vector-length xs))
          (let ([ys (kleisli (vector-ref xs xs-i))])
            (loop (+ result-i (vector-length ys))
                  (add1 xs-i)
                  (cons ys acc)))
          (let ([result (make-vector result-i)])
            (let loop ([result-i (sub1 result-i)] [acc acc])
              (if (null? acc)
                  result
                  (do ([i (sub1 (vector-length (car acc))) (sub1 i)]
                       [result-i result-i (sub1 result-i)])
                      ((negative? i) (loop result-i (cdr acc)))
                    (vector-set! result result-i (vector-ref (car acc) i))))))))))
