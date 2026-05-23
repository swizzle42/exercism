module DNA (toRNA) where

transform :: Char -> Char
transform 'G' = 'C'
transform 'C' = 'G'
transform 'T' = 'A'
transform 'A' = 'U'

toRNA :: String -> Either Char String
toRNA xs
    | convertable = Right (map transform xs)
    | otherwise = Left (firstInvalid xs)
    where 
        convertable = all (`elem` "CTAG") xs
        firstInvalid (c:cs)
            | c `elem` "GCTA" = firstInvalid cs
            | otherwise       = c
        firstInvalid [] = 'X'