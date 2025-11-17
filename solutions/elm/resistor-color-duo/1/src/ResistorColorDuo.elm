module ResistorColorDuo exposing (Color(..), value)


type Color
    = Black
    | Brown
    | Red
    | Orange
    | Yellow
    | Green
    | Blue
    | Violet
    | Grey
    | White


value : List Color -> Int
value =
    List.map colorToValue 
        >> List.take 2 
        >> List.map String.fromInt 
        >> String.concat 
        >> String.toInt 
        >> Maybe.withDefault 0

colorToValue : Color -> Int
colorToValue color =
    case color of
        Black -> 
            0
            
        Brown ->
            1
            
        Red ->
            2
            
        Orange ->
            3
            
        Yellow ->
            4
            
        Green -> 
            5
            
        Blue ->
            6
            
        Violet ->
            7
            
        Grey ->
            8
            
        White ->
            9