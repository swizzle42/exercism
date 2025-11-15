module Grains exposing (square)


square : Int -> Maybe Int
square n =
    if n <= 64 && n > 0 then
        Just ( 2 ^ ( n - 1 ) )
    else
        Nothing