module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
    | n > 0 = Just (helper n 0) 
    | otherwise = Nothing

helper :: (Integral t1, Num t2) => t1 -> t2 -> t2
helper k c 
    | k == 1 = c
    | even k = helper (k `div` 2) (c + 1) 
    | otherwise = helper (3 * k + 1) (c + 1)
