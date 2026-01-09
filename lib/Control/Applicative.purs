module Control.Applicative where

import Control.Apply (class Apply, (<*>))
import Data.Unit (Unit, unit)

class Apply f <= Applicative f where
  pure :: forall a. a -> f a

instance Applicative ((->) r) where
  pure x _ = x

instance Applicative Array where
  pure x = [ x ]

liftA1 :: forall f a b. Applicative f => (a -> b) -> f a -> f b
liftA1 f a = pure f <*> a

-- | Perform an applicative action when a condition is true.
when :: forall m. Applicative m => Boolean -> m Unit -> m Unit
when true m = m
when false _ = pure unit

-- | Perform an applicative action unless a condition is true.
unless :: forall m. Applicative m => Boolean -> m Unit -> m Unit
unless false m = m
unless true _ = pure unit
