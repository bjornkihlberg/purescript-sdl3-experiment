#!chezscheme

(import (chezscheme)
        (utilities))

(define println (io-proc (s) (display s) (newline)))
