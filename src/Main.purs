module Main (main) where

import Prelude
import Abstract (discard)
import Effect (IO)

foreign import hello :: String -> IO Unit

main :: IO Unit
main = do
  hello "huey"
  hello "dewey"
  hello "louie"
