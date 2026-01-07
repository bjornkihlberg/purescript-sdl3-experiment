#!chezscheme

(import (chezscheme)
        (utilities))

(define arrayMap (fn (f xs) (vector-map f xs)))
