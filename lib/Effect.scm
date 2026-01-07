#!chezscheme

(import (chezscheme)
        (utilities))

(define ioPure (io-proc (x) x))

(define ioApply (io-proc (mf ma) ((mf) (ma))))

(define ioMap (io-proc (f ma) (f (ma))))

(define ioBind (io-proc (ma f) ((f (ma)))))
