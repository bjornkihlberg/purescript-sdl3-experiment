module Data.Functor where

class Functor f where
  map :: forall a b. (a -> b) -> f a -> f b

infixl 4 map as <$>

class Functor f <= Apply f where
  apply :: forall a b. f (a -> b) -> f a -> f b
