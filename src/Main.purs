module Main (main, ConsoleEffect) where

import Prelude

import Effect (IO, Effect)
import Effect as Effect
import SDL3.Effect as SDL3.Effect
import SDL3.Init as SDL3.Init

foreign import data ConsoleEffect :: Effect

foreign import println :: forall (e :: Row Effect).
  String -> IO (console :: ConsoleEffect | e) Unit

hello :: forall e. String -> IO (console :: ConsoleEffect | e) Unit
hello = Effect.unsafeCastIO <<< println

talk :: forall e. String -> IO (console :: ConsoleEffect | e) Unit
talk = Effect.unsafeCastIO <<< println

bye :: forall e. String -> IO (console :: ConsoleEffect | e) Unit
bye = Effect.unsafeCastIO <<< println

main :: IO (console :: ConsoleEffect, sdl3 :: SDL3.Effect.SDL3) Unit
main = Effect.do
  _ :: Boolean <- SDL3.Init.init
  hello "world"
  talk "blah blah"
  talk "blah blah"
  println "Huey"
  println "Dewey"
  talk "blah blah"
  println "Louie"
  bye "world"
  SDL3.Init.quit
