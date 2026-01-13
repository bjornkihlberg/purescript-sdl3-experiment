module Effect where

data Effect :: Type
data Effect

foreign import data IO :: Row Effect -> Row Effect -> Type -> Type

type role IO nominal nominal representational

type IO1 e a = IO e e a

foreign import unsafeCastIO :: forall (e0 :: Row Effect) (e1 :: Row Effect) (e2 :: Row Effect) (e3 :: Row Effect) a.
  IO e0 e1 a -> IO e2 e3 a

foreign import pure :: forall a (e :: Row Effect).
  a -> IO e e a

foreign import apply :: forall a b (e0 :: Row Effect) (e1 :: Row Effect) (e2 :: Row Effect).
  IO e0 e1 (a -> b) -> IO e1 e2 a -> IO e0 e2 b

foreign import map :: forall a b (e :: Row Effect).
  (a -> b) -> IO e e a -> IO e e b

foreign import bind :: forall a b (e0 :: Row Effect) (e1 :: Row Effect) (e2 :: Row Effect).
  IO e0 e1 a -> (a -> IO e1 e2 b) -> IO e0 e2 b

foreign import discard :: forall a b (e0 :: Row Effect) (e1 :: Row Effect) (e2 :: Row Effect).
  IO e0 e1 a -> (a -> IO e1 e2 b) -> IO e0 e2 b
