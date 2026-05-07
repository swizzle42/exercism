module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year =
    let
        divisibleByFour = year `mod` 4 == 0
        divisibleByHundred = year `mod` 100 == 0
        divisibleByFourHundred = year `mod` 400 == 0
    in
    (if divisibleByHundred then divisibleByFourHundred else divisibleByFour)
