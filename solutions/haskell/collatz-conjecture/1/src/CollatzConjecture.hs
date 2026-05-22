module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = if n > 0 then Just (helper n 0) else Nothing

helper :: (Integral t1, Num t2) => t1 -> t2 -> t2
helper 1 c = c
helper n c = if even n then helper (n `div` 2) (c + 1) else helper (3 * n + 1) (c + 1)
