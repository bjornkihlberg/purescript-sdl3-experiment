#!chezscheme

(import (except (chezscheme) apply map)
        (utilities))

(define (unsafeCastIO x) x)

(define pure (io-proc (x) x))

(define apply (io-proc (mf ma) ((mf) (ma))))

(define map (io-proc (f ma) (f (ma))))

(define bind (io-proc (ma f) ((f (ma)))))

(define discard bind)
