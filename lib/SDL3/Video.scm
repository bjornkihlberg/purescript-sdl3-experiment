#!chezscheme

(import (chezscheme)
        (only (utilities) io-proc))

(define-ftype SDL_Window (struct))

(define-syntax SDL_WINDOW_VULKAN (identifier-syntax #x10000000))

; https://wiki.libsdl.org/SDL3/SDL_CreateWindow
(define createWindow
  (let ([get-foreign-procedure (delay (foreign-procedure "SDL_CreateWindow" (string int int int int unsigned-32) (* SDL_Window)))])
    (io-proc (title width height)
      (let ([result ((force get-foreign-procedure) title 0 0 width height SDL_WINDOW_VULKAN)])
        (if (ftype-pointer-null? result)
            'Data.Maybe.Nothing
            (vector 'Data.Maybe.Just result))))))

; https://wiki.libsdl.org/SDL2/SDL_DestroyWindow
(define destroyWindow
  (let ([get-foreign-procedure (delay (foreign-procedure "SDL_DestroyWindow" ((* SDL_Window)) void))])
    (io-proc (window)
      ((force get-foreign-procedure) window))))
