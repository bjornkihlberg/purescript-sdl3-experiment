module SDL3.Init
  ( init
  , quit
  ) where

import Prelude

import Effect (Effect, IO, IO1)
import Effect as Effect
import Prim.Row (class Lacks)
import SDL3.Effect (SDL3, SDL3Init)

foreign import sdlInit :: forall (e :: Row Effect).
  IO1 e Boolean

foreign import sdlQuit :: forall (e :: Row Effect).
  IO1 e Unit

init :: forall (e :: Row Effect). Lacks "sdl3_init" e => IO (sdl3 :: SDL3 | e) (sdl3_init :: SDL3Init, sdl3 :: SDL3 | e) Boolean
init = Effect.unsafeCastIO sdlInit

quit :: forall (e :: Row Effect). IO (sdl3_init :: SDL3Init, sdl3 :: SDL3 | e) (sdl3 :: SDL3 | e) Unit
quit = Effect.unsafeCastIO sdlQuit
