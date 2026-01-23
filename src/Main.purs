module Main (main, ConsoleEffect) where

import Prelude

import Effect (IO, IO1, Effect)
import Effect as Effect
import Prim.Row (class Lacks)
import SDL3.Effect as SDL3.Effect
import SDL3.Init as SDL3.Init

foreign import data ConsoleEffect :: Effect
foreign import data HELLO :: Effect

foreign import println :: forall (e :: Row Effect).
  String -> IO1 (console :: ConsoleEffect | e) Unit

hello :: forall e. Lacks "hello" e => String -> IO (console :: ConsoleEffect | e) (hello :: HELLO, console :: ConsoleEffect | e) Unit
hello = Effect.unsafeCastIO <<< println

talk :: forall e. String -> IO1 (hello :: HELLO, console :: ConsoleEffect | e) Unit
talk = Effect.unsafeCastIO <<< println

bye :: forall e. Lacks "hello" e => String -> IO (hello :: HELLO, console :: ConsoleEffect | e) (console :: ConsoleEffect | e) Unit
bye = Effect.unsafeCastIO <<< println

main :: IO1 (console :: ConsoleEffect, sdl3 :: SDL3.Effect.SDL3) Unit
main = Effect.do
  SDL3.Init.init
  hello "world"
  talk "blah blah"
  talk "blah blah"
  println "Huey"
  println "Dewey"
  talk "blah blah"
  println "Louie"
  bye "world"
  SDL3.Init.quit
