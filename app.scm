#!chezscheme

(import (chezscheme)
        (Main))

(load-shared-object "libSDL3.so")

(assert (foreign-entry? "SDL_Init"))
(assert (foreign-entry? "SDL_Quit"))

(format #t "result: ~s\n" (Main.main))
