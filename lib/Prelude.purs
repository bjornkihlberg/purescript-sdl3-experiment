module Prelude where

import Abstract (class Discard, (>>=))

foreign import data Unit :: Type

foreign import unit :: Unit

instance Discard Unit where
  discard ma f = ma >>= f
