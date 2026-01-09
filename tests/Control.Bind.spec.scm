#!chezscheme

(import (chezscheme)
        (Control.Bind))

(assert (equal? ((Control.Bind.arrayBind '#(1 2 3)) (lambda (#:_) '#())) '#()))
(assert (equal? ((Control.Bind.arrayBind '#(1 2 3)) (lambda (x) `#(,x))) '#(1 2 3)))
(assert (equal? ((Control.Bind.arrayBind '#(1 2 3)) (lambda (x) `#(,x ,(add1 x)))) '#(1 2 2 3 3 4)))
(assert (equal? ((Control.Bind.arrayBind '#(1 2 3)) (lambda (x) `#(,x ,(add1 x) x))) '#(1 2 x 2 3 x 3 4 x)))
