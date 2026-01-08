#!chezscheme

(import (chezscheme)
        (Data.Function))

(assert (equal? ((Data.Function.const 4) 7) 4))
(assert (equal? ((Data.Function.apply add1) 7) 8))

(assert (equal? (((Data.Function.compose add1) exact->inexact) 9) 10.0))
(assert (equal? (((Data.Function.compose add1) (lambda (x) (* x 2))) 9) 19))
(assert (equal? (((Data.Function.composeFlipped add1) (lambda (x) (* x 2))) 9) 20))
