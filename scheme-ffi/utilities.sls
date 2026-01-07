#!chezscheme

(library (utilities)
  (export io-proc
          fn)

  (import (chezscheme))

  (define-syntax io-proc
    (syntax-rules ()
      [(_ () body body* ...)
        (lambda ()
          body body* ...)]

      [(_ (x xs ...) body body* ...)
        (lambda (x)
          (io-proc (xs ...) body body* ...))]))

  (define-syntax fn
    (syntax-rules ()
      [(_ (x) body body* ...)
        (lambda (x) body body* ...)]

      [(_ (x x+ ...) body body* ...)
        (lambda (x) (fn (x+ ...) body body* ...))])))
