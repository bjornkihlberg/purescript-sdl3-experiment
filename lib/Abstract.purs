module Abstract where

import Control.Apply (class Apply)
import Data.Unit (Unit)

class Apply f <= Applicative f where
  pure :: forall a. a -> f a

class Apply m <= Bind m where
  bind :: forall a b. m a -> (a -> m b) -> m b

infixl 1 bind as >>=

class (Applicative m, Bind m) <= Monad m

class Discard a where
  discard :: forall f b. Bind f => f a -> (a -> f b) -> f b

instance Discard Unit where
  discard ma f = ma >>= f
