module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Nothing ->
            "Mighty Magician"

        Just actualName ->
            actualName


revive : Player -> Maybe Player
revive player =
    if player.health > 0 then
        Nothing
    else
        if player.level >= 10 then
            Just { name = Nothing, level = player.level, health = 100, mana = Just 100}
        else 
            Just { name = Nothing, level = player.level, health = 100, mana = Nothing}
            

castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    let
        currentMana = player.mana
        currentHealth = player.health
    in
    case currentMana of
        Just actualMana ->    
            if actualMana >= manaCost then
                ( { player | mana = Just (actualMana - manaCost) }
                , manaCost * 2
                )
            else
                ( player, 0 )
        Nothing ->
            let
                newHealth = currentHealth - manaCost
            in
            if newHealth > 0 then
                ( { player | health = currentHealth - manaCost }
                , 0 
                )
            else
                ( { player | health = 0 }
                , 0 
                )