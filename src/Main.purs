module Main (main) where

import Prelude

import Effect (IO)

foreign import add1 :: Int -> Int

main :: IO Unit
main = void $ pure 42
