module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

-- TODO: define the remainingTimeInMinutes function
remainingTimeInMinutes: Int -> Int -> Int
remainingTimeInMinutes layers elapsed =
    let
        expectedMinutesInOven = 40
        preparationTimeInMinutes = (\l -> l * 2) layers
    in
    (preparationTimeInMinutes + expectedMinutesInOven) - elapsed
        
