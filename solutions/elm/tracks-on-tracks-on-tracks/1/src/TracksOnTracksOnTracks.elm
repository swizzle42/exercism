module TracksOnTracksOnTracks exposing (..)


newList : List String
newList =
    []


existingList : List String
existingList =
    [ "Elm", "Clojure", "Haskell" ]


addLanguage : String -> List String -> List String
addLanguage language languages =
    language :: languages


countLanguages : List String -> Int
countLanguages languages =
    List.length languages


reverseList : List String -> List String
reverseList languages =
    List.reverse languages


excitingList : List String -> Bool
excitingList languages =
    elmIsFirst languages || (elmIsSecond languages && List.length languages <= 3)

elmIsFirst : List String -> Bool
elmIsFirst languages =
    let
        first = List.head languages
    in
    case first of
        Just language ->
            case language of
                "Elm" ->
                    True

                _ -> False

        Nothing ->
            False

elmIsSecond : List String -> Bool
elmIsSecond languages =
    case languages of
        x :: xs ->
            elmIsFirst xs

        _ ->
            False
