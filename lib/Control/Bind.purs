module Control.Bind where

import Control.Apply (class Apply)
import Data.Function (flip, id)
import Data.Unit (Unit)

class Apply m <= Bind m where
  bind :: forall a b. m a -> (a -> m b) -> m b

infixl 1 bind as >>=

bindFlipped :: forall m a b. Bind m => (a -> m b) -> m a -> m b
bindFlipped = flip bind

infixr 1 bindFlipped as =<<

instance Bind ((->) r) where
  bind m f x = f (m x) x

foreign import arrayBind :: forall a b. Array a -> (a -> Array b) -> Array b

instance Bind Array where
  bind = arrayBind

class Discard a where
  discard :: forall f b. Bind f => f a -> (a -> f b) -> f b

instance Discard Unit where
  discard ma f = ma >>= f

join :: forall a m. Bind m => m (m a) -> m a
join m = m >>= id

composeKleisli :: forall a b c m. Bind m => (a -> m b) -> (b -> m c) -> a -> m c
composeKleisli f g a = f a >>= g

infixr 1 composeKleisli as >=>

composeKleisliFlipped :: forall a b c m. Bind m => (b -> m c) -> (a -> m b) -> a -> m c
composeKleisliFlipped f g a = f =<< g a

infixr 1 composeKleisliFlipped as <=<

ifM :: forall a m. Bind m => m Boolean -> m a -> m a -> m a
ifM cond t f = cond >>= \cond' -> if cond' then t else f
