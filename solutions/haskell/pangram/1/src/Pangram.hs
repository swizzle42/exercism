module Pangram (isPangram) where
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text =
    and [ x `elem` text' | x <- ['a' .. 'z'] ] where text' = [toLower x | x <- text]
