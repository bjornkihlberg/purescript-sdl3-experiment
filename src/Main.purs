module Main (main) where

import Abstract (pure)
import Data.Functor (map)
import Effect (IO)

foreign import add1 :: Int -> Int

main :: IO (Array Int)
main = pure (map add1 [1, 2, 3])
