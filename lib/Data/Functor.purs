module Data.Functor where

import Data.Function (compose)

class Functor f where
  map :: forall a b. (a -> b) -> f a -> f b

infixl 4 map as <$>

class Functor f <= Apply f where
  apply :: forall a b. f (a -> b) -> f a -> f b

instance functorFn :: Functor ((->) r) where
  map = compose

foreign import arrayMap :: forall a b. (a -> b) -> Array a -> Array b

instance functorArray :: Functor Array where
  map = arrayMap
