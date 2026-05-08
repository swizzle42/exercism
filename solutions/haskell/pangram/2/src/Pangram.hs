module Pangram (isPangram) where
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text =
    and [ x `elem` map toLower text | x <- ['a' .. 'z'] ]
