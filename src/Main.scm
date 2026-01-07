#!chezscheme

(import (chezscheme)
        (utilities))

(define hello (io-proc (x) (format #t "Hello, ~a!\n" x)))
