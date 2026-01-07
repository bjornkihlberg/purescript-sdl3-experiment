module Data.Function where

const :: forall a b. a -> b -> a
const a _ = a

compose :: forall a b c. (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)

composeFlipped :: forall a b c. (a -> b) -> (b -> c) -> a -> c
composeFlipped g f x = f (g x)

infixr 9 compose as <<<
infixr 9 composeFlipped as >>>
