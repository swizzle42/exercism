module BettysBikeShop exposing (penceToPounds, poundsToString)

import String

penceToPounds pence =
    toFloat pence / 100.0


poundsToString pounds =
    "£" ++ String.fromFloat pounds
