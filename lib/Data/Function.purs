module Data.Function where

const :: forall a b. a -> b -> a
const a _ = a

apply :: forall a b. (a -> b) -> a -> b
apply f x = f x

infixr 0 apply as $

compose :: forall a b c. (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)

composeFlipped :: forall a b c. (a -> b) -> (b -> c) -> a -> c
composeFlipped g f x = f (g x)

flip :: forall a b c. (a -> b -> c) -> b -> a -> c
flip f y x = f x y

infixr 9 compose as <<<
infixr 9 composeFlipped as >>>

id :: forall a. a -> a
id x = x
