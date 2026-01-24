module SDL3.Init
  ( init
  , quit
  ) where

import Prelude

import Effect (Effect, IO)
import SDL3.Effect (SDL3)

foreign import init :: forall (e :: Row Effect).
  IO (sdl3 :: SDL3 | e) Boolean

foreign import quit :: forall (e :: Row Effect).
  IO (sdl3 :: SDL3 | e) Unit
