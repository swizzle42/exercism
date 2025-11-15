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
    case String.split "-" (clean2 str) of
        [] ->
            ""
        head :: tail ->
            String.concat <|
                head :: List.map capitalise tail


capitalise : String -> String
capitalise string =
    case String.uncons string of
        Nothing ->
            string

        Just (head, tail) ->
            String.cons (Char.toUpper head) tail


clean4 : String -> String
clean4 str =
    clean3 str |> String.filter (Char.isDigit >> not)
    

clean : String -> String
clean str =
    clean4 str |> String.filter 
        (\c -> Char.toCode c < Char.toCode 'α' || Char.toCode c > Char.toCode 'ω')
