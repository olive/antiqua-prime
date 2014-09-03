module Antiqua.Data.NonEmpty where

import Prelude hiding (concat, head, reverse, foldl, head, tail)
import qualified Prelude (concat, reverse, foldl)
import Control.Applicative
import Data.Foldable hiding (concat, toList)
data NonEmpty t = NonEmpty t [t]


instance Functor NonEmpty where
    fmap f (NonEmpty x xs) = NonEmpty (f x) (f <$> xs)

instance Applicative NonEmpty where
    pure x = NonEmpty x []
    (NonEmpty f fs) <*> (NonEmpty x xs) = NonEmpty (f x) $ zipWith ($) fs xs

instance Monad NonEmpty where
    xs >>= f = concat (f <$> xs)
    return = pure

instance Foldable NonEmpty where
    foldr f seed (NonEmpty x []) = f x seed
    foldr f seed (NonEmpty x xs) = f x (Prelude.foldr f seed xs)

instance Show a => Show (NonEmpty a) where
    show (NonEmpty x xs) =
        "NonEmpty " Prelude.++ show x Prelude.++ " " Prelude.++ show xs

infixr 5 ++
(++) :: NonEmpty a -> NonEmpty a -> NonEmpty a
(NonEmpty x xs) ++ ne = NonEmpty x (xs Prelude.++ (toList ne))

last :: NonEmpty a -> a
last = head . reverse

foldl :: (b -> a -> b) -> b -> NonEmpty a -> b
foldl f seed ne = Prelude.foldl f seed (toList ne)



cons :: a -> NonEmpty a -> NonEmpty a
cons x (NonEmpty y ys) = NonEmpty y (x:ys)

reverse :: NonEmpty a -> NonEmpty a
reverse (NonEmpty x xs) =
    let ys = Prelude.reverse xs in
    case ys of
        (y:ys') -> NonEmpty y (ys' Prelude.++ [x])
        [] -> NonEmpty x []

toList :: NonEmpty a -> [a]
toList (NonEmpty x xs) = x:xs

concat :: NonEmpty (NonEmpty x) -> NonEmpty x
concat (NonEmpty (NonEmpty x xs) xxs) = NonEmpty x (Prelude.concat (xs:(toList <$> xxs)))

head :: NonEmpty a -> a
head (NonEmpty x _) = x

tail :: NonEmpty a -> [a]
tail (NonEmpty _ xs) = xs
