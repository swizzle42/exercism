module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    let
        invalidBaseInputs = checkInvalidBaseInputs inBase outBase
        isZeroLength = List.length digits == 0
        isOnlyZero = checkOnlyZeros digits
        negativeDigits = List.any isNegative digits
        invalidDigits = List.any (isInvalidDigit inBase) digits
        isInvalidCheck = invalidBaseInputs || isZeroLength || negativeDigits || invalidDigits || isOnlyZero
    in
    if isInvalidCheck then
        Nothing
    else
        Just 
            <| convertBase10ToBase outBase
            <| convertToBase10 inBase digits
    


-- Helpers

checkInvalidBaseInputs : Int -> Int -> Bool
checkInvalidBaseInputs inBase outBase =
    if List.any (\x -> x <= 0) [inBase, outBase] then
        True
    else
        False

checkOnlyZeros: List Int -> Bool
checkOnlyZeros digits =
    if List.all (\x -> x == 0) digits then
        True
    else
        False

isInvalidDigit : Int -> Int -> Bool
isInvalidDigit base digit =
    if digit >= base then
        True
    else
        False

isNegative: Int -> Bool
isNegative digit =
    if digit < 0 then
        True
    else
        False


isZero: Int -> Bool
isZero digit =
    if digit == 0 then
        True
    else
        False

isLessThanZero: Int -> Bool
isLessThanZero digit =
    if digit < 1 then
        True
    else
        False


convertToBase10 : Int -> List Int -> Int
convertToBase10 inBase digits =
    let
        length = List.length digits
        powers = List.map ( (^) inBase ) 
                    <| List.reverse
                    <| List.range 0 (length - 1)

        positionalValues = List.map2 (*) digits powers
    in
        List.foldr (+) 0 positionalValues


convertBase10ToBase: Int -> Int -> List Int
convertBase10ToBase outBase base10 =
    if base10 == 0 then
        []
    else
        (convertBase10ToBase outBase (base10 // outBase)) ++ [remainderBy outBase base10]