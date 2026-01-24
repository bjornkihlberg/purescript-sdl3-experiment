module Main (main, ConsoleEffect) where

import Prelude

import Data.Maybe (Maybe)
import Data.Maybe as Maybe
import Debug.Trace as Trace
import Effect (IO, Effect)
import Effect as Effect
import Foreign.Ptr as Foreign
import SDL3.Effect as SDL3.Effect
import SDL3.Init as SDL3.Init
import SDL3.Video as SDL3.Video

foreign import data ConsoleEffect :: Effect

foreign import println :: forall (e :: Row Effect).
  String -> IO (console :: ConsoleEffect | e) Unit

main :: IO (console :: ConsoleEffect, sdl3 :: SDL3.Effect.SDL3) Unit
main = Effect.do
  isSdlInit :: Boolean <- SDL3.Init.init
  mSDL3Window :: Maybe (Foreign.Ptr SDL3.Video.Window) <- SDL3.Video.createWindow "Hello, window" 800 600
  case mSDL3Window of
    Maybe.Just sdl3Window -> do
      SDL3.Video.destroyWindow (Trace.dbg sdl3Window)
    Maybe.Nothing -> Effect.pure unit
  Effect.pure $ Trace.dbg isSdlInit
  SDL3.Init.quit
