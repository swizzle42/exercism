module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise

type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    case allergy of
        Eggs ->
            Bitwise.and 1 score /= 0

        Peanuts ->
            Bitwise.and 2 score /= 0

        Shellfish ->
            Bitwise.and 4 score /= 0

        Strawberries ->
            Bitwise.and 8 score /= 0

        Tomatoes ->
            Bitwise.and 16 score /= 0
            
        Chocolate ->
            Bitwise.and 32 score /= 0
            
        Pollen ->
            Bitwise.and 64 score /= 0        
        
        Cats ->
            Bitwise.and 128 score /= 0


toList : Int -> List Allergy
toList score =
    let
        allergenList =
            [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]

        partialScore =
            \allergy -> isAllergicTo allergy score
    in
    List.filter partialScore allergenList
        