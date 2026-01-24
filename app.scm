#!chezscheme

(import (chezscheme)
        (Main))

(load-shared-object "libSDL3.so")

(assert (foreign-entry? "SDL_Init"))
(assert (foreign-entry? "SDL_Quit"))
(assert (foreign-entry? "SDL_CreateWindow"))
(assert (foreign-entry? "SDL_DestroyWindow"))

(format #t "result: ~s\n" (Main.main))
