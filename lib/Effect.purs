module Effect where

data Effect :: Type
data Effect

foreign import data IO :: Row Effect -> Type -> Type

type role IO nominal representational

foreign import unsafeCastIO :: forall (e0 :: Row Effect) (e1 :: Row Effect) a.
  IO e0 a -> IO e1 a

foreign import pure :: forall a (e :: Row Effect).
  a -> IO e a

foreign import apply :: forall a b (e :: Row Effect).
  IO e (a -> b) -> IO e a -> IO e b

foreign import map :: forall a b (e :: Row Effect).
  (a -> b) -> IO e a -> IO e b

foreign import bind :: forall a b (e :: Row Effect).
  IO e a -> (a -> IO e b) -> IO e b

foreign import discard :: forall a b (e :: Row Effect).
  IO e a -> (a -> IO e b) -> IO e b
