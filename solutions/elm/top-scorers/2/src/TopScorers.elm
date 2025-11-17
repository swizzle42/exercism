module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)


updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName playerGoalCounts =
    let
        partialUpdate =
            \func -> Dict.update playerName func playerGoalCounts
    in
    case Dict.get playerName playerGoalCounts of
        Just numGoals ->
            partialUpdate (\_ -> Just (numGoals + 1))
        Nothing ->
            partialUpdate (\_ -> Just 1)
                

aggregateScorers : List PlayerName -> Dict PlayerName Int
aggregateScorers playerNames =
    List.foldl updateGoalCountForPlayer Dict.empty playerNames


removeInsignificantPlayers : Int -> Dict PlayerName Int -> Dict PlayerName Int
removeInsignificantPlayers goalThreshold playerGoalCounts =
    Dict.filter (\_ goals -> goals >= goalThreshold) playerGoalCounts


resetPlayerGoalCount : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
resetPlayerGoalCount playerName playerGoalCounts =
    Dict.insert playerName 0 playerGoalCounts


formatPlayer : PlayerName -> Dict PlayerName Int -> String
formatPlayer playerName playerGoalCounts =
    Dict.get playerName playerGoalCounts
        |> Maybe.withDefault 0
        |> String.fromInt
        |> (++) (playerName ++ ": ")


formatPlayers : Dict PlayerName Int -> String
formatPlayers =
    Dict.toList 
        >> List.map (\(k, v) -> k ++ ": " ++ String.fromInt v) 
        >> List.intersperse ", " 
        >> String.concat


combineGames : Dict PlayerName Int -> Dict PlayerName Int -> Dict PlayerName Int
combineGames game1 game2 =
    Dict.merge
        (\player goals -> Dict.insert player goals)
        (\player goalsL goalsR -> Dict.insert player (goalsL + goalsR))
        (\player goals -> Dict.insert player goals)
        game1
        game2
        Dict.empty
        
