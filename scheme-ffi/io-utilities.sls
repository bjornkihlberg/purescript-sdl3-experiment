#!chezscheme

(library (io-utilities)
  (export io-proc)

  (import (chezscheme))

  (define-syntax io-proc
    (syntax-rules ()
      [(_ () body body* ...)
        (lambda ()
          body body* ...)]

      [(_ (x xs ...) body body* ...)
        (lambda (x)
          (io-proc (xs ...) body body* ...))])))
