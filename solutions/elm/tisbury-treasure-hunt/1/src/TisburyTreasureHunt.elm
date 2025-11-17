module TisburyTreasureHunt exposing (..)

type alias Treasure =
    String


type alias PlaceLocation =
    (Char, Int)

    
type alias TreasureLocation =
    (Int, Char)


type alias Place =
    String


placeLocationToTreasureLocation : PlaceLocation -> TreasureLocation
placeLocationToTreasureLocation (first, second) =
    (second, first)


treasureLocationMatchesPlaceLocation : PlaceLocation -> TreasureLocation -> Bool
treasureLocationMatchesPlaceLocation (pf, ps) (tf, ts) =
    pf == ts && ps == tf


countPlaceTreasures : ( String, ( Char, Int ) ) -> List ( String, ( Int, Char ) ) -> Int
countPlaceTreasures (name, placeLoc) treasures =
    let
        tLoc = placeLocationToTreasureLocation placeLoc
    in
    List.length 
        <| List.filter (\(_, loc) -> loc == tLoc) treasures


specialCaseSwapPossible : ( String, TreasureLocation ) -> ( String, PlaceLocation ) -> ( String, TreasureLocation ) -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case (foundTreasure, place, desiredTreasure) of
        ("Brass Spyglass", "Abandoned Lighthouse", _) ->
            True

        ("Amethyst Octopus", "Stormy Breakwater", d) ->
            case d of
                "Crystal Crab" ->
                    True
                "Glass Starfish" ->
                    True
                _ ->
                    False

        ("Vintage Pirate Hat", "Harbor Managers Office", d) ->
            case d of
                "Model Ship in Large Bottle" ->
                    True
                "Antique Glass Fishnet Float" ->
                    True
                _ ->
                    False

        _ ->
            False
