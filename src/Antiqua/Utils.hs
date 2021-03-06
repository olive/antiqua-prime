module Antiqua.Utils where

select :: a -> a -> Bool -> a
select f t b = if b then t else f

(&&&) :: (a -> Bool) -> (a -> Bool ) -> a -> Bool
(&&&) f g x = all id [f x, g x]

(|@|) :: (a, b) -> c -> (a, b, c)
(|@|) (x, y) z = (x, y, z)

(.:) :: (a -> b) -> (x -> y -> a) -> x -> y -> b
(.:) = (.) . (.)

fold3 :: [a] -> b -> c -> (a -> b -> c -> (a, b, c)) -> ([a], b, c)
fold3 xs w y f = foldl (\(acc, w', y') x -> let (p, q, r) = f x w' y' in (p:acc, q, r)) ([], w, y) xs

fold2 :: [a] -> b -> (a -> b -> (a, b)) -> ([a], b)
fold2 xs w f = foldl (\(acc, w') x -> let (p, q) = f x w' in (p:acc, q)) ([], w) xs

-- returns the first element satisfying f, and the list with that element removed
-- this reverses the list
splitFind :: (a -> Bool) -> [a] -> Maybe (a, [a])
splitFind _ [] = Nothing
splitFind g xs =
    let inner _ _ [] = Nothing
        inner f acc (y:ys) =
            if f y
            then Just (y, acc ++ ys)
            else inner f (y:acc) ys
    in
    inner g [] xs

headOpt :: [a] -> Maybe a
headOpt (x:_) = Just x
headOpt _ = Nothing


clamp :: Ord a => a -> a -> a -> a
clamp mn mx value
    | value < mn = mn
    | value > mx = mx
    | otherwise = value
