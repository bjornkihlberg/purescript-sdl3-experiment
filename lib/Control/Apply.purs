module Control.Apply where

import Data.Function (const, id)
import Data.Functor (class Functor, (<$>))

class Functor f <= Apply f where
  apply :: forall a b. f (a -> b) -> f a -> f b

infixl 4 apply as <*>

instance Apply ((->) r) where
  apply f g x = f x (g x)

foreign import arrayApply :: forall a b. Array (a -> b) -> Array a -> Array b

instance Apply Array where
  apply = arrayApply

applyFirst :: forall a b f. Apply f => f a -> f b -> f a
applyFirst a b = const <$> a <*> b

infixl 4 applyFirst as <*

applySecond :: forall a b f. Apply f => f a -> f b -> f b
applySecond a b = const id <$> a <*> b

infixl 4 applySecond as *>

lift2 :: forall a b c f. Apply f => (a -> b -> c) -> f a -> f b -> f c
lift2 f a b = f <$> a <*> b

lift3 :: forall a b c d f. Apply f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
lift3 f a b c = f <$> a <*> b <*> c

lift4 :: forall a b c d e f. Apply f => (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e
lift4 f a b c d = f <$> a <*> b <*> c <*> d

lift5 :: forall a b c d e f g. Apply f => (a -> b -> c -> d -> e -> g) -> f a -> f b -> f c -> f d -> f e -> f g
lift5 f a b c d e = f <$> a <*> b <*> c <*> d <*> e
