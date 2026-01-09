module Data.Functor where

import Data.Function (compose, const)
import Data.Unit (Unit, unit)

class Functor f where
  map :: forall a b. (a -> b) -> f a -> f b

infixl 4 map as <$>

instance Functor ((->) r) where
  map = compose

foreign import arrayMap :: forall a b. (a -> b) -> Array a -> Array b

instance Functor Array where
  map = arrayMap

void :: forall f a. Functor f => f a -> f Unit
void = map (const unit)

voidRight :: forall f a b. Functor f => a -> f b -> f a
voidRight x = map (const x)

infixl 4 voidRight as <$
