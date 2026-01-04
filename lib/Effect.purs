module Effect where

import Abstract

foreign import data IO :: Type -> Type

type role IO representational

foreign import ioPure :: forall a. a -> IO a

foreign import ioApply :: forall a b. IO (a -> b) -> IO a -> IO b

foreign import ioMap :: forall a b. (a -> b) -> IO a -> IO b

foreign import ioBind :: forall a b. IO a -> (a -> IO b) -> IO b

class Monad m <= MonadIO m where
  liftIO :: forall a. IO a -> m a

instance Functor IO where
  map = ioMap

instance Apply IO where
  apply = ioApply

instance Applicative IO where
  pure = ioPure

instance Bind IO where
  bind = ioBind
