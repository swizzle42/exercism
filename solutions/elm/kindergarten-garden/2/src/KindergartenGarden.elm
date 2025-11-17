module KindergartenGarden exposing (Plant(..), Student(..), plants)


type Student
    = Alice
    | Bob
    | Charlie
    | David
    | Eve
    | Fred
    | Ginny
    | Harriet
    | Ileana
    | Joseph
    | Kincaid
    | Larry


type Plant
    = Grass
    | Clover
    | Radish
    | Violet
    | NotRecognised


plants : String -> Student -> List Plant
plants diagram student =
    let
        rows = String.lines diagram
        extractPlants s e =
            List.map (String.slice s e) rows
                |> List.concatMap (String.toList)
                |> List.map (stringToPlant)
    in
    case student of
        Alice ->
            extractPlants 0 2

        Bob ->
            extractPlants 2 4

        Charlie ->
            extractPlants 4 6

        David ->
            extractPlants 6 8

        Eve ->
            extractPlants 8 10

        Fred ->
            extractPlants 10 12
        
        Ginny ->
            extractPlants 12 14
        
        Harriet ->
            extractPlants 14 16
        
        Ileana ->
            extractPlants 16 18
        
        Joseph ->
            extractPlants 18 20
        
        Kincaid ->
            extractPlants 20 22
        
        Larry ->
            extractPlants 22 24
            

stringToPlant : Char -> Plant
stringToPlant char =
    case char of
        'G' ->
            Grass

        'C' ->
            Clover

        'R' ->
            Radish

        'V' ->
            Violet

        _ ->
            NotRecognised