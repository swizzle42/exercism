module Bob (responseFor) where

responseFor :: String -> String
responseFor string
    | isSilence = "Fine. Be that way!"
    | isQuestion && isYelling = "Calm down, I know what I'm doing!"
    | isYelling = "Whoa, chill out!"
    | isQuestion = "Sure."
    | otherwise = "Whatever."
    where
        cleaned = reverse (dropWhile isWhitespace (reverse string))

        isSilence = all isWhitespace string

        isQuestion = not (null cleaned) && last cleaned == '?'

        hasUppercase = any (`elem` ['A'..'Z']) cleaned
        hasLowercase = any (`elem` ['a'..'z']) cleaned
        isYelling = hasUppercase && not hasLowercase

        isWhitespace c = c `elem` " \t\n\r"