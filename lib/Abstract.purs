module Abstract where

class Functor f where
  map :: forall a b. (a -> b) -> f a -> f b

infixl 4 map as <$>
class Functor f <= Apply f where
  apply :: forall a b. f (a -> b) -> f a -> f b

class Apply f <= Applicative f where
  pure :: forall a. a -> f a

class Apply m <= Bind m where
  bind :: forall a b. m a -> (a -> m b) -> m b

infixl 1 bind as >>=

class (Applicative m, Bind m) <= Monad m

class Discard a where
  discard :: forall f b. Bind f => f a -> (a -> f b) -> f b
