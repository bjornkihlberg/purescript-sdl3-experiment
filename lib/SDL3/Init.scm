#!chezscheme

(import (chezscheme)
        (only (utilities) io-proc))

(define-ftype stdbool unsigned-8)

(define-syntax SDL_INIT_VIDEO (identifier-syntax #x00000020))

; https://wiki.libsdl.org/SDL3/SDL_Init
(define init
  (let ([get-foreign-procedure (delay (foreign-procedure "SDL_Init" (unsigned-32) stdbool))])
    (io-proc ()
      (positive? ((force get-foreign-procedure) SDL_INIT_VIDEO)))))

; https://wiki.libsdl.org/SDL3/SDL_Quit
(define quit
  (let ([get-foreign-procedure (delay (foreign-procedure "SDL_Quit" () void))])
    (io-proc ()
      ((force get-foreign-procedure)))))
