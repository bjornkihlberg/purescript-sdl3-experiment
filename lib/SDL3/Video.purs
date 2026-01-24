module SDL3.Video where

import Prelude

import Data.Maybe (Maybe)
import Effect (Effect, IO)
import Foreign.Ptr (Ptr)
import SDL3.Effect (SDL3)

foreign import data Window :: Type

foreign import createWindow :: forall (e :: Row Effect).
  String -> Int -> Int -> IO (sdl3 :: SDL3 | e) (Maybe (Ptr Window))

foreign import destroyWindow :: forall (e :: Row Effect).
  (Ptr Window) -> IO (sdl3 :: SDL3 | e) Unit
