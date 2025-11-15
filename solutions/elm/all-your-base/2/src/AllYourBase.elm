module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    let
        invalidBaseInputs = List.any (\x -> x <= 0) [inBase, outBase]
        isZeroLength = List.length digits == 0
        isOnlyZero = List.all (\x -> x == 0) digits
        negativeDigits = List.any (\x -> x < 0) digits
        invalidDigits = List.any ((\b d -> d >= b) inBase) digits
        isInvalidCheck = invalidBaseInputs || isZeroLength || negativeDigits || invalidDigits || isOnlyZero
    in
    if isInvalidCheck then
        Nothing
    else
        Just 
            <| convertBase10ToBase outBase
            <| convertToBase10 inBase digits
    


-- Helpers

convertToBase10 : Int -> List Int -> Int
convertToBase10 inBase digits =
    let
        length = List.length digits
        powers = List.map ( (^) inBase ) 
                    <| List.reverse
                    <| List.range 0 (length - 1)

        positionalValues = List.map2 (*) digits powers
    in
        List.sum positionalValues


convertBase10ToBase: Int -> Int -> List Int
convertBase10ToBase outBase base10 =
    if base10 == 0 then
        []
    else
        (convertBase10ToBase outBase (base10 // outBase)) ++ [remainderBy outBase base10]