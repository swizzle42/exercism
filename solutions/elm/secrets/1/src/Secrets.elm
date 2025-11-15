module Secrets exposing (clearBits, decrypt, flipBits, setBits, shiftBack)

import Bitwise

shiftBack amount value =
    Bitwise.shiftRightZfBy amount value


setBits mask value =
    Bitwise.or value mask


flipBits mask value =
    Bitwise.xor value mask


clearBits mask value =
    Bitwise.and value (Bitwise.complement mask)


decrypt secret =
    setBits 1996 secret
        |> flipBits 2009
        |> shiftBack 5
        |> clearBits 33
