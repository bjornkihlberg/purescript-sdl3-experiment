module Control.Monad where

import Control.Applicative (class Applicative, unless, when)
import Control.Bind (class Bind, bind)
import Data.Unit (Unit)

class (Applicative m, Bind m) <= Monad m

instance Monad ((->) r)

instance Monad Array

whenM :: forall m. Monad m => m Boolean -> m Unit -> m Unit
whenM mb m = do
  b <- mb
  when b m

unlessM :: forall m. Monad m => m Boolean -> m Unit -> m Unit
unlessM mb m = do
  b <- mb
  unless b m
