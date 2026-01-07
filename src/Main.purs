module Main (main) where

import Prelude

import Abstract (pure)
import Effect (IO)

foreign import add1 :: Int -> Int

main :: IO Unit
main = pure unit
