module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)

clean1 : String -> String
clean1 str =
    String.replace " " "_" str    


clean2 : String -> String
clean2 str =
    let
        new = "[CTRL]"
    in
    String.replace "\n" new
        <| String.replace "\t" new
        <| String.replace "\r" new
        <| clean1 str
    


clean3 : String -> String
clean3 str =
    let                       
        workList = String.split "-" <| clean2 str
        firstWord = Maybe.withDefault "" (List.head workList)
        capitaliseWord = 
            (\string -> extractFirstChar string |> capitaliseChar |> formStringFromTuple)
        remainingWords = List.map capitaliseWord <| Maybe.withDefault [] (List.tail workList)  
    in
    String.concat <| firstWord :: remainingWords


clean4 : String -> String
clean4 str =
    String.filter (\c -> not (Char.isDigit c)) <| clean3 str
    

clean : String -> String
clean str =
    let
        workList = String.toList <| clean4 str
        alphaLower = 0x03B1
        omegaLower = 0x03C9
        greekList = List.range alphaLower omegaLower
        removedList = 
            List.map (Char.fromCode)
                <| List.filter (\x -> not ( List.member x greekList ))
                <| List.map (Char.toCode) workList
    in
    String.fromList removedList
    

-- Helpers

extractFirstChar: String -> (Char, String)
extractFirstChar string =
    Maybe.withDefault ('0', "") <| String.uncons string

capitaliseChar: (Char, String) -> (Char, String)
capitaliseChar tuple =
    Tuple.mapFirst Char.toUpper tuple
    
formStringFromTuple: (Char, String) -> String
formStringFromTuple ( char, string ) =
    String.cons char string